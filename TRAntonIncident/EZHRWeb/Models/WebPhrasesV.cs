using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EZHRWeb_Business.Models;

namespace EZHR_Web.Models
{
    public class WebPhrasesV
    {
         public List<WebPhrase> WebPhrase { get; set; }

         public WebPhrasesV()
         {
             WebPhrase = new List<WebPhrase>();
         }
    }
}