using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using EZHR_Web.Models;
using EZHRWeb_Business;
using EZHRWeb_Business.Interface;
using EZHRWeb_Business.Models;


namespace EZHR_Web.Controllers
{
    public class HomeController : Controller
    {
        private IWebBusInterface oIncident  ;

        public HomeController()
        {
            oIncident = new IncidentBus();
        }

        public async Task<ActionResult> Index()
        {
           // oIncident = new IncidentBus();
           List<WebPhrase>  webPhrases = await oIncident.GetWebPhrase(100);

           WebPhrasesV webphrase = new WebPhrasesV();

           foreach (WebPhrase owp in webPhrases)
           {
               webphrase.WebPhrase.Add(owp);
           }
            return View("Index", webphrase);
        }

        public async Task<ActionResult> About()
        {

          //  oIncident = new IncidentBus();
            var WebPhrases = await oIncident.GetWebPhrase(200);

            WebPhrasesV oWwebPhrasesV = new WebPhrasesV();

           foreach (WebPhrase tphrase in WebPhrases)
           {
               oWwebPhrasesV.WebPhrase.Add(tphrase);
           }

           return View("About", oWwebPhrasesV);
        }

        public async Task<ActionResult> Contact()
        {
            ViewBag.Message = "Your contact page.";

            //  oIncident = new IncidentBus();
            var WebPhrases = await oIncident.GetWebPhrase(300);

            WebPhrasesV oWwebPhrasesV = new WebPhrasesV();

            foreach (WebPhrase tphrase in WebPhrases)
            {
                oWwebPhrasesV.WebPhrase.Add(tphrase);
            }

            return View("Contact", oWwebPhrasesV);
        }

    }
}