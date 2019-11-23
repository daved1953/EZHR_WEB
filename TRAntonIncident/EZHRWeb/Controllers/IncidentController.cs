using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using EZHR_Web.Models;
using EZHRWeb_Business.Interface;
using EZHRWeb_Business.Models;


namespace EZHR_Web.Controllers
{
    public class IncidentController : Controller
    {

        public IWebBusInterface BI;

        public IncidentController() : base()
        {
            BI = new IncidentBus();
        }

        [HttpPost]
        public ActionResult StartIncident(string trigger)
        {
            ReportDataV myIncident = new ReportDataV();
            return View("SignIn", myIncident);
        }

        [HttpPost]
        public async Task<ActionResult> ProcessSignIn(ReportDataV response)
        {
            BI = new IncidentBus();

            IncidentInput oIncident = await BI.InitIncidentObj();

            oIncident.reportData.Lname = response.Lname;
            oIncident.reportData.Fname = response.Fname;
            oIncident.reportData.DOB = response.DOB;
            oIncident.reportData.Phone = response.Phone;
            oIncident.reportData.Email = response.Email;
            oIncident.reportData.Subscriber = response.Subscriber;


            oIncident = await BI.SaveAndCreateIncident(oIncident);

           // oIncident.QID = "5003";

           // oIncident.CallFlow = oIncident.CallFlow.FindAll(m => m.PrimarySection == 5003).ToList();


            oIncident.QType =  oIncident.qMaster[0].QType;


            // call  the first question past 5000. 

            return View("_MultiQuestion", oIncident);
        }

        [HttpPost]
        public async Task<ActionResult> QuestionAnswered(IncidentInput request)
        {
            string NextQuestion = string.Empty;

            BI = new IncidentBus();

            var nextQuestion = await BI.SaveQuestionGetNext(request, request.QID);

            string nextViewName = "_Finished";

           
            if (nextQuestion.qMaster[0].QType == "MD")
            {
                nextViewName= "_MultiQuestion";
            }
            if (nextQuestion.qMaster[0].QType != "MD")
            {
                nextViewName = "_YNQuestion";
            }

            
            return PartialView(nextViewName, nextQuestion);
        }


        private async Task<IncidentInput> InitDataStructure()
        {
            IncidentInput oreportincident;

            oreportincident = await BI.InitIncidentObj();

            return oreportincident;
        }


    }
}