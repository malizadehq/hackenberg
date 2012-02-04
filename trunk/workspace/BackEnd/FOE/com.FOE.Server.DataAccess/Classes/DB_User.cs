using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.FOE.Server.DataAccess.Database;
using com.FOE.DataModel.Users;
using com.FOE.Server.Interface;

namespace com.FOE.Server.DataAccess.Database
{
    partial class DB_User
    {
        /// <summary>
        /// Extracts information from the provided User and adds it as an entity to the db.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public static DB_User FromUser(User user, FOEDatabaseDataContext context)
        {
            DB_User da_user = null;

            //Check that the user doesnt already exist in the db.
            if (user.Id.HasValue)
            {
                da_user = (from u in context.DB_Users where u.Id == user.Id.Value select u).FirstOrDefault();
                if (da_user == null)
                {
                    throw new FOEServiceException(FOEStatusCodes.UnknownUser, String.Format("Id reference to user is unknown: {0}", user.Id.Value));
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(user.UserName))
                {
                    da_user = (from u in context.DB_Users where u.UserName == user.UserName select u).FirstOrDefault();
                }
            }

            //User didnt exist, try to create it.
            if (da_user == null)
            {
                //TODO: Add canInsert check here?

                if (string.IsNullOrEmpty(user.UserName))
                    throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "Paremeter UserName cannot be null");
                if (string.IsNullOrEmpty(user.Password))
                    throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "Paremeter Password cannot be null");

                da_user = new DB_User() { Id = Guid.NewGuid(), UserName = user.UserName, Password = user.Password };
                context.DB_Users.InsertOnSubmit(da_user);
                context.SubmitChanges();
            }
            else
            {
                //TODO: Add canUpdate check here?

                if (!string.IsNullOrEmpty(user.Password))
                    da_user.Password = user.Password;

                if (!string.IsNullOrEmpty(user.UserName))
                    da_user.UserName = user.UserName;
            }

            if (da_user == null)
                throw new FOEServiceException(FOEStatusCodes.InternalError, "Unable to create DB_User");

            return da_user;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public User ToUser(FOEDataInclusion level)
        {
            return new User() { Id = this.Id, Password = this.Password, UserName = this.UserName };
        }
    }
}
