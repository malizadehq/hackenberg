using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Stats
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Stats", IsReference = false)]
    public class StatList : ObservableCollection<Stat>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "stat", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Stats")]
    public class Stat : NotifyPropertyChangedObject
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

        #region GamesPlayed(gamesplayed) Property

        private int _gamesPlayed;
        [DataMember(Name = "gamesplayed", IsRequired = false, EmitDefaultValue = false, Order = 2)]
        public int GamesPlayed
        {
            get
            {
                return _gamesPlayed;
            }
            set
            {
                if (value != _gamesPlayed)
                {
                    _gamesPlayed = value;
                    OnPropertyChanged("GamesPlayed");
                }
            }
        }

        #endregion

        #region GamesWon(gameswon) Property

        private int _gamesWon;
        [DataMember(Name = "gameswon", IsRequired = false, EmitDefaultValue = false, Order = 3)]
        public int GamesWon
        {
            get
            {
                return _gamesWon;
            }
            set
            {
                if (value != _gamesWon)
                {
                    _gamesWon = value;
                    OnPropertyChanged("GamesWon");
                }
            }
        }

        #endregion

        #region GamesLost(gameslost) Property

        private int _gamesLost;
        [DataMember(Name = "gameslost", IsRequired = false, EmitDefaultValue = false, Order = 4)]
        public int GamesLost
        {
            get
            {
                return _gamesLost;
            }
            set
            {
                if (value != _gamesLost)
                {
                    _gamesLost = value;
                    OnPropertyChanged("GamesLost");
                }
            }
        }

        #endregion

        #region InfantryKilled(infantrykilled) Property

        private int _infantryKilled;
        [DataMember(Name = "infantrykilled", IsRequired = false, EmitDefaultValue = false, Order = 5)]
        public int InfantryKilled
        {
            get
            {
                return _infantryKilled;
            }
            set
            {
                if (value != _infantryKilled)
                {
                    _infantryKilled = value;
                    OnPropertyChanged("InfantryKilled");
                }
            }
        }

        #endregion

        #region TanksKilled(tankskilled) Property

        private int _tanksKilled;
        [DataMember(Name = "tankskilled", IsRequired = false, EmitDefaultValue = false, Order = 6)]
        public int TanksKilled
        {
            get
            {
                return _tanksKilled;
            }
            set
            {
                if (value != _tanksKilled)
                {
                    _tanksKilled = value;
                    OnPropertyChanged("TanksKilled");
                }
            }
        }

        #endregion

        #region FightersKilled(fighterskilled) Property

        private int _fightersKilled;
        [DataMember(Name = "fighterskilled", IsRequired = false, EmitDefaultValue = false, Order = 7)]
        public int FightersKilled
        {
            get
            {
                return _fightersKilled;
            }
            set
            {
                if (value != _fightersKilled)
                {
                    _fightersKilled = value;
                    OnPropertyChanged("FightersKilled");
                }
            }
        }

        #endregion

        #region BombersKilled(bomberskilled) Property

        private int _bombersKilled;
        [DataMember(Name = "bomberskilled", IsRequired = false, EmitDefaultValue = false, Order = 8)]
        public int BombersKilled
        {
            get
            {
                return _bombersKilled;
            }
            set
            {
                if (value != _bombersKilled)
                {
                    _bombersKilled = value;
                    OnPropertyChanged("BombersKilled");
                }
            }
        }

        #endregion

        #region BattleshipsKilled(battleshipskilled) Property

        private int _battleshipsKilled;
        [DataMember(Name = "battleshipskilled", IsRequired = false, EmitDefaultValue = false, Order = 9)]
        public int BattleshipsKilled
        {
            get
            {
                return _battleshipsKilled;
            }
            set
            {
                if (value != _battleshipsKilled)
                {
                    _battleshipsKilled = value;
                    OnPropertyChanged("BattleshipsKilled");
                }
            }
        }

        #endregion

        #region TransportsKilled(transportskilled) Property

        private int _transportsKilled;
        [DataMember(Name = "transportskilled", IsRequired = false, EmitDefaultValue = false, Order = 10)]
        public int TransportsKilled
        {
            get
            {
                return _transportsKilled;
            }
            set
            {
                if (value != _transportsKilled)
                {
                    _transportsKilled = value;
                    OnPropertyChanged("TransportsKilled");
                }
            }
        }

        #endregion

        #region SubsKilled(subskilled) Property

        private int _subsKilled;
        [DataMember(Name = "subskilled", IsRequired = false, EmitDefaultValue = false, Order = 11)]
        public int SubsKilled
        {
            get
            {
                return _subsKilled;
            }
            set
            {
                if (value != _subsKilled)
                {
                    _subsKilled = value;
                    OnPropertyChanged("SubsKilled");
                }
            }
        }

        #endregion

        #region InfantryLost(infantrylost) Property

        private int _infantryLost;
        [DataMember(Name = "infantrylost", IsRequired = false, EmitDefaultValue = false, Order = 12)]
        public int InfantryLost
        {
            get
            {
                return _infantryLost;
            }
            set
            {
                if (value != _infantryLost)
                {
                    _infantryLost = value;
                    OnPropertyChanged("InfantryLost");
                }
            }
        }

        #endregion

        #region TanksLost(tankslost) Property

        private int _tanksLost;
        [DataMember(Name = "tankslost", IsRequired = false, EmitDefaultValue = false, Order = 13)]
        public int TanksLost
        {
            get
            {
                return _tanksLost;
            }
            set
            {
                if (value != _tanksLost)
                {
                    _tanksLost = value;
                    OnPropertyChanged("TanksLost");
                }
            }
        }

        #endregion

        #region FightersLost(fighterslost) Property

        private int _fightersLost;
        [DataMember(Name = "fighterslost", IsRequired = false, EmitDefaultValue = false, Order = 14)]
        public int FightersLost
        {
            get
            {
                return _fightersLost;
            }
            set
            {
                if (value != _fightersLost)
                {
                    _fightersLost = value;
                    OnPropertyChanged("FightersLost");
                }
            }
        }

        #endregion

        #region BombersLost(bomberslost) Property

        private int _bombersLost;
        [DataMember(Name = "bomberslost", IsRequired = false, EmitDefaultValue = false, Order = 15)]
        public int BombersLost
        {
            get
            {
                return _bombersLost;
            }
            set
            {
                if (value != _bombersLost)
                {
                    _bombersLost = value;
                    OnPropertyChanged("BombersLost");
                }
            }
        }

        #endregion

        #region BattleshipsLost(battleshipslost) Property

        private int _battleshipsLost;
        [DataMember(Name = "battleshipslost", IsRequired = false, EmitDefaultValue = false, Order = 16)]
        public int BattleshipsLost
        {
            get
            {
                return _battleshipsLost;
            }
            set
            {
                if (value != _battleshipsLost)
                {
                    _battleshipsLost = value;
                    OnPropertyChanged("BattleshipsLost");
                }
            }
        }

        #endregion

        #region TransportsLost(transportslost) Property

        private int _transportsLost;
        [DataMember(Name = "transportslost", IsRequired = false, EmitDefaultValue = false, Order = 17)]
        public int TransportsLost
        {
            get
            {
                return _transportsLost;
            }
            set
            {
                if (value != _transportsLost)
                {
                    _transportsLost = value;
                    OnPropertyChanged("TransportsLost");
                }
            }
        }

        #endregion

        #region SubsLost(subslost) Property

        private int _subsLost;
        [DataMember(Name = "subslost", IsRequired = false, EmitDefaultValue = false, Order = 18)]
        public int SubsLost
        {
            get
            {
                return _subsLost;
            }
            set
            {
                if (value != _subsLost)
                {
                    _subsLost = value;
                    OnPropertyChanged("SubsLost");
                }
            }
        }

        #endregion

        #region InfantryBuilt(infantrybuilt) Property

        private int _infantryBuilt;
        [DataMember(Name = "infantrybuilt", IsRequired = false, EmitDefaultValue = false, Order = 19)]
        public int InfantryBuilt
        {
            get
            {
                return _infantryBuilt;
            }
            set
            {
                if (value != _infantryBuilt)
                {
                    _infantryBuilt = value;
                    OnPropertyChanged("InfantryBuilt");
                }
            }
        }

        #endregion

        #region TanksBuilt(tanksbuilt) Property

        private int _tanksBuilt;
        [DataMember(Name = "tanksbuilt", IsRequired = false, EmitDefaultValue = false, Order = 20)]
        public int TanksBuilt
        {
            get
            {
                return _tanksBuilt;
            }
            set
            {
                if (value != _tanksBuilt)
                {
                    _tanksBuilt = value;
                    OnPropertyChanged("TanksBuilt");
                }
            }
        }

        #endregion

        #region FightersBuilt(fightersbuilt) Property

        private int _fightersBuilt;
        [DataMember(Name = "fightersbuilt", IsRequired = false, EmitDefaultValue = false, Order = 21)]
        public int FightersBuilt
        {
            get
            {
                return _fightersBuilt;
            }
            set
            {
                if (value != _fightersBuilt)
                {
                    _fightersBuilt = value;
                    OnPropertyChanged("FightersBuilt");
                }
            }
        }

        #endregion

        #region BombersBuilt(bombersbuilt) Property

        private int _bombersBuilt;
        [DataMember(Name = "bombersbuilt", IsRequired = false, EmitDefaultValue = false, Order = 22)]
        public int BombersBuilt
        {
            get
            {
                return _bombersBuilt;
            }
            set
            {
                if (value != _bombersBuilt)
                {
                    _bombersBuilt = value;
                    OnPropertyChanged("BombersBuilt");
                }
            }
        }

        #endregion

        #region BattleshipsBuilt(battleshipsbuilt) Property

        private int _battleshipsBuilt;
        [DataMember(Name = "battleshipsbuilt", IsRequired = false, EmitDefaultValue = false, Order = 23)]
        public int BattleshipsBuilt
        {
            get
            {
                return _battleshipsBuilt;
            }
            set
            {
                if (value != _battleshipsBuilt)
                {
                    _battleshipsBuilt = value;
                    OnPropertyChanged("BattleshipsBuilt");
                }
            }
        }

        #endregion

        #region TransportsBuilt(transportsbuilt) Property

        private int _transportsBuilt;
        [DataMember(Name = "transportsbuilt", IsRequired = false, EmitDefaultValue = false, Order = 24)]
        public int TransportsBuilt
        {
            get
            {
                return _transportsBuilt;
            }
            set
            {
                if (value != _transportsBuilt)
                {
                    _transportsBuilt = value;
                    OnPropertyChanged("TransportsBuilt");
                }
            }
        }

        #endregion

        #region SubsBuilt(subsbuilt) Property

        private int _subsBuilt;
        [DataMember(Name = "subsbuilt", IsRequired = false, EmitDefaultValue = false, Order = 25)]
        public int SubsBuilt
        {
            get
            {
                return _subsBuilt;
            }
            set
            {
                if (value != _subsBuilt)
                {
                    _subsBuilt = value;
                    OnPropertyChanged("SubsBuilt");
                }
            }
        }

        #endregion

        #region MoneyEarned(moneyearned) Property

        private int _moneyEarned;
        [DataMember(Name = "moneyearned", IsRequired = false, EmitDefaultValue = false, Order = 26)]
        public int MoneyEarned
        {
            get
            {
                return _moneyEarned;
            }
            set
            {
                if (value != _moneyEarned)
                {
                    _moneyEarned = value;
                    OnPropertyChanged("MoneyEarned");
                }
            }
        }

        #endregion

        #region MoneySpent(moneyspent) Property

        private int _moneySpent;
        [DataMember(Name = "moneyspent", IsRequired = false, EmitDefaultValue = false, Order = 27)]
        public int MoneySpent
        {
            get
            {
                return _moneySpent;
            }
            set
            {
                if (value != _moneySpent)
                {
                    _moneySpent = value;
                    OnPropertyChanged("MoneySpent");
                }
            }
        }

        #endregion

        #region BattlesFought(battlesfought) Property

        private int _battlesFought;
        [DataMember(Name = "battlesfought", IsRequired = false, EmitDefaultValue = false, Order = 28)]
        public int BattlesFought
        {
            get
            {
                return _battlesFought;
            }
            set
            {
                if (value != _battlesFought)
                {
                    _battlesFought = value;
                    OnPropertyChanged("BattlesFought");
                }
            }
        }

        #endregion

        #region BattlesWon(battleswon) Property

        private int _battlesWon;
        [DataMember(Name = "battleswon", IsRequired = false, EmitDefaultValue = false, Order = 29)]
        public int BattlesWon
        {
            get
            {
                return _battlesWon;
            }
            set
            {
                if (value != _battlesWon)
                {
                    _battlesWon = value;
                    OnPropertyChanged("BattlesWon");
                }
            }
        }

        #endregion

        #region BattlesLost(battleslost) Property

        private int _battlesLost;
        [DataMember(Name = "battleslost", IsRequired = false, EmitDefaultValue = false, Order = 30)]
        public int BattlesLost
        {
            get
            {
                return _battlesLost;
            }
            set
            {
                if (value != _battlesLost)
                {
                    _battlesLost = value;
                    OnPropertyChanged("BattlesLost");
                }
            }
        }

        #endregion

        #region InvasionsFought(invasionsfought) Property

        private int _invasionsFought;
        [DataMember(Name = "invasionsfought", IsRequired = false, EmitDefaultValue = false, Order = 31)]
        public int InvasionsFought
        {
            get
            {
                return _invasionsFought;
            }
            set
            {
                if (value != _invasionsFought)
                {
                    _invasionsFought = value;
                    OnPropertyChanged("InvasionsFought");
                }
            }
        }

        #endregion

        #region InvasionsWon(invasionswon) Property

        private int _invasionsWon;
        [DataMember(Name = "invasionswon", IsRequired = false, EmitDefaultValue = false, Order = 32)]
        public int InvasionsWon
        {
            get
            {
                return _invasionsWon;
            }
            set
            {
                if (value != _invasionsWon)
                {
                    _invasionsWon = value;
                    OnPropertyChanged("InvasionsWon");
                }
            }
        }

        #endregion

        #region InvasionsLost(invasionslost) Property

        private int _invasionsLost;
        [DataMember(Name = "invasionslost", IsRequired = false, EmitDefaultValue = false, Order = 33)]
        public int InvasionsLost
        {
            get
            {
                return _invasionsLost;
            }
            set
            {
                if (value != _invasionsLost)
                {
                    _invasionsLost = value;
                    OnPropertyChanged("InvasionsLost");
                }
            }
        }

        #endregion

        #region CountriesLost(countrieslost) Property

        private int _countriesLost;
        [DataMember(Name = "countrieslost", IsRequired = false, EmitDefaultValue = false, Order = 34)]
        public int CountriesLost
        {
            get
            {
                return _countriesLost;
            }
            set
            {
                if (value != _countriesLost)
                {
                    _countriesLost = value;
                    OnPropertyChanged("CountriesLost");
                }
            }
        }

        #endregion

        #region CountriesTaken(countriestaken) Property

        private int _countriesTaken;
        [DataMember(Name = "countriestaken", IsRequired = false, EmitDefaultValue = false, Order = 35)]
        public int CountriesTaken
        {
            get
            {
                return _countriesTaken;
            }
            set
            {
                if (value != _countriesTaken)
                {
                    _countriesTaken = value;
                    OnPropertyChanged("CountriesTaken");
                }
            }
        }

        #endregion
    }
}
