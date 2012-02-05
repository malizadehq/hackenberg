using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.ComponentModel;

namespace com.FOE.Server.Common
{
    public enum GameEvents
    {
        [EnumMember]
        [Description("The game has been started")]
        GameStarted = 0,
    }
}
