using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EZHRWeb_Business.Models
{
   public class SampleCallFlow
    {
        public decimal Action { get; set; }
        public Int32 ID { get; set; }
        public Int32 PrimarySection { get; set; }
        public string Qid { get; set; }
        public string QuestionType { get; set; }
        public decimal Section { get; set; }
        public string SectionType { get; set; }
        public DateTime SsmaTimeStamp { get; set; }
        public Int32 SubSection { get; set; }
        public string Verbage { get; set; }

        public SampleCallFlow()
        {

        }

    }
}
