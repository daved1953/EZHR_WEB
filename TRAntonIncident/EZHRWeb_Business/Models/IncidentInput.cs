using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace EZHRWeb_Business.Models
{
    public class IncidentInput
    {
        // this defines the contents for a incident report 

        public string CallId { get; set; }
        public string QID { get; set; }
        public string Qmasterrqid { get; set; }
         [Display(Name = "Place your answer here")] 
        public int Answer { get; set; }

        public bool bAnswer { get; set; }

        public string QType { get; set; }

        public QMaster currentQMaster { get; set; }

        public DMaker currentDMaker { get; set; }

        public SampleCallFlow currentHeadCallFlow { get; set; }

        public List<QMaster> qMaster { get; set; }

        public List<DMaker> dMaker { get; set; }

        public List<RespData> responses { get; set; }

        public List<SampleCallFlow> CallFlow { get; set; }

        public ReportData reportData { get; set; }

        public IncidentInput(int trigger)
        {
          CallId = "WEB-" + DateTime.Now.ToString("ddyyssmmMMHH-0");
            //  QID = "WEB-" + DateTime.Now.ToString("ddyyssmmMMHH-0");
            responses = new List<RespData>();
            dMaker = new List<DMaker>();

            responses = new List<RespData>();

            CallFlow = new List<SampleCallFlow>();
        }

        public IncidentInput()
        {
            responses = new List<RespData>();
            qMaster = new List<QMaster>();

            dMaker = new List<DMaker>();

            responses = new List<RespData>();

            CallFlow = new List<SampleCallFlow>();
        }
    }
}