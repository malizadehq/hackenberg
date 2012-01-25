using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace com.Hackenberg.Server.Interface
{
    [DataContract(Namespace = "http://code.google.com/p/hackenberg/namespace/20120125", IsReference = false)]
    class HackenbergResult<T> : HackenbergResultBase
    {
        #region Properties

        [DataMember(Order=10, EmitDefaultValue=false)]
        public T Result { get; set; }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        public HackenbergResult()
            : base()
        {
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="result"></param>
        /// <param name="status"></param>
        /// <param name="message"></param>
        public HackenbergResult(T result, HackenbergStatusCodes status = HackenbergStatusCodes.Ok, string message = null)
            : this(status, message)
        {
            Result = result;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="status"></param>
        /// <param name="message"></param>
        public HackenbergResult(HackenbergStatusCodes status = HackenbergStatusCodes.Ok, string message = null)
            : base(status, message)
        {
        }


        /// <summary>
        /// 
        /// </summary>
        public HackenbergResult(HackenbergServiceException exception)
            : base(exception)
        {
        }


        /// <summary>
        /// Throws an exception if result.status differs from "Ok"
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        public static T ReturnResult(HackenbergResult<T> result)
        {
            if (result.Status != HackenbergStatusCodes.Ok)
            {
                throw new HackenbergServiceException(result.Status, result.Message);
            }
            return result.Result;
        }
    }
}
