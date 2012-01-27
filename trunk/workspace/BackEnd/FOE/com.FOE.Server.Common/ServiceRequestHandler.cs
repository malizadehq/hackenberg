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

            //throw new FOEServiceException(FOEStatusCodes.Debug, "lol");

            _context.DB_Users.InsertOnSubmit(da_user);
            _context.SubmitChanges();

            return da_user.ToUser(FOEDataInclusion.Everything);
        }
    }
}
