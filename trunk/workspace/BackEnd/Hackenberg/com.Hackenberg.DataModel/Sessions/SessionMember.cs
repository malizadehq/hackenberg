using System;
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
    public class SessionMemberList : ObservableCollection<SessionMember>
    {
    }


    /// <summary>
    /// 
    /// </summary>
    [DataContract(Name = "sessionmember", Namespace = "http://www.vfc.com/eCatalogue/20110307/com.Hackenberg.DataModel.Sessions")]
    public class SessionMember : NotifyPropertyChangedObject
    {
        #region SessionId(sessionid) Property

        private Guid? _sessionId;
        [DataMember(Name = "sessionid", IsRequired = true, EmitDefaultValue = false, Order = 0)]
        public Guid? SessionId
        {
            get
            {
                return _sessionId;
            }
            set
            {
                if (value != _sessionId)
                {
                    _sessionId = value;
                    OnPropertyChanged("SessionId");
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
    }
}
