using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB.DbInterface
{
   public class SaveIncidentData :BaseDb
    {
        public SqlConnection sqlConn;

        public SaveIncidentData()
        {
            sqlConn = new SqlConnection(SqlConn);
        }


        public bool SaveReportData(ReportDataDto request)
        {
            // insert record into ReportData 

            using (SqlConnection sqlconn = sqlConn)
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
