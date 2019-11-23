using System;

namespace EZHRWeb_DB.Models
{
    public class WebPhraseDto
    {
        public string englishtext { get; set; }
        public string frenchtext { get; set; }
        public Int32 ID { get; set; }
        public Int32 Section { get; set; }
        public string spanishtext { get; set; }
        public Int32 subsection { get; set; }

        public WebPhraseDto()
        {

        }
    }
}
