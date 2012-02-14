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
using com.FOE.DataModel.Games;
using com.FOE.Common;

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
        /// <param name="email"></param>
        /// <returns></returns>
        public User AddUser(string userName, string password, string email)
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
        public Game StartGame(User invitingUser, string otherUser1, string otherUser2, string otherUser3, string otherUser4)
        {
            Game gameSession = CreateGame();
            //GetUserByUserName will except if a user is not found, so we can just add users to a list without checking.
            UserList otherUsers = new UserList();
            otherUsers.Add(GetUserByUserName(otherUser1));
            otherUsers.Add(GetUserByUserName(otherUser2));
            otherUsers.Add(GetUserByUserName(otherUser3));
            otherUsers.Add(GetUserByUserName(otherUser4));

            //Create invitations for all the other users.
            foreach (User user in otherUsers)
            {
                Invite invite = CreateGameInvite(invitingUser, gameSession, user);
                SendGameInvite(invite);
            }

            //Add yourself as an invited user and set Status to accepted from the start.
            Invite selfInvite = CreateGameInvite(invitingUser, gameSession, invitingUser);
            DB_Invite.FromInvite(selfInvite, _context);
            AcceptGameInvite(invitingUser, selfInvite.Id.Value);

            return gameSession;
        }


        /// <summary>
        /// Notifies the invited user of the invite.
        /// </summary>
        /// <param name="invite"></param>
        public void SendGameInvite(Invite invite)
        {
            //TODO: Send messages to the clients... somehow.
        }


        /// <summary>
        /// Creates a GameInvite in the database from one user to another.
        /// </summary>
        /// <param name="invitingUser"></param>
        /// <param name="gameSession"></param>
        /// <param name="user"></param>
        /// <returns></returns>
        public Invite CreateGameInvite(User invitingUser, Game game, User user)
        {
            DB_Invite da_invite = DB_Invite.FromInvite(new Invite()
            {
                Id = Guid.NewGuid(),
                InvitedUser = user.Id.Value,
                InvitingUser = invitingUser.Id.Value,
                Status = (int)DB_Invite.InviteStatus.Pending,
                GameId = game.Id.Value
            }, _context);
            return da_invite.ToInvite();
        }


        /// <summary>
        /// Creates a game and returns it.
        /// </summary>
        /// <returns></returns>
        public Game CreateGame()
        {
            DB_Game da_game = DB_Game.FromGame(new Game()
            {   
                Id = Guid.NewGuid(),
                MapId = DB_Map.DefaultMapId,
                GermanPlayer = DB_User.MockUserId,
                JapanesePlayer = DB_User.MockUserId,
                AmericanPlayer = DB_User.MockUserId,
                EnglishPlayer = DB_User.MockUserId,
                RussianPlayer = DB_User.MockUserId,
                Phase = (int)DB_Game.GamePhases.None,
                Turn = 0,
                Name = string.Format("{0}'s game", User.UserName),
                IsActive = false
            }, _context);
            if (da_game == null)
                throw new FOEServiceException(FOEStatusCodes.InternalError, "Creation of Game failed.");

            return da_game.ToGame();
        }


        /// <summary>
        /// Accepts a GameInvite.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="InviteId"></param>
        public void AcceptGameInvite(User user, Guid InviteId)
        {
            DB_Invite da_invite = (from i in _context.DB_Invites where i.Id == InviteId select i).FirstOrDefault();
            if (da_invite == null)
                throw new FOEServiceException(FOEStatusCodes.UnknownGameInvite);

            da_invite.Status = (int)DB_Invite.InviteStatus.Accepted;
            _context.SubmitChanges();

            AttemptGameStart(da_invite.DB_Game);
        }


        /// <summary>
        /// Looks for all invites to the provided game session. If all are accepted, start the game.
        /// </summary>
        /// <param name="guid"></param>
        public void AttemptGameStart(DB_Game da_game)
        {
            var gameInvites = from i in _context.DB_Invites where i.GameId == da_game.Id select i;
            if (gameInvites.Count<DB_Invite>() < 5)
                throw new FOEServiceException(FOEStatusCodes.InternalError, "Game start attempted with fewer than 5 players");

            //Check if all invites are accepted. else we just wont start the game.
            bool allInvitesAccepted = true;
            List<DB_User> invitedUsers = new List<DB_User>();
            foreach (DB_Invite invite in gameInvites)
            {
                if (invite.Status != (int)DB_Invite.InviteStatus.Accepted)
                {
                    allInvitesAccepted = false;
                    break;
                }
                invitedUsers.Add((from u in _context.DB_Users where u.Id == invite.InvitedUser.Value select u).FirstOrDefault());
            }

            if (allInvitesAccepted == true)
            {
                //Randomize which user that plays which nation.
                //TODO: Add ability to pick nations?
                Random rnd = new Random();
                DB_User da_user = invitedUsers.OrderBy(x => rnd.Next()).FirstOrDefault();
                da_game.GermanPlayer = da_user.Id;
                SendEventToUser(da_user.ToUser(FOEDataInclusion.Everything), GameEvents.GameStarted);
                invitedUsers.Remove(da_user);

                da_user = invitedUsers.OrderBy(x => rnd.Next()).FirstOrDefault();
                da_game.JapanesePlayer = da_user.Id;
                SendEventToUser(da_user.ToUser(FOEDataInclusion.Everything), GameEvents.GameStarted);
                invitedUsers.Remove(da_user);

                da_user = invitedUsers.OrderBy(x => rnd.Next()).FirstOrDefault();
                da_game.AmericanPlayer = da_user.Id;
                SendEventToUser(da_user.ToUser(FOEDataInclusion.Everything), GameEvents.GameStarted);
                invitedUsers.Remove(da_user);

                da_user = invitedUsers.OrderBy(x => rnd.Next()).FirstOrDefault();
                da_game.EnglishPlayer = da_user.Id;
                SendEventToUser(da_user.ToUser(FOEDataInclusion.Everything), GameEvents.GameStarted);
                invitedUsers.Remove(da_user);

                da_game.RussianPlayer = invitedUsers.FirstOrDefault().Id;
                SendEventToUser(invitedUsers.FirstOrDefault().ToUser(FOEDataInclusion.Everything), GameEvents.GameStarted);
                da_game.IsActive = true;
                da_game.Phase = (int)DB_Game.GamePhases.Buy;
                da_game.Turn = 0;

                _context.DB_Invites.DeleteAllOnSubmit(gameInvites);
                _context.SubmitChanges();

            }
        }


        /// <summary>
        /// Sends an event to a user (e.g. GameStarted or YourTurn).
        /// </summary>
        /// <param name="user"></param>
        public void SendEventToUser(User user, GameEvents whatEvent)
        {
            //TODO: Implement... How to message clients?
        }
    }
}
