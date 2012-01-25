using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.Hackenberg.DataModel.Countries
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Countries", IsReference = false)]
    public class CountryStructureList : ObservableCollection<CountryStructure>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "countrystructure", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Countries")]
    public class CountryStructure : NotifyPropertyChangedObject
    {
        #region CountryId(countryid) Property

        private Guid? _countryId;
        [DataMember(Name = "countryid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
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

        #region StructureId(structureid) Property

        private Guid? _structureId;
        [DataMember(Name = "structureid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
        public Guid? StructureId
        {
            get
            {
                return _structureId;
            }
            set
            {
                if (value != _structureId)
                {
                    _structureId = value;
                    OnPropertyChanged("StructureId");
                }
            }
        }

        #endregion
    }
}
