using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EZHRWeb_Business.Models;
using EZHRWeb_DB.DbInterface;
using EZHRWeb_DB.Models;
using AutoMapper;
using EZHRWeb_Business.Helpers;

namespace EZHRWeb_Business.Interface
{
    public partial class IncidentBus : IWebBusInterface
    {
        public async Task<IncidentInput> SaveQuestionGetNext(IncidentInput response, string questionId)
        {
            mymapper = MapHelper.SetupMaps();

            if (response == null) throw new ArgumentNullException(nameof(response));

            if (questionId == null) throw new ArgumentNullException(nameof(questionId));

            oWebDb = new IncidentDb();


             // first question can never be a True False answer
            if (Convert.ToInt32(response.QID) > 5003)
            {

                if (response.QType != "MD")
                {
                    if (response.bAnswer)
                    {
                        response.Answer = 1;
                    }
                    else
                    {
                        response.Answer = 2;
                    }
                }
            }

            RespData m_respData = new RespData()
            {
                CallID = response.CallId,
                Dcollect = response.QID + "." + response.Answer.ToString().Trim(),
                QID = response.QID
            };

            response.responses.Add(m_respData);

            var result = await oWebDb.SaveQuestionAnswer(mymapper.Map<List<RespData>, List<RespDataDto>>(response.responses), questionId);

            // logic to determine next question to be asked, return the value

            List<DMaker> dMaker = mymapper.Map<List<DMakerDto>, List<DMaker>>(await oWebDb.SelectAllDMaker(string.Empty));

            string nextPointer = string.Empty;

            switch (response.Answer)
            {
                case 1:
                    nextPointer = dMaker[0].R1;
                    ;
                    break;
                case 2:
                    nextPointer = dMaker[0].R2;
                    ;
                    break;
                case 3:
                    nextPointer = dMaker[0].R3;
                    ;
                    break;
                case 4:
                    nextPointer = dMaker[0].R4;
                    ;
                    break;
                case 5:
                    nextPointer = dMaker[0].R5;
                    ;
                    break;
                case 6:
                    nextPointer = dMaker[0].R6;
                    ;
                    break;
                case 7:
                    nextPointer = dMaker[0].R7;
                    ;
                    break;
                case 8:
                    nextPointer = dMaker[0].R8;
                    ;
                    break;
                case 9:
                    nextPointer = dMaker[0].R9;
                    ;
                    break;
            }

            List<QMasterDto> oQMaster = await oWebDb.GetQMaster();

            List<SampleCallFlow> ocalldata = mymapper.Map<List<SampleCallFlowDto>, List<SampleCallFlow>>(await oWebDb.GetSampleCallFlow());

            response.CallFlow = ocalldata.FindAll(m => m.PrimarySection == Convert.ToInt32(nextPointer)).ToList();



            // var nextQuestion = mymapper.Map<QMasterDto,QMaster>(oQMaster.Find(m => m.Qid == nextPointer));

            response.qMaster = mymapper.Map<List<QMasterDto>, List<QMaster>>(oQMaster.FindAll(m => m.Qid == nextPointer).ToList());


            return response;
        }


        public async Task<IncidentInput> SaveAndCreateIncident(IncidentInput request)
        {
            mymapper = MapHelper.SetupMaps();

            if (request == null) throw new ArgumentNullException(nameof(request));

            ReportData oReportData = request.reportData;

            oReportData.CallID = request.CallId;

            var result = await SaveReportData(oReportData);

            return request;
        }


        private async Task<bool> SaveReportData(ReportData request)
        {
            oWebDb = new IncidentDb();

            var result = await oWebDb.SaveReportData((mymapper.Map<ReportData, ReportDataDto>(request)));

            return result;
        }
    }
}
