using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Users
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Users", IsReference = false)]
    public class UserList : ObservableCollection<User>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "user", Namespace = "http://code.google.com/p/FOE/namespace/20120125/com.FOE.DataModel.Users")]
    public class User : NotifyPropertyChangedObject
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

        #region UserName(username) Property

        private string _userName;
        [DataMember(Name = "username", IsRequired = true, Order = 1)]
        public string UserName
        {
            get
            {
                return _userName;
            }
            set
            {
                if (value != _userName)
                {
                    _userName = value;
                    OnPropertyChanged("UserName");
                }
            }
        }

        #endregion

        #region Password(password) Property

        private string _password;
        [DataMember(Name = "password", IsRequired = true, Order = 2)]
        public string Password
        {
            get
            {
                return _password;
            }
            set
            {
                if (value != _password)
                {
                    _password = value;
                    OnPropertyChanged("Password");
                }
            }
        }

        #endregion
    }
}
