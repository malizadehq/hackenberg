using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Runtime.Serialization;
using System.Reflection;

namespace com.FOE.Server.Interface
{
    /// <summary>
    /// Status codes for any FOE operation.
    /// </summary>
    [DataContract(Namespace = "http://code.google.com/p/FOE/namespace/20120125", IsReference = false)]
    public enum FOEStatusCodes
    {
        //This Code will never be returned by any web service.
        [EnumMember]
        [Description("Debug enum member.")]
        Debug = -1,

        [EnumMember]
        [Description("The operation was successfull.")]
        Ok = 0,

        [EnumMember]
        [Description("Session has timed out or is unknown.")]
        InvalidSession = 1,

        [EnumMember]
        [Description("Unknown user.")]
        UnknownUser = 2,

        [EnumMember]
        [Description("User already exists.")]
        UserAlreadyExists = 3,

        [EnumMember]
        [Description("A database operation went wrong.")]
        DatabaseError = 100,

        [EnumMember]
        [Description("An internal code error occurred.")]
        InternalError = 101,

        [EnumMember]
        [Description("Invalid parameter value.")]
        InvalidParameter = 102,
        InvalidLogin,
    }


    /// <summary>
    /// Extended utility functionality of HackebergStatusCodes
    /// </summary>
    public static class FOEStatusCodeExtensions
    {
        /// <summary>
        /// Get enum description specific for FOEStatusCodes
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static String ToDescriptionString(this FOEStatusCodes val)
        {
            DescriptionAttribute[] attributes = (DescriptionAttribute[])val.GetType().GetField(val.ToString()).GetCustomAttributes(typeof(DescriptionAttribute), false);
            return attributes.Length > 0 ? attributes[0].Description : String.Empty;
        }

        /// <summary>
        /// Get enum description for any enum
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static String ConvertToString(this Enum value)
        {
            if (value == null)
            {
                throw new ArgumentNullException("value");
            }
            Type type = value.GetType();
            FieldInfo fieldInfo = type.GetField(Enum.GetName(type, value));
            DescriptionAttribute descriptionAttribute = Attribute.GetCustomAttribute(fieldInfo, typeof(DescriptionAttribute)) as DescriptionAttribute;
            if (descriptionAttribute != null)
            {
                return descriptionAttribute.Description;
            }
            return value.ToString();
        }
    }
}
