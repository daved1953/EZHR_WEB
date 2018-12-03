using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace TRAntonIncident.DataInterface
{
    public class BaseDataClass
    {
        // Database string 
        public string EXHRConn = " ";

        public BaseDataClass()
        {
            EXHRConn = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ConnectionString;

        }
    }

}
}