using EZHRWeb_DB.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using AutoMapper; 


namespace EZHRWeb_DB.DbInterface
{
    public partial class IncidentDb : IWebDbInterface
    {

        //public InitIncident()
        //{
        //    sqlConn = new SqlConnection(SqlConn);
        //}

        /// <summary>
        /// loads Dmake default values.  based on requystQid.
        /// 
        /// </summary>
        /// <param name="requestQid"></param>
        /// <returns></returns>
        public async Task<List<DMakerDto>> SelectAllDMaker(string requestQid)
        {
            List<DMakerDto> requesteddata = new List<DMakerDto>();
            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd; 
                if (requestQid != string.Empty)
                {
                  cmd = new SqlCommand("GetDMaker", sqlconn);
                }
                else
                {
                  cmd = new SqlCommand("GetDMakerByQID", sqlconn);
                  cmd.Parameters.AddWithValue("@QID",requestQid);
               
                }
                
                sqlconn.Open();
               
                    

                cmd.CommandType = CommandType.StoredProcedure;
                

                SqlDataReader reader = await cmd.ExecuteReaderAsync();

                while (reader.Read())
                {
                    DMakerDto thisrow = new DMakerDto();

                    thisrow.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                    thisrow.QID = reader.GetString(reader.GetOrdinal("QId"));
                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R1"))))
                    {
                        thisrow.R1 = string.Empty;
                    }
                    else
                    {
                        thisrow.R1 = reader.GetString(reader.GetOrdinal("R1"));
                    }
                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R2"))))
                    {
                        thisrow.R2 = string.Empty;
                    }
                    else
                    {
                        thisrow.R2 = reader.GetString(reader.GetOrdinal("R2"));
                    }
                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R3"))))
                    {
                        thisrow.R3 = string.Empty;
                    }
                    else
                    {
                        thisrow.R3 = reader.GetString(reader.GetOrdinal("R3"));
                    }

                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R4"))))
                    {
                        thisrow.R4 = string.Empty;
                    }
                    else
                    {
                        thisrow.R4 = reader.GetString(reader.GetOrdinal("R4"));
                    }

                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R5"))))
                    {
                        thisrow.R5 = string.Empty;
                    }
                    else
                    {
                        thisrow.R5 = reader.GetString(reader.GetOrdinal("R5"));
                    }

                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R6"))))
                    {
                        thisrow.R6 = string.Empty;
                    }
                    else
                    {
                        thisrow.R6 = reader.GetString(reader.GetOrdinal("R6"));
                    }

                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R7"))))
                    {
                        thisrow.R7 = string.Empty;
                    }
                    else
                    {
                        thisrow.R7 = reader.GetString(reader.GetOrdinal("R7"));
                    }

                    if (String.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("R8"))))
                    {
                        thisrow.R8 = string.Empty;
                    }
                    else
                    {
                        thisrow.R8 = reader.GetString(reader.GetOrdinal("R8"));
                    }


                    if (String.IsNullOrEmpty(reader.GetValue(reader.GetOrdinal("R9")).ToString()))
                    {
                        thisrow.R9 = string.Empty;
                    }
                    else
                    {
                        thisrow.R9 = reader.GetString(reader.GetOrdinal("R9"));
                    }

