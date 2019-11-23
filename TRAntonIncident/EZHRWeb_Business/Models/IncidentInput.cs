using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace EZHRWeb_Business.Models
{
    public class IncidentInput
    {
        // this defines the contents for a incident report 

        public string QID { get; set; }
        public string Qmasterrqid { get; set; }

        public QMaster  currentQMaster { get; set; }

        public DMaker currentDMaker {get;set;}

        public SampleCallFlow currentHeadCallFlow { get; set; }

        public List<QMaster> qMaster { get; set; }

        public List<DMaker> dMaker { get; set; }

        public List<RespData> responses { get; set; }

        public List<SampleCallFlow> CallFlow { get; set; }

        public ReportData reportData { get; set; }

        public IncidentInput()
        {
            QID = "WEB-" + DateTime.Now.ToString("MMDDYYYHHmmss");
          //  QID = "WEB-" + DateTime.Now.ToString("ddyyssmmMMHH-0");
        }
    }
}