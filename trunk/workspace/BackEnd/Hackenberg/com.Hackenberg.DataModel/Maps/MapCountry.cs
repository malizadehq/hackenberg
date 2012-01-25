using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.Hackenberg.DataModel.Maps
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Maps", IsReference = false)]
    public class MapCountryList : ObservableCollection<MapCountry>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "mapcountry", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Maps")]
    public class MapCountry : NotifyPropertyChangedObject
    {
        #region MapId(mapid) Property

        private Guid? _mapId;
        [DataMember(Name = "mapid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? Id
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

        #region CountryId(countryid) Property

        private Guid? _countryId;
        [DataMember(Name = "countryid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
        public Guid? Brand
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
