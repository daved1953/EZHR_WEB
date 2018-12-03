 using System;
    using System.Collections.Generic;

namespace TRAntonIncidents.Models
{
   
    
    public partial class QMaster
    {
        public string QID { get; set; }
        public string QType { get; set; }
        public string MaxDigits { get; set; }
        public string NextQID { get; set; }
        public string Question { get; set; }
    }
}
