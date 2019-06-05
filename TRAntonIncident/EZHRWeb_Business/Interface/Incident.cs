using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using EZHRWeb_Business.Helpers;
using EZHRWeb_Business.Models;
using EZHRWeb_DB.Models;
using EZHRWeb_DB.DbInterface ; 


namespace EZHRWeb_Business.Interface 
{
    public class Incident : IWebBusInterface
    {
        private IMapper mapper;

        public Incident()
        {
            mapper = MapHelper.SetupMaps();
        }

        public IncidentInput InitIncidentObj()
        {

         InitIncident dbobj = new InitIncident();

         IncidentInput _incident = new IncidentInput();


            _incident.CallFlow = Mapper.Map<List<SampleCallFlowDto>,List<SampleCallFlow>>(dbobj.GetSampleCallFlow());

            _incident.dMaker = Mapper.Map<List<DMakerDto>, List<DMaker>>( dbobj.SelectAllDMaker());

            _incident.qMaster = Mapper.Map<List<QMasterDto>, List<QMaster>>( dbobj.GetQMaster());

            _incident.reportData = new ReportData();

            _incident.responses.Add(new RespData());
           
            return _incident;

        }


        //public async Task<IncidentInput> SaveReportData(IncidentInput request)
        //{
        //    InitIncident dbobj = new InitIncident();

        //   await dbobj.SaveReportData(mapper.Map<ReportData, ReportDataDto>(request.reportData));




        //}


    }
}
