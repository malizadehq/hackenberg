using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.Hackenberg.DataModel.Games
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Games", IsReference = false)]
    public class GameList : ObservableCollection<Game>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "game", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Games")]
    public class Game : NotifyPropertyChangedObject
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

        #region GameSessionId(gamesessionid) Property

        private Guid? _gameSessionId;
        [DataMember(Name = "gamesessionid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
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

        #region Phase(phase) Property

        private int _phase;
        [DataMember(Name = "phase", IsRequired = false, Order = 2)]
        public int Phase
        {
            get
            {
                return _phase;
            }
            set
            {
                if (value != _phase)
                {
                    _phase = value;
                    OnPropertyChanged("Phase");
                }
            }
        }

        #endregion

        #region Turn(turn) Property

        private int _turn;
        [DataMember(Name = "turn", IsRequired = true, Order = 3)]
        public int Turn
        {
            get
            {
                return _turn;
            }
            set
            {
                if (value != _turn)
                {
                    _turn = value;
                    OnPropertyChanged("Turn");
                }
            }
        }

        #endregion

        #region Name(name) Property

        private string _name;
        [DataMember(Name = "name", IsRequired = false, Order = 4)]
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                if (value != _name)
                {
                    _name = value;
                    OnPropertyChanged("Name");
                }
            }
        }

        #endregion
    }
}
