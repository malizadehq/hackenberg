using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using com.Hackenberg.Server.Common;
using com.Hackenberg.Server.Interface;
using System.Diagnostics;
using System.Data.SqlClient;
using com.Hackenberg.DataModel.Users;

namespace com.Hackenberg.Server.WebService
{
    public class HackenbergService : IHackenbergService
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
        private HackenbergResultBase Execute(Guid session, ExecuteDelegate executeDelegate)
        {
            HackenbergResultBase result;
            try
            {
                ServiceRequestHandler request = new ServiceRequestHandler(session);
                executeDelegate(request);
                result = new HackenbergResultBase();
            }
            catch (HackenbergServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResultBase(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResultBase(HackenbergStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResultBase(HackenbergStatusCodes.InternalError, ex.Message);
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
        private HackenbergResult<T> Execute<T>(Guid session, ExecuteDelegate<T> executeDelegate)
        {
            HackenbergResult<T> result;
            try
            {
                ServiceRequestHandler request = new ServiceRequestHandler(session);
                result = new HackenbergResult<T>(executeDelegate(request));
            }
            catch (HackenbergServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResult<T>(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResult<T>(HackenbergStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResult<T>(HackenbergStatusCodes.InternalError, ex.Message);
            }
            return result;
        }

        #endregion


        /// <summary>
        /// Adds a user to the database
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public HackenbergResult<User> AddUser(string userName, string password)
        {
            HackenbergResult<User> result = new HackenbergResult<User>(HackenbergStatusCodes.Ok, HackenbergStatusCodes.Ok.ToDescriptionString());
            try
            {
                ServiceRequestHandler requestHandler = new ServiceRequestHandler();
                result.Result = requestHandler.AddUser(userName, password);
            }
            catch (HackenbergServiceException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResult<User>(ex);
            }
            catch (SqlException ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResult<User>(HackenbergStatusCodes.DatabaseError, ex.Message);
            }
            catch (Exception ex)
            {
                Trace.TraceError("{0}", ex);
                result = new HackenbergResult<User>(HackenbergStatusCodes.InternalError, ex.Message);
            }
            return result;
        }



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
