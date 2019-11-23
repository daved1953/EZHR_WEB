using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EZHRWeb_Business.Models;
using EZHRWeb_DB.Models;

namespace EZHRWeb_Business.Interface
{
   public interface IWebBusInterface
    {
       Task<IncidentInput> InitIncidentObj();

       Task<List<WebPhrase>> GetWebPhrase(int vSection);

       Task<IncidentInput> SaveAndCreateIncident(IncidentInput request);

       Task<IncidentInput> SaveQuestionGetNext(IncidentInput responses, string QuestionId);

       Task<List<DMaker>> LoadNextDMaker(string requestQid);
    }
}
