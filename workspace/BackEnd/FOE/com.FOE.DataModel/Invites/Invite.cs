using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace com.FOE.DataModel.Invites
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Invites", IsReference = false)]
    public class InviteList : ObservableCollection<Invite>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "invite", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Invites")]
    public class Invite : NotifyPropertyChangedObject
    {
        #region Id(id) Property

        private Guid? _id;
        [DataMember(Name = "id", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? Id
        {
            get
            {
                return _id;
            }
            set
            {
                if (value != _id)
                {
                    _id = value;
                    OnPropertyChanged("Id");
                }
            }
        }

        #endregion

        #region InvitingUser(invitinguser) Property

        private Guid? _invitingUser;
        [DataMember(Name = "invitinguser", IsRequired = false, EmitDefaultValue = false, Order = 1)]
        public Guid? InvitingUser
        {
            get
            {
                return _invitingUser;
            }
            set
            {
                if (value != _invitingUser)
                {
                    _invitingUser = value;
                    OnPropertyChanged("InvitingUser");
                }
            }
        }

        #endregion

        #region InvitedUser(inviteduser) Property

        private Guid? _invitedUser;
        [DataMember(Name = "inviteduser", IsRequired = false, EmitDefaultValue = false, Order = 2)]
        public Guid? InvitedUser
        {
            get
            {
                return _invitedUser;
            }
            set
            {
                if (value != _invitedUser)
                {
                    _invitedUser = value;
                    OnPropertyChanged("InvitedUser");
                }
            }
        }

        #endregion

        #region Status(status) Property

        private int _status;
        [DataMember(Name = "invitestatus", IsRequired = false, Order = 3)]
        public int Status
        {
            get
            {
                return _status;
            }
            set
            {
                if (value != _status)
                {
                    _status = value;
                    OnPropertyChanged("Status");
                }
            }
        }

        #endregion
    }
}
