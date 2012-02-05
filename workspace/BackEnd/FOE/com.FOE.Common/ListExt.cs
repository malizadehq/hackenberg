using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.FOE.Server.Interface;

namespace com.FOE.Common
{
    //TODO: Get this to work...
    public static class ListExt
    {
        public static T GetRandomElement<T>(this List<T> list)
        {
            if (list == null)
                throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "List can not be null");
            if (list.Count == 0)
                throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "List can not contain 0 elements");

            Random rnd = new Random();
            return list.OrderBy(x => rnd.Next()).FirstOrDefault();
        }
    }
}
