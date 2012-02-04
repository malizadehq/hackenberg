using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Sessions
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Sessions", IsReference = false)]
    public class GameSessionMemberList : ObservableCollection<GameSessionMember>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "gamesessionmember", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Sessions")]
    public class GameSessionMember : NotifyPropertyChangedObject
    {
        #region GameSessionId(gamesessionid) Property

        private Guid? _gameSessionId;
        [DataMember(Name = "gamesessionid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? GameSessionId
        {
            get
            {
                return _gameSessionId;
            }
            set
            {
                if (value != _gameSessionId)
                {
                    _gameSessionId = value;
                    OnPropertyChanged("GameSessionId");
                }
            }
        }

        #endregion

        #region UserId(userid) Property

        private Guid? _userId;
        [DataMember(Name = "userid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
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
    }
}
