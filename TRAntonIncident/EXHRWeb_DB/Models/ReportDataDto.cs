using System;

namespace EZHRWeb_DB.Models
{
    public class ReportDataDto
    {
        public string AnonReq { get; set; }
        public Int32 AutoID { get; set; }
        public DateTime CallDate { get; set; }
        public string CallID { get; set; }
        public bool CallPosted { get; set; }
        public string CallStatus { get; set; }
        public string CBtime { get; set; }
        public string Comments { get; set; }
        public string Confirmation { get; set; }
        public string DOB { get; set; }
        public string Fname { get; set; }
        public string Lang { get; set; }
        public string Lname { get; set; }
        public string Phone { get; set; }
        public DateTime PostedDate {get;set;}
        public string SID { get; set; }
        public string Subscriber { get; set; }
        public bool verified { get; set; }
        public string Verifiedby { get; set; }
        public DateTime VerifiedDate { get; set; }
        public string Email { get; set; }

        public ReportDataDto()
        {

        }
}
}
