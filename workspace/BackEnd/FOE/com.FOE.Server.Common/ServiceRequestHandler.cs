using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.FOE.DataModel.Users;
using com.FOE.Server.DataAccess.Database;
using com.FOE.Server.DataAccess;
using com.FOE.Server.Interface;
using com.FOE.DataModel.Sessions;
using com.FOE.DataModel.Invites;

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


        /// <summary>
        /// Looks up the loginSession provided and returns the user saved in that session.
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        public User GetUserBySession(Guid session)
        {
            DB_User da_user = (from s in _context.DB_LoginSessions where s.Id == session select s.DB_User).FirstOrDefault();
            if (da_user == null)
                throw new FOEServiceException(FOEStatusCodes.InvalidSession);

            return da_user.ToUser(FOEDataInclusion.Everything);  
        }


        /// <summary>
        /// Sends out invites to the affected users. Returns the Guid of the resulting game session.
        /// </summary>
        /// <param name="invitingUser"></param>
        /// <param name="otherUser1"></param>
        /// <param name="otherUser2"></param>
        /// <param name="otherUser3"></param>
        /// <param name="otherUser4"></param>
        /// <returns></returns>
        public GameSession StartGameSession(User invitingUser, string otherUser1, string otherUser2, string otherUser3, string otherUser4)
        {
            GameSession gameSession = CreateGameSession();
            //GetUserByUserName will except if a user is not found, so we can just add users to a list without checking.
            UserList otherUsers = new UserList();
            otherUsers.Add(GetUserByUserName(otherUser1));
            otherUsers.Add(GetUserByUserName(otherUser2));
            otherUsers.Add(GetUserByUserName(otherUser3));
            otherUsers.Add(GetUserByUserName(otherUser4));

            //Create invitations for all the other users.
            foreach (User user in otherUsers)
            {
                Invite invite = CreateGameSessionInvite(invitingUser, gameSession, user);
                SendGameSessionInvite(invite);
            }

            //Add yourself as an invited user and set Status to accepted from the start.
            Invite selfInvite = CreateGameSessionInvite(invitingUser, gameSession, invitingUser);
            selfInvite.Status = (int)DB_Invite.InviteStatus.Accepted;
            DB_Invite.FromInvite(selfInvite, _context);

            return gameSession;
        }


        /// <summary>
        /// Notifies the invited user of the invite.
        /// </summary>
        /// <param name="invite"></param>
        public void SendGameSessionInvite(Invite invite)
        {
            //TODO: Send messages to the clients... somehow.
        }


        /// <summary>
        /// Creates a GameSessionInvite in the database from one user to another.
        /// </summary>
        /// <param name="invitingUser"></param>
        /// <param name="gameSession"></param>
        /// <param name="user"></param>
        /// <returns></returns>
        public Invite CreateGameSessionInvite(User invitingUser, GameSession gameSession, User user)
        {
            DB_Invite da_invite = DB_Invite.FromInvite(new Invite() { Id = Guid.NewGuid(), InvitedUser = user.Id.Value, InvitingUser = invitingUser.Id.Value, Status = (int)DB_Invite.InviteStatus.Pending }, _context);
            return da_invite.ToInvite();
        }


        /// <summary>
        /// Creates a game session and returns it.
        /// </summary>
        /// <returns></returns>
        public GameSession CreateGameSession()
        {
            DB_GameSession da_gameSession = DB_GameSession.FromGameSession(new GameSession() { Id = Guid.NewGuid() }, _context);
            if (da_gameSession == null)
                throw new FOEServiceException(FOEStatusCodes.InternalError, "Creation of GameSession failed.");

            return da_gameSession.ToGameSession();
        }
    }
}
