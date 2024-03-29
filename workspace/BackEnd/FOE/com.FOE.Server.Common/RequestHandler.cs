﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using com.FOE.Server.DataAccess.Database;
using com.FOE.Server.Interface;
using System.Data.Linq;
using com.FOE.DataModel.Users;
using com.FOE.Server.DataAccess;

namespace com.FOE.Server.Common
{
    public class RequestHandler
    {
        #region Variables

        protected FOEDatabaseDataContext _context;
        private static readonly object validateLock = new object();

        #endregion

        #region Properties

        public Guid? Session { get; private set; }
        public DB_User User { get; protected set; }

        #endregion

        #region Constructors

        /// <summary>
        /// Validates and sets Session.
        /// </summary>
        /// <param name="session"></param>
        public RequestHandler(Guid session)
            : this()
        {
            ValidateSession(session);
        }


        /// <summary>
        /// Base constructor. Establishes database connection.
        /// </summary>
        public RequestHandler()
        {
            if (_context == null)
            {
                ConnectionStringSettings connectionStringSettings = ConfigurationManager.ConnectionStrings["FOESQLServer"];
                if (connectionStringSettings == null)
                {
                    _context = new FOEDatabaseDataContext();
                }
                else
                {
                    _context = new FOEDatabaseDataContext(connectionStringSettings.ConnectionString);
                }
            }
        }

        #endregion


        /// <summary>
        /// Validates the the session is valid and bumps its Timeout. Throws InvalidSession exception if not valid. Sets Session property if session is valid.
        /// </summary>
        /// <param name="session"></param>
        private void ValidateSession(Guid session)
        {
            ClearOldSessions();
            User = (from s in _context.DB_LoginSessions where s.Id == session select s.DB_User).FirstOrDefault();
            if (User == null)
            {
                throw new FOEServiceException(FOEStatusCodes.InvalidSession);
            }
            try
            {
                lock (validateLock)
                {
                    DataAccess.Database.DB_LoginSession da_session = User.DB_LoginSessions.FirstOrDefault(s => s.Id == session);
                    if (da_session == null)
                    {
                        throw new FOEServiceException(FOEStatusCodes.InvalidSession);
                    }
                    da_session.Timeout = DateTime.UtcNow + TimeSpan.FromHours(1);
                    _context.SubmitChanges();
                    Session = session;
                }
            }
            catch (ChangeConflictException)
            {
                // This can happen if multiple request is performed
                // simultaneously on the same session.
                // Verify that the session is still valid
                // and accept the missing update.
                _context.Refresh(RefreshMode.OverwriteCurrentValues, User.DB_LoginSessions);
                if (User.DB_LoginSessions.FirstOrDefault(s => s.Id == session) == null)
                {
                    throw new FOEServiceException(FOEStatusCodes.InvalidSession);
                }
            }
        }


        /// <summary>
        /// Cleans out all LoginSessions older than their Timeout.
        /// </summary>
        private void ClearOldSessions()
        {
            _context.DB_LoginSessions.DeleteAllOnSubmit(from s in _context.DB_LoginSessions where s.Timeout <= DateTime.UtcNow select s);
            _context.SubmitChanges();
        }



    }
}
