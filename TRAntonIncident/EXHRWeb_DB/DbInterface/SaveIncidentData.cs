using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB.DbInterface
{
    public partial class IncidentDb : IWebDbInterface
    {

        public bool SaveReportData(ReportDataDto request)
        {
            // insert record into ReportData 

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("GetDMaker", sqlconn);

                sqlconn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                sqlconn.Close();
            }

            return true;

        }

        public bool SaveRepData(List<ReportDataDto> request)
        {
            // insert record into RepData  from list object called at endof Incident input  
                 


             return true;
        }


    }
}