                    requesteddata.Add(thisrow);
                }
            }
            return requesteddata;
        }

        /// <summary>
        /// Qmaster details
        /// </summary>
        /// <returns></returns>
        public async Task<List<QMasterDto>> GetQMaster()
        {
            List<QMasterDto> qmasters = new List<QMasterDto>();

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("GetQmaster", sqlconn);

                sqlconn.Open();

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader result = await cmd.ExecuteReaderAsync();

                while (result.Read())
                {
                    QMasterDto qmaster = new QMasterDto();
                    qmaster.Id = result.GetInt32(result.GetOrdinal("Id"));
                    qmaster.MaxDigits = result.GetString(result.GetOrdinal("MaxDigits"));
                    qmaster.NextQid = result.GetString(result.GetOrdinal("NextQID"));
                    qmaster.Qid = result.GetString(result.GetOrdinal("QID"));
                    qmaster.QType = result.GetString(result.GetOrdinal("QType"));
                    qmaster.Question = result.GetString(result.GetOrdinal("Question"));
                    qmasters.Add(qmaster);
                }
                sqlconn.Close();
            }
            return qmasters;
        }

        /// <summary>
        /// SampleCallFLow items
        /// </summary>
        /// <returns></returns>
        public async Task<List<SampleCallFlowDto>> GetSampleCallFlow()
        { List<SampleCallFlowDto> returnresult = new List<SampleCallFlowDto>();
            SampleCallFlowDto vSampleCallFlow;
            try
            {

                using (SqlConnection sqlconn = new SqlConnection(SqlConn))
                {
                    SqlCommand cmd = new SqlCommand("GetSampleCallFlow", sqlconn);

                    sqlconn.Open();

                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataReader result = await cmd.ExecuteReaderAsync();

                    DataTable odt = result.GetSchemaTable();

                    while (result.Read())
                    {
                        vSampleCallFlow = new SampleCallFlowDto();

                         vSampleCallFlow.ID = result.GetInt32(result.GetOrdinal("Id"));
                        vSampleCallFlow.Action = result.GetInt32(result.GetOrdinal("Action"));
                       vSampleCallFlow.PrimarySection = result.GetInt32(result.GetOrdinal("PrimarySection"));
                        //vSampleCallFlow.Qid = result.GetString(result.GetOrdinal("QID"));
                        vSampleCallFlow.QuestionType = result.GetString(result.GetOrdinal("QuestionType"));
                     //   vSampleCallFlow.Section = result.GetInt32(result.GetOrdinal("Section"));
                        vSampleCallFlow.SectionType = result.GetString(result.GetOrdinal("Sectiontype"));
                        //vSampleCallFlow.SsmaTimeStamp = result.GetDateTime(result.GetOrdinal("SSMA_TimeStamp"));
                        vSampleCallFlow.SubSection =result.GetInt32(result.GetOrdinal("SubSection"));
                        vSampleCallFlow.Verbage = result.GetString(result.GetOrdinal("Verbage"));

                        returnresult.Add(vSampleCallFlow);
                    }

                    sqlconn.Close();
                }


                return returnresult;
            }

            catch (Exception ex)
            {
                throw new Exception( ex.Message,ex.InnerException);
            }
        }

      

        /// <summary>
        /// ReportData Template
        /// </summary>
        /// <returns></returns>
        public async Task<ReportDataDto> GetReportDataTemplate()
        {
            ReportDataDto newReportData = new ReportDataDto();

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("GetReportDataTEmplate", sqlconn);

                sqlconn.Open();

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader result =  await cmd.ExecuteReaderAsync();

                while (result.Read())
                {
                    newReportData.AnonReq = result.GetString(result.GetOrdinal("AnonReq"));
                    newReportData.AutoID = result.GetInt32(result.GetOrdinal("AutoID"));
                    newReportData.CallDate = result.GetDateTime(result.GetOrdinal("CallDate"));
                    newReportData.CallID = result.GetString(result.GetOrdinal("CallID"));
                    newReportData.CallPosted = result.GetBoolean(result.GetOrdinal("CallPosted"));
                    newReportData.CallStatus = result.GetString(result.GetOrdinal("CallStatus"));
                    newReportData.CBtime = result.GetString(result.GetOrdinal("CBtime"));
                    newReportData.Comments = result.GetString(result.GetOrdinal("Comments"));
                    newReportData.Confirmation = result.GetString(result.GetOrdinal("Confirmation"));
                    newReportData.DOB = result.GetString(result.GetOrdinal("DOB"));
                    newReportData.Fname = result.GetString(result.GetOrdinal("Fname"));
                    newReportData.Lang = result.GetString(result.GetOrdinal("Lang"));
                    newReportData.Lname = result.GetString(result.GetOrdinal("Lname"));
                    newReportData.Phone = result.GetString(result.GetOrdinal("Phone"));
                    newReportData.PostedDate = result.GetDateTime(result.GetOrdinal("Posted Date"));
                    newReportData.SID = result.GetString(result.GetOrdinal("SID"));
                    newReportData.Subscriber = result.GetString(result.GetOrdinal("Subscriber"));
                    newReportData.verified = result.GetBoolean(result.GetOrdinal("verified"));
                    newReportData.Verifiedby = result.GetString(result.GetOrdinal("Verifiedby"));
                    newReportData.VerifiedDate = result.GetDateTime(result.GetOrdinal("VerifiedDate"));
                }
                sqlconn.Close();
            }
           
            return newReportData;
        }

        /// <summary>
        /// GetResponseDataTemplate 
        /// </summary>
        /// <returns></returns>
        public async Task<RespDataDto> GetRespDataTemplate()
        {
            RespDataDto newRespData = new RespDataDto();

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("GetRespData", sqlconn);
                sqlconn.Open();

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader result = await cmd.ExecuteReaderAsync();

                while (result.Read())
                {
                    newRespData.CallID = result.GetString(result.GetOrdinal("CallID"));
                    newRespData.Dcollect = result.GetString(result.GetOrdinal("Dcollect"));
                    newRespData.id = result.GetInt32(result.GetOrdinal("id"));
                    newRespData.QID = result.GetString(result.GetOrdinal("QID"));
                }

                sqlconn.Close();
            }

            return newRespData;
        }
    }
}
