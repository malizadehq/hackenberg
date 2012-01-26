using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace com.FOE.Server.Interface
{
    [DataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125", IsReference = false)]
    public class FOEResult<T> : FOEResultBase
    {
        #region Properties

        [DataMember(Order=10, EmitDefaultValue=false)]
        public T Result { get; set; }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        public FOEResult()
            : base()
        {
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="result"></param>
        /// <param name="status"></param>
        /// <param name="message"></param>
        public FOEResult(T result, FOEStatusCodes status = FOEStatusCodes.Ok, string message = null)
            : this(status, message)
        {
            Result = result;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="status"></param>
        /// <param name="message"></param>
        public FOEResult(FOEStatusCodes status = FOEStatusCodes.Ok, string message = null)
            : base(status, message)
        {
        }


        /// <summary>
        /// 
        /// </summary>
        public FOEResult(FOEServiceException exception)
            : base(exception)
        {
        }


        /// <summary>
        /// Throws an exception if result.status differs from "Ok"
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        public static T ReturnResult(FOEResult<T> result)
        {
            if (result.Status != FOEStatusCodes.Ok)
            {
                throw new FOEServiceException(result.Status, result.Message);
            }
            return result.Result;
        }
    }
}
