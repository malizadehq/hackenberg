using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.FOE.DataModel.Sessions;
using com.FOE.Server.Interface;

namespace com.FOE.Server.DataAccess.Database
{
    partial class DB_GameSession
    {
        /// <summary>
        /// Looks for the gameSession in the database. If not found it will be created.
        /// </summary>
        /// <param name="session"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public static DB_GameSession FromGameSession(GameSession session, FOEDatabaseDataContext context)
        {
            DB_GameSession da_gameSession = (from s in context.DB_GameSessions where s.Id == session.Id.Value select s).FirstOrDefault();
            if (da_gameSession == null)
            {
                da_gameSession = new DB_GameSession();
                da_gameSession.Id = session.Id.Value;

                context.DB_GameSessions.InsertOnSubmit(da_gameSession);
                context.SubmitChanges(); 
            }

            return da_gameSession;
        }


        /// <summary>
        /// Creates a GameSession objkect with the same parameters as this and returns it.
        /// </summary>
        /// <returns></returns>
        public GameSession ToGameSession()
        {
            return new GameSession() { Id = Id };
        }
    }
}
