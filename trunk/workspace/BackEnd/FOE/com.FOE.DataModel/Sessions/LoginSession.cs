﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.Hackenberg.DataModel.Sessions
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Sessions", IsReference = false)]
    public class LoginSessionList : ObservableCollection<LoginSession>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "loginsession", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Sessions")]
    public class LoginSession : NotifyPropertyChangedObject
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

        #region Timeout(timeout) Property

        private DateTime? _timeout;
        [DataMember(Name = "timeout", IsRequired = true, EmitDefaultValue = false, Order = 2)]
        public DateTime? Timeout
        {
            get
            {
                return _timeout;
            }
            set
            {
                if (value != _timeout)
                {
                    _timeout = value;
                    OnPropertyChanged("Timeout");
                }
            }
        }

        #endregion
    }
}