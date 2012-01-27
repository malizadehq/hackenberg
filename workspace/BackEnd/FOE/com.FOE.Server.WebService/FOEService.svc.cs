using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using com.FOE.Server.Common;
using com.FOE.Server.Interface;
using System.Diagnostics;
using System.Data.SqlClient;
using com.FOE.DataModel.Users;

namespace com.FOE.Server.WebService
{
    public class FOEService : IFOEService
    {
        #region Execute Helper Method

        private delegate void ExecuteDelegate(ServiceRequestHandler request);
        private delegate T ExecuteDelegate<T>(ServiceRequestHandler request);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="session"></param>
        /// <param name="executeDelegate"></param>
        /// <returns></returns>
        private FOEResultBase Execute(Guid session, ExecuteDelegate executeDelegate)
        {
            FOEResultBase result;
            try
            {
                ServiceRequestHandler request = new ServiceRequestHandler(session);
                executeDelegate(request);
                result = new FOEResultBase();
            }
            catch (FOEServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResultBase(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResultBase(FOEStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResultBase(FOEStatusCodes.InternalError, ex.Message);
            }
            return result;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="session"></param>
        /// <param name="executeDelegate"></param>
        /// <returns></returns>
        private FOEResult<T> Execute<T>(Guid session, ExecuteDelegate<T> executeDelegate)
        {
            FOEResult<T> result;
            try
            {
                ServiceRequestHandler request = new ServiceRequestHandler(session);
                result = new FOEResult<T>(executeDelegate(request));
            }
            catch (FOEServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<T>(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<T>(FOEStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<T>(FOEStatusCodes.InternalError, ex.Message);
            }
            return result;
        }

        #endregion

        #region Non-Session webservices

        /// <summary>
        /// Adds a user to the database
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public FOEResult<User> AddUser(string userName, string password)
        {
            FOEResult<User> result = new FOEResult<User>();
            try
            {
                ServiceRequestHandler requestHandler = new ServiceRequestHandler();
                result.Result = requestHandler.AddUser(userName, password);
            }
            catch (FOEServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<User>(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<User>(FOEStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<User>(FOEStatusCodes.InternalError, ex.Message);
            }
            return result;
        }


        /// <summary>
        /// Logs the user in returning a sessionId
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public FOEResult<Guid> Login(string userName, string password)
        {
            FOEResult<Guid> result = new FOEResult<Guid>();
            try
            {
                ServiceRequestHandler requestHandler = new ServiceRequestHandler();
                result.Result = requestHandler.Login(userName, password);
            }
            catch (FOEServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<Guid>(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<Guid>(FOEStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new FOEResult<Guid>(FOEStatusCodes.InternalError, ex.Message);
            }
            return result;
        }

        #endregion


        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
