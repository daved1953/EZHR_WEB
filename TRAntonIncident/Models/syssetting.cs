    using System;
    using System.Collections.Generic;

namespace TRAntonIncidents.Models
{

    
    public partial class syssetting
    {
        public int ID { get; set; }
        public string Setting { get; set; }
        public string SettingValue { get; set; }
        public Nullable<System.DateTime> Insertdatetime { get; set; }
        public Nullable<System.DateTime> Updatedatetime { get; set; }
    }
}
