using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Countries
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Countries", IsReference = false)]
    public class CountryList : ObservableCollection<Country>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "country", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Countries")]
    public class Country : NotifyPropertyChangedObject
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
        [DataMember(Name = "mapid", IsRequired = true, EmitDefaultValue = false, Order = 1)]
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

        #region ControlledBy(controlledby) Property

        private Guid? _controlledBy;
        [DataMember(Name = "controlledby", IsRequired = true, EmitDefaultValue = false, Order = 2)]
        public Guid? ControlledBy
        {
            get
            {
                return _controlledBy;
            }
            set
            {
                if (value != _controlledBy)
                {
                    _controlledBy = value;
                    OnPropertyChanged("ControlledBy");
                }
            }
        }

        #endregion

        #region Name(name) Property

        private string _name;
        [DataMember(Name = "name", IsRequired = true, Order = 3)]
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

        #region Points(points) Property

        private int _points;
        [DataMember(Name = "points", IsRequired = true, Order = 4)]
        public int Points
        {
            get
            {
                return _points;
            }
            set
            {
                if (value != _points)
                {
                    _points = value;
                    OnPropertyChanged("Points");
                }
            }
        }

        #endregion
    }
}
