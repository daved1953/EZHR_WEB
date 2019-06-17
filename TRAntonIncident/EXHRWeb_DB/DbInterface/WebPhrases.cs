using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using EZHRWeb_DB.Models;

namespace EZHRWeb_DB.DbInterface
{
    public partial class IncidentDb : IWebDbInterface
    {
        /// <summary>
        /// GetWebPhraseBySection
        /// </summary>
        /// <param name="vSection"></param>
        /// <returns></returns>
        public async Task<List<WebPhraseDto>> GetWebPhraseBySection(int vSection)
        {
            List<WebPhraseDto> owebphrasedto = new List<WebPhraseDto>();

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("GetWebPhrasesbySection", sqlconn);

                cmd.Parameters.AddWithValue("@Section", vSection);

                sqlconn.Open();

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader result = await cmd.ExecuteReaderAsync();

                while (result.Read())
                {
                    WebPhraseDto tdto = new WebPhraseDto();

                    tdto.englishtext = result.GetString(result.GetOrdinal("englishtext"));
                    tdto.frenchtext = result.GetString(result.GetOrdinal("frenchtext"));
                    tdto.ID = result.GetInt32(result.GetOrdinal("ID"));
                    tdto.Section = result.GetInt32(result.GetOrdinal("Section"));
                    tdto.spanishtext = result.GetString(result.GetOrdinal("spanishtext"));
                    tdto.subsection = result.GetInt32(result.GetOrdinal("subsection"));

                    owebphrasedto.Add(tdto);
                }
            }

            return owebphrasedto;
        }

        /// <summary>
        /// GetWebPhrase
        /// </summary>
        /// <param name="vSection"></param>
        /// <returns></returns>
        public async Task<List<WebPhraseDto>> GetWebPhrase(int vSection)
        {
            List<WebPhraseDto> owebphrasedto = new List<WebPhraseDto>();

            using (SqlConnection sqlconn = new SqlConnection(SqlConn))
            {
                SqlCommand cmd = new SqlCommand("GetWebPhrasesbySection", sqlconn);

                cmd.Parameters.AddWithValue("@Section", vSection);

                sqlconn.Open();

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader result = await cmd.ExecuteReaderAsync();

                while (result.Read())
                {
                    WebPhraseDto tdto = new WebPhraseDto();

                    tdto.englishtext = result.GetString(result.GetOrdinal("englishtext"));
                    tdto.frenchtext = result.GetString(result.GetOrdinal("frenchtext"));
                    tdto.ID = result.GetInt32(result.GetOrdinal("ID"));
                    tdto.Section = result.GetInt32(result.GetOrdinal("Section"));
                    tdto.spanishtext = result.GetString(result.GetOrdinal("spanishtext"));
                    tdto.subsection = result.GetInt32(result.GetOrdinal("subsection"));

                    owebphrasedto.Add(tdto);
                }
            }

            return owebphrasedto;
        }
    }
}
