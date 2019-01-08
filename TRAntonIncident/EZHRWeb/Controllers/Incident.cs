using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using EZHRWeb_Business.Interface;
using EZHRWeb_Business.Models;


namespace EZHR_Web.Controllers
{
    public class Incident :Controller
    {

        public IWebBusInterface BI ;

        public Incident() :base()
        {
          
        }

        public async Task<ActionResult> StartIncident()
        {
           IncidentInput myIncident = await InitDatastructure();
           return PartialView("IncidentStart", myIncident);
        }

        public ActionResult ProcessSignin(IncidentInput myIncident)
        {
            // save the name anaonymouse and phone number and email input.





           /// call  the first question past 5000. 

           return PartialView("FirstQuestion", myIncident);
        }








        private Task<IncidentInput> InitDatastructure()
        {
           return Task.Run(async() => await BI.InitIncidentObj());
        }
            


    }
}