using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.FOE.Server.DataAccess.Database;
using System.Configuration;
using com.FOE.Server.Interface;
using com.FOE.Server.Common;

namespace com.FOE.Server.WebService
{
    public partial class DatabaseConnectionTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String ConnectionString = "?";
            try
            {
                FOEDatabaseDataContext context = null;
                try
                {
                    try
                    {
                        context = new FOEDatabaseDataContext(ConfigurationManager.ConnectionStrings["FOESQLServer"].ConnectionString);
                    }
                    catch (Exception)
                    {
                        context = new FOEDatabaseDataContext();
                    }
                    ConnectionString = context.Connection.ConnectionString;
                    //commented out since the connecion string will contain userName and password for the remote DB server from now on. Not that good if thats made available publically.
                    //lblConnectionString.Text = String.Format("*** {0} ***", ConnectionString);
                }
                finally
                {
                    if (context != null)
                    {
                        context.Dispose();
                    }
                }

                ServiceRequestHandler request = new ServiceRequestHandler(Guid.NewGuid());
            }
            catch (FOEServiceException ex)
            {
                // We know it is an invalid session
                if (ex.Reason != FOEStatusCodes.InvalidSession)
                {
                    throw new Exception(ConnectionString, ex);
                    // If it is another error, throw the exception again
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ConnectionString, ex);
            }
        }
    }
}