using System;

namespace EZHRWeb_DB.Models
{
   public class SampleCallFlowDto
    {
        public Int32 Action { get; set; }
        public Int32 ID { get; set; }
        public Int32 PrimarySection { get; set; }
        public string Qid { get; set; }
        public string QuestionType { get; set; }
        public Int32 Section { get; set; }
        public string SectionType { get; set; }
        public Int32 SubSection { get; set; }
        public string Verbage { get; set; }

        public SampleCallFlowDto()
        {

        }

    }
}
