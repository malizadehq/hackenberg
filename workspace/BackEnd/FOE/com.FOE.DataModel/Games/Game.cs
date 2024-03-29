﻿using System;
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
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Games", IsReference = false)]
    public class GameList : ObservableCollection<Game>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "game", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Games")]
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

        #region MapId(mapid) Property

        private Guid? _mapId;
        [DataMember(Name = "mapid", IsRequired = true, EmitDefaultValue = false, Order = 2)]
        public Guid? MapId
        {
            get
            {
                return _mapId;
            }
            set
            {
                if (value != _mapId)
                {
                    _mapId = value;
                    OnPropertyChanged("MapId");
                }
            }
        }

        #endregion

        #region Phase(phase) Property

        private int _phase;
        [DataMember(Name = "phase", IsRequired = false, Order = 3)]
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
        [DataMember(Name = "turn", IsRequired = true, Order = 4)]
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
        [DataMember(Name = "name", IsRequired = false, Order = 5)]
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

        #region GermanPlayer(germanplayer) Property

        private Guid? _germanPlayer;
        [DataMember(Name = "germanplayer", IsRequired = true, EmitDefaultValue = false, Order = 6)]
        public Guid? GermanPlayer
        {
            get
            {
                return _germanPlayer;
            }
            set
            {
                if (value != _germanPlayer)
                {
                    _germanPlayer = value;
                    OnPropertyChanged("GermanPlayer");
                }
            }
        }

        #endregion

        #region JapanesePlayer(japaneseplayer) Property

        private Guid? _japanesePlayer;
        [DataMember(Name = "japaneseplayer", IsRequired = true, EmitDefaultValue = false, Order = 7)]
        public Guid? JapanesePlayer
        {
            get
            {
                return _japanesePlayer;
            }
            set
            {
                if (value != _japanesePlayer)
                {
                    _japanesePlayer = value;
                    OnPropertyChanged("JapanesePlayer");
                }
            }
        }

        #endregion

        #region AmericanPlayer(americanplayer) Property

        private Guid? _americanPlayer;
        [DataMember(Name = "americanplayer", IsRequired = true, EmitDefaultValue = false, Order = 8)]
        public Guid? AmericanPlayer
        {
            get
            {
                return _americanPlayer;
            }
            set
            {
                if (value != _americanPlayer)
                {
                    _americanPlayer = value;
                    OnPropertyChanged("AmericanPlayer");
                }
            }
        }

        #endregion

        #region EnglishPlayer(englishplayer) Property

        private Guid? _englishPlayer;
        [DataMember(Name = "englishplayer", IsRequired = true, EmitDefaultValue = false, Order = 9)]
        public Guid? EnglishPlayer
        {
            get
            {
                return _englishPlayer;
            }
            set
            {
                if (value != _englishPlayer)
                {
                    _englishPlayer = value;
                    OnPropertyChanged("EnglishPlayer");
                }
            }
        }

        #endregion

        #region RussianPlayer(russianplayer) Property

        private Guid? _russianPlayer;
        [DataMember(Name = "russianplayer", IsRequired = true, EmitDefaultValue = false, Order = 10)]
        public Guid? RussianPlayer
        {
            get
            {
                return _russianPlayer;
            }
            set
            {
                if (value != _russianPlayer)
                {
                    _russianPlayer = value;
                    OnPropertyChanged("RussianPlayer");
                }
            }
        }

        #endregion

        #region IsActive(isactive) Property

        private bool _isActive;
        [DataMember(Name = "isactive", IsRequired = false, Order = 11)]
        public bool IsActive
        {
            get
            {
                return _isActive;
            }
            set
            {
                if (value != _isActive)
                {
                    _isActive = value;
                    OnPropertyChanged("IsActive");
                }
            }
        }

        #endregion
    }
}
