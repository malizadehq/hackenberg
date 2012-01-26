using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.FOE.Server.DataAccess
{
    /// <summary>
    /// Controls how much data that is returned by various conversion methods (i.e. DB_User.ToUser(IdOnly) will exclude all information except the Id)
    /// </summary>
    /// <remarks>
    /// Order of these enums are important, DO NOT CHANGE!
    /// </remarks>
    public enum FOEDataInclusion
    {
        IdOnly = 0,
        Basic = 1,
        Everything = 2,
    }
}
