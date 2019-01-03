using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EZHRWeb_Business.Models
{
   public  class QMaster
    {
        public Int32 Id { get; set; }
        public string MaxDigits { get; set; }
        public string NextQid { get; set; }
        public string Qid { get; set; }
        public string QType { get; set; }
        public string Question { get; set; }

        public QMaster()
        {

        }
    }
}
