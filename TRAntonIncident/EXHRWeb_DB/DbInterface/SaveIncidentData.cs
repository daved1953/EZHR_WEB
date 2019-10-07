using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading.Tasks;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB.DbInterface
{
    public partial class IncidentDb : IWebDbInterface
    {

        public async Task<bool> SaveReportData(ReportDataDto request)
        {
            // insert record into ReportData 

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("InsertReportData", sqlconn);

                sqlconn.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@AnonReq", request.AnonReq);
                cmd.Parameters.AddWithValue("@CallDate", DateTime.Now.ToString(CultureInfo.InvariantCulture));
                cmd.Parameters.AddWithValue("@CallID", request.CallID);
                cmd.Parameters.AddWithValue("@CallPosted", DBNull.Value);
                cmd.Parameters.AddWithValue("@CallStatus", "Web");
                cmd.Parameters.AddWithValue("@CBtime", DBNull.Value);
                cmd.Parameters.AddWithValue("@Comments", string.Empty);
                cmd.Parameters.AddWithValue("@Confirmation", DBNull.Value);
                cmd.Parameters.AddWithValue("@DOB", request.DOB);
                cmd.Parameters.AddWithValue("@EmailAddress", request.Email);
                cmd.Parameters.AddWithValue("@Fname", request.Fname);
                cmd.Parameters.AddWithValue("@Lang", "Web");
                cmd.Parameters.AddWithValue("@Lname", request.Lname);
                cmd.Parameters.AddWithValue("@Phone", request.Phone);
                cmd.Parameters.AddWithValue("@PostedDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@SID", request.SID);
                cmd.Parameters.AddWithValue("@Subscriber", DBNull.Value);
                cmd.Parameters.AddWithValue("@verified", false);
                cmd.Parameters.AddWithValue("@Verifiedby", DBNull.Value);
                cmd.Parameters.AddWithValue("@VerifiedDate", DBNull.Value);

                await cmd.ExecuteNonQueryAsync();


                sqlconn.Close();
            }

            return true;

        }

        public async Task<bool> SaveQuestionAnswer(List<RespDataDto> requests, string qidsave)
        {
            RespDataDto oRespDataDto = requests.Find(m => m.QID == qidsave);


            // insert record into RepData  from list object called at endof Incident input  
            // insert record into ReportData 

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("InsertRespData", sqlconn);

                sqlconn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CallID", oRespDataDto.CallID);
                cmd.Parameters.AddWithValue("@QID", oRespDataDto.QID);
                cmd.Parameters.AddWithValue("@Dcollect", oRespDataDto.Dcollect);


                await cmd.ExecuteNonQueryAsync();
            }

            return true;
        }


    }
}
