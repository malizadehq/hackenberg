using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.FOE.Server.Interface
{
    public class FOEServiceException : Exception
    {
        public FOEStatusCodes Reason { get; protected set; }

        /// <summary>
        /// Create a standard exception with an error code embedded.
        /// </summary>
        /// <param name="reason"></param>
        public FOEServiceException(FOEStatusCodes reason)
            : base(reason.ToDescriptionString())
        {
            Reason = reason;
        }


        /// <summary>
        /// Create an exception with error code and message embedded.
        /// </summary>
        /// <param name="reason"></param>
        /// <param name="message"></param>
        public FOEServiceException(FOEStatusCodes reason, string message)
            : base(string.IsNullOrEmpty(message) ? reason.ToDescriptionString() : message)
        {
            Reason = reason;
        }


        /// <summary>
        /// Create an exception with error code, message and message args embedded.
        /// </summary>
        /// <param name="reason"></param>
        /// <param name="message"></param>
        /// <param name="args"></param>
        public FOEServiceException(FOEStatusCodes reason, string message, params object[] args)
            : base(string.Format(message, args))
        {
            Reason = reason;
        }
    }
}
