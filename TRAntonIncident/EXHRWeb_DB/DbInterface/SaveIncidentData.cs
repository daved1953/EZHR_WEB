using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB.DbInterface
{
   public class SaveIncidentData
    {

        public bool SaveReportData(ReportDataDto request)
        {
            // insert record into ReportData 

            return true;
        }

        public bool SaveRepData(List<ReportDataDto> request)
        {
            // insert record into RepData  from list object called at endof Incident input  
        
             return true;
        }


    }
}
