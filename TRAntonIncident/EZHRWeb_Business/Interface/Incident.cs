using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using EZHRWeb_Business.Helpers;
using EZHRWeb_Business.Models;
using EZHRWeb_DB.Models;
using EZHRWeb_DB.DbInterface;


namespace EZHRWeb_Business.Interface
{
    public class IncidentBus : IWebBusInterface
    {
        public IWebDbInterface oWebDb = new IncidentDb();

        public IMapper mapper;

        public IncidentBus()
        {
            mapper = MapHelper.SetupMaps();

        }


        public async Task<IncidentInput> InitIncidentObj()
        {

            mapper = MapHelper.SetupMaps();

            IncidentInput _incident = new IncidentInput();


            _incident.CallFlow = mapper.Map<List<SampleCallFlowDto>, List<SampleCallFlow>>(await oWebDb.GetSampleCallFlow());

            _incident.dMaker = mapper.Map<List<DMakerDto>, List<DMaker>>(await oWebDb.SelectAllDMaker());

            _incident.qMaster = mapper.Map<List<QMasterDto>, List<QMaster>>(await oWebDb.GetQMaster());

            _incident.reportData = new ReportData();

            _incident.responses.Add(new RespData());

            return _incident;

        }


        /// <summary>
        /// GetWebPhrase
        /// </summary>
        /// <param name="vSection"></param>
        /// <returns></returns>
        public async Task<List<WebPhrase>> GetWebPhrase(int vSection)
        {
            mapper = MapHelper.SetupMaps();
            List<WebPhrase> owebphrase = new List<WebPhrase>();

            var webphrase = await oWebDb.GetWebPhraseBySection(vSection);

            foreach (WebPhraseDto webph in webphrase)
            {
                var twebphrase = mapper.Map<WebPhraseDto, WebPhrase>(webph);

                owebphrase.Add(twebphrase);
            }

            return owebphrase;
        }





        //public async Task<IncidentInput> SaveReportData(IncidentInput request)
        //{
        //    InitIncident dbobj = new InitIncident();

        //   await dbobj.SaveReportData(mapper.Map<ReportData, ReportDataDto>(request.reportData));




        //}


    }
}
