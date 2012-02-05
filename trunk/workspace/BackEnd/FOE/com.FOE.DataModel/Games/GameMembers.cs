using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Games
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125com.FOE.DataModel.Games", IsReference = false)]
    public class GameMemberList : ObservableCollection<GameMember>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "gamemember", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Games")]
    public class GameMember : NotifyPropertyChangedObject
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

        #region GameId(gameid) Property

        private Guid? _gameId;
        [DataMember(Name = "gameid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
        public Guid? GameId
        {
            get
            {
                return _gameId;
            }
            set
            {
                if (value != _gameId)
                {
                    _gameId = value;
                    OnPropertyChanged("GameId");
                }
            }
        }

        #endregion
    }
}
