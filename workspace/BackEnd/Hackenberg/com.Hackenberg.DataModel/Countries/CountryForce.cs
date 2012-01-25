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
    public class CountryForceList : ObservableCollection<CountryForce>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "countryforce", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Countries")]
    public class CountryForce : NotifyPropertyChangedObject
    {
        #region ForceId(forceid) Property

        private Guid? _forceId;
        [DataMember(Name = "forceid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? ForceId
        {
            get
            {
                return _forceId;
            }
            set
            {
                if (value != _forceId)
                {
                    _forceId = value;
                    OnPropertyChanged("ForceId");
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
    }
}
