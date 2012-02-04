using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.ComponentModel;
using com.FOE.DataModel.Invites;

namespace com.FOE.Server.DataAccess.Database
{
    partial class DB_Invite
    {
        /// <summary>
        /// Do NOT changed the order of these, their values are used in the database.
        /// </summary>
        public enum InviteStatus
        {
            [EnumMember]
            [Description("Invite Pending.")]
            Pending = 0,

            [EnumMember]
            [Description("Invite Accepted.")]
            Accepted = 1,

            [EnumMember]
            [Description("Invite Rejected.")]
            Rejected = 2,
        }


        /// <summary>
        /// Looks for the inviteId in teh database, if not found it creates a new DB_Invite and returns that.
        /// </summary>
        /// <param name="invite"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public static DB_Invite FromInvite(Invite invite, FOEDatabaseDataContext context)
        {
            DB_Invite da_invite = (from i in context.DB_Invites where i.Id == invite.Id.Value select i).FirstOrDefault();
            if (da_invite == null)
            {
                da_invite = new DB_Invite();
                da_invite.InvitedUser = invite.InvitedUser;
                da_invite.InvitingUser = invite.InvitingUser;
                da_invite.Id = invite.Id.Value;
                da_invite.Status = invite.Status;

                context.DB_Invites.InsertOnSubmit(da_invite);
            }
            else
            {
                //The only value thatll ever change in an invite is the status. If invite already existed in db, try to update status.
                da_invite.Status = invite.Status;
            }

            context.SubmitChanges();

            return da_invite;
        }


        /// <summary>
        /// Copies the valies of this into a new Invite object and returns that.
        /// </summary>
        /// <returns></returns>
        public Invite ToInvite()
        {
            Invite invite = new Invite();
            invite.Id = Id;
            invite.InvitedUser = InvitedUser;
            invite.InvitingUser = InvitingUser;
            invite.Status = (int)Status;

            return invite;
        }
    }
}
