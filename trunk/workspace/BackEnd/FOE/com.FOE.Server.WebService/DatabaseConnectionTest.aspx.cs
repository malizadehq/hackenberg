using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.Hackenberg.Server.DataAccess.Database;
using System.Configuration;
using com.Hackenberg.Server.Interface;
using com.Hackenberg.Server.Common;

namespace com.Hackenberg.Server.WebService
{
    public partial class DatabaseConnectionTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String ConnectionString = "?";
            try
            {
                HackenbergDatabaseDataContext context = null;
                try
                {
                    try
                    {
                        context = new HackenbergDatabaseDataContext(ConfigurationManager.ConnectionStrings["HackenbergSQLServer"].ConnectionString);
                    }
                    catch (Exception)
                    {
                        context = new HackenbergDatabaseDataContext();
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
            catch (HackenbergServiceException ex)
            {
                // We know it is an invalid session
                if (ex.Reason != HackenbergStatusCodes.InvalidSession)
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