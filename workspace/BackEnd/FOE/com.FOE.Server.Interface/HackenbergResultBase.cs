using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace com.Hackenberg.Server.Interface
{
    [DataContract(Namespace = "http://code.google.com/p/hackenberg/namespace/20120125", IsReference = false, Name="HackenbergResult")]
    public class HackenbergResultBase
    {
        #region Properties

        [DataMember(Order = 0, IsRequired = true)]
        public HackenbergStatusCodes Status { get; set; }

        [DataMember(Order = 1, EmitDefaultValue = false)]
        public string Message { get; set; }

        #endregion

        /// <summary>
        /// Sets Status to ok and message to null
        /// </summary>
        public HackenbergResultBase()
        {
            Status = HackenbergStatusCodes.Ok;
            Message = null;
        }


        /// <summary>
        /// Sets message to null if message == ""
        /// </summary>
        /// <param name="status"></param>
        /// <param name="message"></param>
        public HackenbergResultBase(HackenbergStatusCodes status = HackenbergStatusCodes.Ok, string message = null)
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
        public HackenbergResultBase(HackenbergServiceException exception)
            : this(exception.Reason, exception.Message)
        {
        }


        /// <summary>
        /// throws an exception if the result status differs from "Ok"
        /// </summary>
        /// <param name="result"></param>
        public static void GetResult(HackenbergResultBase result)
        {
            if (result.Status != HackenbergStatusCodes.Ok)
            {
                throw new HackenbergServiceException(result.Status, result.Message);
            }
        }
    }
}
