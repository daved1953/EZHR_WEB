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
    public class IncidentController :Controller
    {

        public IWebBusInterface BI ;

        public IncidentController() :base()
        {
            BI = new Incident();
        }
        [HttpPost]
        public ActionResult StartIncident()
        {
           IncidentInput myIncident =   InitDatastructure();


           return PartialView("SignIn", myIncident);
        }

        [HttpPost]
        public ActionResult ProcessSignin(IncidentInput myIncident)
        {
            // save the name anaonymouse and phone number and email input.
            


           /// call  the first question past 5000. 

           return PartialView("FirstQuestion", myIncident);
        }
        


        private  IncidentInput InitDatastructure()
        {
            IncidentInput oreportincident;
            oreportincident= BI.InitIncidentObj();

            return oreportincident; 
        }
            


    }
}