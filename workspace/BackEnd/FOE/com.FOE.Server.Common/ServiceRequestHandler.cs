using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Hackenberg.DataModel.Users;
using com.Hackenberg.Server.DataAccess.Database;
using com.Hackenberg.Server.DataAccess;

namespace com.Hackenberg.Server.Common
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
        /// Addes a user to the database
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public User AddUser(string userName, string password)
        {
            DB_User da_user = DB_User.FromUser(new User() { Password = password, UserName = userName }, _context);
            _context.SubmitChanges();

            return da_user.ToUser(FOEDataInclusion.Everything);
        }
    }
}
