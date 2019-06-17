using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EZHRWeb_Business.Models;

namespace EZHRWeb_Business.Interface
{
   public interface IWebBusInterface
    {
       Task<IncidentInput> InitIncidentObj();

       Task<List<WebPhrase>> GetWebPhrase(int vSection);



    }
}
