using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;

namespace com.FOE.DataModel.Sessions
{
    /// <summary>
    /// 
    /// </summary>
    [CollectionDataContract(Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Sessions", IsReference = false)]
    public class GameSessionList : ObservableCollection<GameSession>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "gamesession", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.FOE.DataModel.Sessions")]
    public class GameSession : NotifyPropertyChangedObject
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
    }
}
