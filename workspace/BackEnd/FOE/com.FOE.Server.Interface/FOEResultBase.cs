using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace com.FOE.Server.Interface
{
    [DataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125", IsReference = false, Name="FOEResult")]
    public class FOEResultBase
    {
        #region Properties

        [DataMember(Order = 0, IsRequired = true)]
        public FOEStatusCodes Status { get; set; }

        [DataMember(Order = 1, EmitDefaultValue = false)]
        public string Message { get; set; }

        #endregion

        /// <summary>
        /// Sets Status to ok and message to null
        /// </summary>
        public FOEResultBase()
        {
            Status = FOEStatusCodes.Ok;
            Message = null;
        }


        /// <summary>
        /// Sets message to null if message == ""
        /// </summary>
        /// <param name="status"></param>
        /// <param name="message"></param>
        public FOEResultBase(FOEStatusCodes status = FOEStatusCodes.Ok, string message = null)
        {
            Status = status;
            Message = message;
            if (message == "")
                Message = null;
        }


        /// <summary>
        /// Exception instantiated result.
        /// </summary>
        /// <param name="exception"></param>
        public FOEResultBase(FOEServiceException exception)
            : this(exception.Reason, exception.Message)
        {
        }


        /// <summary>
        /// throws an exception if the result status differs from "Ok"
        /// </summary>
        /// <param name="result"></param>
        public static void GetResult(FOEResultBase result)
        {
            if (result.Status != FOEStatusCodes.Ok)
            {
                throw new FOEServiceException(result.Status, result.Message);
            }
        }
    }
}
