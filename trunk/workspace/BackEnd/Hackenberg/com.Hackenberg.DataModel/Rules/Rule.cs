using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.Hackenberg.DataModel.Rules
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Rules", IsReference = false)]
    public class RuleList : ObservableCollection<Rule>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "rule", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Rules")]
    public class Rule : NotifyPropertyChangedObject
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

        #region Name(name) Property

        private string _name;
        [DataMember(Name = "name", IsRequired = false, Order = 1)]
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

        #region Effect(effect) Property

        private string _effect;
        [DataMember(Name = "effect", IsRequired = true, Order = 2)]
        public string Effect
        {
            get
            {
                return _effect;
            }
            set
            {
                if (value != _effect)
                {
                    _effect = value;
                    OnPropertyChanged("Effect");
                }
            }
        }

        #endregion
    }
}
