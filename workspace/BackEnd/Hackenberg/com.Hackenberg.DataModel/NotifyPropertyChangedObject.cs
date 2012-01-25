using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Runtime.Serialization;

namespace com.Hackenberg.DataModel
{
    [DataContract(Namespace = "http://code.google.com/p/hackenberg/namespace/20120125/com.vfc.DataModel")]
    public class NotifyPropertyChangedObject : INotifyPropertyChanged
    {
        #region INotifyPropertyChanged Members

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(String propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        #endregion
    }
}
