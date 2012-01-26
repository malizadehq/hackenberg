using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Maps
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Maps", IsReference = false)]
    public class MapList : ObservableCollection<Map>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "map", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Maps")]
    public class Map : NotifyPropertyChangedObject
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
    }
}
