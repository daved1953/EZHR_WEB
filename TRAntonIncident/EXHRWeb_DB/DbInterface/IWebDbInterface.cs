using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EXHRWeb_DB.Models;

namespace EXHRWeb_DB
{
    interface IWebDbInterface
    {
        #region InitIncident
        Task<List<SampleCallFlowDto>> GetSampleCallFlow();
        Task<List<DMakerDto>> SelectAllDMaker();
        Task<List<QMasterDto>> GetQMaster();
        Task<ReportDataDto> GetReportDataTemplate();
        Task<RespDataDto> GetRespDataTemplate();

        #endregion
    }
}
