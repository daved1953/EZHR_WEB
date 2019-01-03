using EXHRWeb_DB.DbInterface;
using EXHRWeb_DB.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Threading.Tasks;


namespace EZHRWeb_DBTest
{
    [TestClass]
    public class DbInterfaceTest
    {

        public EXHRWeb_DB.DbInterface.IntIncident tdb;

        [TestInitialize]
        public void TestStart()
        {
            tdb = new IntIncident();

        }
        
        //    Task<List<SampleCallFlowDto>> GetSampleCallFlow();
        [TestMethod]
        public async Task GetSampleCallFlowTest()
        {
            List<SampleCallFlowDto> result = await tdb.GetSampleCallFlow();

            Assert.IsTrue(result.Count > 0);
        }


        //    Task<List<DMakerDto>> SelectAllDMaker();
        [TestMethod]
        public async Task SelectAllDMakerTest()
        {
            List<DMakerDto> result = await tdb.SelectAllDMaker();

            Assert.IsTrue(result.Count > 0);
        }

        //    Task<List<QMasterDto>> GetQMaster();
        [TestMethod]
        public async Task GetQMasterTest()
        {
            List<QMasterDto> result = await tdb.GetQMaster();

            Assert.IsTrue(result.Count > 0);
        }

        //    Task<ReportDataDto> GetReportDataTemplate();
        [TestMethod]
        public async Task GetREeportDAtaTEmplateTest()
        {
            ReportDataDto result = await tdb.GetReportDataTemplate();

            Assert.IsTrue(result != null);
        }

        //    Task<RespDataDto> GetRespDataTemplate();
        [TestMethod]
        public async Task GetREspDataTEmplateTest()
        {
            RespDataDto result = await tdb.GetRespDataTemplate();
            Assert.IsTrue(result != null);
        }



    }
}
