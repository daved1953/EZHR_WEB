using System.Collections.Generic;
using System.Threading.Tasks;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB.DbInterface
{
   public interface IWebDbInterface
    {
        #region "InitIncident"
        Task<List<SampleCallFlowDto>> GetSampleCallFlow();
        Task<List<DMakerDto>> SelectAllDMaker();
        Task<List<QMasterDto>> GetQMaster();
        Task<ReportDataDto> GetReportDataTemplate();
        Task<RespDataDto> GetRespDataTemplate();

        #endregion

        #region "Web Phrase" 
        Task<List<WebPhraseDto>> GetWebPhraseBySection(int vSection);
        Task<List<WebPhraseDto>> GetWebPhrase(int vSection);

        #endregion
    }
}
