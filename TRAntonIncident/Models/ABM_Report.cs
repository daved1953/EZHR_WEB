 using System;
    using System.Collections.Generic;

namespace TRAntonIncidents.Models
{
   
    
    public partial class ABM_Report
    {
        public string Confirmation { get; set; }
        public Nullable<System.DateTime> CallDate { get; set; }
        public string SID { get; set; }
        public string Subscriber { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string Phone { get; set; }
        public int AutoID { get; set; }
    }
}
