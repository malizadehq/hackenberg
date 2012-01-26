using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Structures
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Structures", IsReference = false)]
    public class StructureList : ObservableCollection<Structure>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "structure", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Structures")]
    public class Structure : NotifyPropertyChangedObject
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

        #region CountryId(countryid) Property

        private Guid? _countryId;
        [DataMember(Name = "countryid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
        public Guid? CountryId
        {
            get
            {
                return _countryId;
            }
            set
            {
                if (value != _countryId)
                {
                    _countryId = value;
                    OnPropertyChanged("CountryId");
                }
            }
        }

        #endregion

        #region Name(name) Property

        private string _name;
        [DataMember(Name = "name", IsRequired = true, Order = 2)]
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
        [DataMember(Name = "effect", IsRequired = true, Order = 3)]
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
