 using System;
    using System.Collections.Generic;

namespace TRAntonIncidents.Models
{
   
    
    public partial class unverified
    {
        public string Confirmation { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string SID { get; set; }
        public string Subscriber { get; set; }
        public string DOB { get; set; }
        public string Phone { get; set; }
        public string CBtime { get; set; }
        public string AnonReq { get; set; }
        public string Lang { get; set; }
        public string Comments { get; set; }
        public Nullable<bool> verified { get; set; }
        public string Verifiedby { get; set; }
        public Nullable<System.DateTime> VerifiedDate { get; set; }
        public Nullable<System.DateTime> CallDate { get; set; }
        public string CallStatus { get; set; }
        public string CallID { get; set; }
        public string QID { get; set; }
        public string Dcollect { get; set; }
        public Nullable<System.DateTime> Posted_Date { get; set; }
    }
}
