using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.FOE.DataModel.Users;
using com.FOE.Server.DataAccess.Database;
using com.FOE.Server.DataAccess;
using com.FOE.Server.Interface;

namespace com.FOE.Server.Common
{
    public class ServiceRequestHandler : RequestHandler
    {
        #region Constructors

        /// <summary>
        /// 
        /// </summary>
        /// <param name="session"></param>
        public ServiceRequestHandler(Guid session)
            : base(session)
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public ServiceRequestHandler()
            : base()
        {

        }

        #endregion

        /// <summary>
        /// Adds a user to the database
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public User AddUser(string userName, string password)
        {
            DB_User da_user = DB_User.FromUser(new User() { Password = password, UserName = userName }, _context);
            if (da_user == null)
                throw new FOEServiceException(FOEStatusCodes.InternalError, "Creation of user failed.");

            _context.SubmitChanges();
            return da_user.ToUser(FOEDataInclusion.Everything);
        }


        /// <summary>
        /// Logs the user in returning a sessionId.
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Guid Login(string userName, string password)
        {
            if (string.IsNullOrEmpty(userName))
                throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "Parameter UserName cannot be null");
            if (string.IsNullOrEmpty(password))
                throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "Parameter Password cannot be null.");

            User user = null;
            try
            {
                user = GetUserByUserName(userName);
            }
            catch (FOEServiceException ex)
            {
                //catch unknown user exception and throw an invalid logon instead to prevent userName fishing.
                if(ex.Reason == FOEStatusCodes.UnknownUser)
                    throw new FOEServiceException(FOEStatusCodes.InvalidLogin, string.Format("Login failed for user {0}", userName));
            }
            if (user.Password != password)
                throw new FOEServiceException(FOEStatusCodes.InvalidLogin, string.Format("Login failed for user {0}", userName));

            Guid session = Guid.NewGuid();
            DB_LoginSession da_session = new DB_LoginSession();
            da_session.Id = session;
            da_session.Timeout = DateTime.UtcNow + TimeSpan.FromHours(1);
            da_session.UserId = user.Id.Value;

            _context.DB_LoginSessions.InsertOnSubmit(da_session);
            _context.SubmitChanges();

            return session;
        }


        /// <summary>
        /// returns a User if found in the database, else throws an exception.
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public User GetUserByUserName(string userName)
        {
            DB_User da_user = (from u in _context.DB_Users where u.UserName == userName select u).FirstOrDefault();
            if (da_user == null)
                throw new FOEServiceException(FOEStatusCodes.UnknownUser, string.Format("Could not find user {0}.", userName));

            return da_user.ToUser(FOEDataInclusion.Everything);
        }
    }
}
