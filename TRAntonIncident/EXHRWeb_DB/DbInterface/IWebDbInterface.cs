﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB
{
   public interface IWebDbInterface
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
