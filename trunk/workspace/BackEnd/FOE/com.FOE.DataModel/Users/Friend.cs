using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Users
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Users", IsReference = false)]
    public class FriendList : ObservableCollection<Friend>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "friend", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Users")]
    public class Friend : NotifyPropertyChangedObject
    {
        #region UserId(userid) Property

        private Guid? _userId;
        [DataMember(Name = "userid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? UserId
        {
            get
            {
                return _userId;
            }
            set
            {
                if (value != _userId)
                {
                    _userId = value;
                    OnPropertyChanged("UserId");
                }
            }
        }

        #endregion

        #region FriendId(friendid) Property

        private Guid? _friendId;
        [DataMember(Name = "friendid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
        public Guid? FriendId
        {
            get
            {
                return _friendId;
            }
            set
            {
                if (value != _friendId)
                {
                    _friendId = value;
                    OnPropertyChanged("FriendId");
                }
            }
        }

        #endregion
    }
}
