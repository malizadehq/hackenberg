using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using com.FOE.Server.Interface;
using System.Net.Security;
using com.FOE.Server.DataAccess.Database;
using com.FOE.DataModel.Users;

namespace com.FOE.Server.WebService
{
    [ServiceContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125", ProtectionLevel=ProtectionLevel.None)]
    public interface IFOEService
    {

        [OperationContract]
        string GetData(int value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);


        // TODO: Add your service operations here
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.WrappedRequest, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        FOEResult<User> AddUser(string userName, string password);
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
