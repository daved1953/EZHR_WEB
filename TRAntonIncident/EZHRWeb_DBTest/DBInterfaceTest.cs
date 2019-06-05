using EZHRWeb_DB.DbInterface;
using EZHRWeb_DB.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Threading.Tasks;


namespace EZHRWeb_DBTest
{
    [TestClass]
    public class DbInterfaceTest
    {

        public EZHRWeb_DB.DbInterface.InitIncident tdb;

        [TestInitialize]
        public void TestStart()
        {
            tdb = new InitIncident();

        }
        
        //    Task<List<SampleCallFlowDto>> GetSampleCallFlow();
        [TestMethod]
        public void GetSampleCallFlowTest()
        {
            List<SampleCallFlowDto> result =  tdb.GetSampleCallFlow();

            Assert.IsTrue(result.Count > 0);
        }


        //    Task<List<DMakerDto>> SelectAllDMaker();
        [TestMethod]
        public void SelectAllDMakerTest()
        {
            List<DMakerDto> result =   tdb.SelectAllDMaker();

            Assert.IsTrue(result.Count > 0);
        }

        //    Task<List<QMasterDto>> GetQMaster();
        [TestMethod]
        public void GetQMasterTest()
        {
            List<QMasterDto> result =  tdb.GetQMaster();

            Assert.IsTrue(result.Count > 0);
        }

        //    Task<ReportDataDto> GetReportDataTemplate();
        [TestMethod]
        public void GetREeportDAtaTEmplateTest()
        {
            ReportDataDto result = tdb.GetReportDataTemplate();

            Assert.IsTrue(result != null);
        }

        //    Task<RespDataDto> GetRespDataTemplate();
        [TestMethod]
        public void GetREspDataTEmplateTest()
        {
            RespDataDto result = tdb.GetRespDataTemplate();
            Assert.IsTrue(result != null);
        }



    }
}
