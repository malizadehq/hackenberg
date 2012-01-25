using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Runtime.Serialization;
using System.Reflection;

namespace com.Hackenberg.Server.Interface
{
    /// <summary>
    /// Status codes for any hackenberg operation.
    /// </summary>
    [DataContract(Namespace = "http://code.google.com/p/hackenberg/namespace/20120125", IsReference = false)]
    public enum HackenbergStatusCodes
    {
        //This Code will never be returned by any web service.
        [EnumMember]
        [Description("Debug enum member.")]
        Debug = -1,

        [EnumMember]
        [Description("The operation was successfull.")]
        Ok = 0,
    }


    /// <summary>
    /// Extended utility functionality of HackebergStatusCodes
    /// </summary>
    public static class HackenbergStatusCodeExtensions
    {
        /// <summary>
        /// Get enum description specific for HackenbergStatusCodes
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static String ToDescriptionString(this HackenbergStatusCodes val)
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
