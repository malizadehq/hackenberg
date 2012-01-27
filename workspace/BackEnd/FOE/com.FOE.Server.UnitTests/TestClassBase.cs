using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using com.FOE.Server.DataAccess.Database;
using System.Web.Configuration;
using System.Configuration;

namespace com.FOE.Server.UnitTests
{
    [TestClass]
    public class TestClassBase
    {
        /// <summary>
        /// 
        /// </summary>
        public TestClassBase()
            : base()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="target"></param>
        /// <returns></returns>
        protected static FOEDatabaseDataContext GetDatabaseConnection(string target)
        {
            Configuration webConfig = WebConfigurationManager.OpenWebConfiguration(string.Format("/{0}", target));
            if (!webConfig.HasFile)
            {
                return null;
            }
            FOEDatabaseDataContext context = new FOEDatabaseDataContext(webConfig.ConnectionStrings.ConnectionStrings["FOESQLServer"].ConnectionString);
            return context;
        }
    }
}
