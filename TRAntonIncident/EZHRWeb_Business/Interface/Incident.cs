using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using EZHRWeb_Business.Helpers;
using EZHRWeb_Business.Models;
using EZHRWeb_DB.Models;
using EZHRWeb_DB.DbInterface;


namespace EZHRWeb_Business.Interface
{
    public partial class IncidentBus : IWebBusInterface
    {
        public IWebDbInterface oWebDb = new IncidentDb();

        public IMapper mymapper;

        public IncidentBus()
        {
            mymapper = MapHelper.SetupMaps();

        }


        public async Task<IncidentInput> InitIncidentObj()
        {

            mymapper = MapHelper.SetupMaps();

            IncidentInput _incident = new IncidentInput(1);


            _incident.CallFlow = mymapper.Map<List<SampleCallFlowDto>, List<SampleCallFlow>>(await oWebDb.GetSampleCallFlow());

            _incident.dMaker = mymapper.Map<List<DMakerDto>, List<DMaker>>(await oWebDb.SelectAllDMaker(string.Empty));

            _incident.qMaster = mymapper.Map<List<QMasterDto>, List<QMaster>>(await oWebDb.GetQMaster());

            _incident.reportData = new ReportData();

            _incident.responses.Add(new RespData());

            return _incident;

        }

        /// <summary>
        /// LoadNextDMaker
        /// </summary>
        /// <param name="requestQid"></param>
        /// <returns></returns>
        public async Task<List<DMaker>> LoadNextDMaker(string requestQid )
        {
            mymapper = MapHelper.SetupMaps(); 

            var result =  mymapper.Map<List<DMakerDto>, List<DMaker>>(await oWebDb.SelectAllDMaker(requestQid));

            return result; 
        }


        /// <summary>
        /// GetWebPhrase
        /// </summary>
        /// <param name="vSection"></param>
        /// <returns></returns>
        public async Task<List<WebPhrase>> GetWebPhrase(int vSection)
        {
            mymapper = MapHelper.SetupMaps();
            List<WebPhrase> owebphrase = new List<WebPhrase>();

            var webphrase = await oWebDb.GetWebPhraseBySection(vSection);

            foreach (WebPhraseDto webph in webphrase)
            {
                var twebphrase = mymapper.Map<WebPhraseDto, WebPhrase>(webph);

                owebphrase.Add(twebphrase);
            }

            return owebphrase;
        }





       


    }
}
