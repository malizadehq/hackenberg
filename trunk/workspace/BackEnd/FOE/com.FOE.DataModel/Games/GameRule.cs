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
    public class GameRuleList : ObservableCollection<GameRule>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "gamerule", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Games")]
    public class GameRule : NotifyPropertyChangedObject
    {
        #region RuleId(ruleid) Property

        private Guid? _ruleId;
        [DataMember(Name = "ruleid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? RuleId
        {
            get
            {
                return _ruleId;
            }
            set
            {
                if (value != _ruleId)
                {
                    _ruleId = value;
                    OnPropertyChanged("RuleId");
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
