 using System;
    using System.Collections.Generic;

namespace TRAntonIncidents.Models
{
   
    
    public partial class OldEOM
    {
        public string CallID { get; set; }
        public string Confirmation { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public Nullable<System.DateTime> CallDate { get; set; }
        public Nullable<System.DateTime> Posted_Date { get; set; }
    }
}
