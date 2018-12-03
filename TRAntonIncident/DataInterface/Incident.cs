using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TRAntonIncidents.Models;

namespace TRAntonIncident.DataInterface
{
    public class Incident : BaseDataClass
    {

        public async Task<List<SampleCallFlow>> GetCallFlow()
        {
            List<SampleCallFlow> callFlow = new List<SampleCallFlow>();

            using (var sqlconnection = new SqlConnection(EXHRConn))
            {

                sqlconnection.Open();
                               
                SqlCommand cmd  = new SqlCommand("SelectCallFlowParms", sqlconnection);

                cmd.CommandType = CommandType.StoredProcedure

                var result = await cmd.ExecuteReaderAsync();
                
                 while (result.Read())
                {
                    SampleCallFlow callItem = new SampleCallFlow();

                    callItem.Action = result.GetInt32(result.GetOrdinal("Action"));
                    callItem.ID = result.GetInt32(result.GetOrdinal("ID"));
                    callItem.PrimarySection = result.GetInt32(result.GetOrdinal("PrimarySection"));
                    callItem.QuestionType = result.GetString(result.GetOrdinal("QuestionType"));
                    callItem.Section = result.GetDecimal(result.GetOrdinal("Section"));
                    callItem.Sectiontype = result.GetString(result.GetOrdinal("Sectiontype"));
                    callItem.SubSection = result.GetInt32(result.GetOrdinal("SubSection"));
                    callItem.Verbage = result.GetString(result.GetOrdinal("Verbage"));

                    callFlow.Add(callItem);
                 }

                return callFlow;
            }

        }

         public async Task<List<Dmaker>> GetDmaker()
        {
            List<DMaker> dMaker = new List<DMaker>();

            using (var sqlconnection = new SqlConnection(EXHRConn))
            {

                sqlconnection.Open();

                SqlCommand cmd = new SqlCommand("SelectCallFlowParms", sqlconnection);

                cmd.CommandType = CommandType.StoredProcedure

                var result = await cmd.ExecuteReaderAsync();

                while (result.Read())
                {


                }

    }
}