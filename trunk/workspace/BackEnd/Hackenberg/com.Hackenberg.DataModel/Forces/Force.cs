﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.Hackenberg.DataModel.Forces
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Forces", IsReference = false)]
    public class ForceList : ObservableCollection<Force>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "force", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Forces")]
    public class Force : NotifyPropertyChangedObject
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
        [DataMember(Name = "name", IsRequired = true, Order = 1)]
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

        #region DefenceStrength(defencestrength) Property

        private int _defenceStrength;
        [DataMember(Name = "defencestrength", IsRequired = true, Order = 2)]
        public int DefenceStrength
        {
            get
            {
                return _defenceStrength;
            }
            set
            {
                if (value != _defenceStrength)
                {
                    _defenceStrength = value;
                    OnPropertyChanged("DefenceStrength");
                }
            }
        }

        #endregion

        #region OffenceStrength(offencestrength) Property

        private int _offenceStrength;
        [DataMember(Name = "offencestrength", IsRequired = true, Order = 3)]
        public int OffenceStrength
        {
            get
            {
                return _offenceStrength;
            }
            set
            {
                if (value != _offenceStrength)
                {
                    _offenceStrength = value;
                    OnPropertyChanged("OffenceStrength");
                }
            }
        }

        #endregion
    }
}