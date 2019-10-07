using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EZHRWeb_Business.Models
{
    public class ReportData
    {
        public bool AnonReq { get; set; }
        public Int32 AutoID { get; set; }
        public DateTime CallDate { get; set; }
        public string CallID { get; set; }
        public bool CallPosted { get; set; }
        public string CallStatus { get; set; }
        public string CBtime { get; set; }
        public string Comments { get; set; }
        public string Confirmation { get; set; }
        [Display(Name = "Enter Your Date of Birth")]
        public string DOB { get; set; }
        [Display(Name = "Enter Your FirstName")]
        public string Fname { get; set; }
        public string Lang { get; set; }
        [Display(Name = "Enter Your Last Name")]
        public string Lname { get; set; }
        [Display(Name = "Enter Your Phone Number")]
        public string Phone { get; set; }
        public DateTime PostedDate {get;set;}
        public string SID { get; set; }
        public string Subscriber { get; set; }
        public bool verified { get; set; }
        public string Verifiedby { get; set; }
        public DateTime VerifiedDate { get; set; }
        [Display(Name = "If you haeve a email address enter it here")]
        public string Email { get; set; }

        public ReportData()
        {
            SID = "";
        }
}
}
