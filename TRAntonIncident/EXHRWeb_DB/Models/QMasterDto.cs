using System;

namespace EZHRWeb_DB.Models
{
   public  class QMasterDto
    {
        public Int32 Id { get; set; }
        public string MaxDigits { get; set; }
        public string NextQid { get; set; }
        public string Qid { get; set; }
        public string QType { get; set; }
        public string Question { get; set; }

        public QMasterDto()
        {

        }
    }
}
