using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EZHRWeb_Business.Models
{
   public class WebPhrase
    {
        public string englishtext { get; set; }
        public string frenchtext { get; set; }
        public Int32 ID { get; set; }
        public Int32 Section { get; set; }
        public string spanishtext { get; set; }
        public Int32 subsection { get; set; }

        public WebPhrase()
        {

        }
    }
}
