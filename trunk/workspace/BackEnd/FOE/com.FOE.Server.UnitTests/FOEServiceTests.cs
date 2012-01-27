using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using com.FOE.Server.Interface;
using com.FOE.DataModel.Users;

namespace com.FOE.Server.UnitTests
{
    /// <summary>
    /// Summary description for FOEServiceTests
    /// </summary>
    [TestClass]
    public class FOEServiceTests : TestClassBase
    {
        public FOEServiceTests()
            : base()
        {
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        #region AddUser Tests

        [TestMethod]
        public void AddUser()
        {
            FOEServiceReference.FOEServiceClient client = new FOEServiceReference.FOEServiceClient();
            FOEResult<User> result = client.AddUser("userName", "password");
        }

        #endregion
    }
}
