using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TRAntonIncident 
{
    public class IncidentFlow
    {

        public IncidentFlow()
        {
         // get connection string and save, load Dmaster, Qmaster, SampleCallFLow, QuestionTypes
         // Question types will call to a view for each type found

         // IncidentReport will build and support logic needed to work through Questions. 
            
        }

        public bool StartIncident()
        {
            // read frist record from DMaster 
      
        // Class Dmaster has flow 
        // SampleCallFlow has all possible text to be displayed
        // QMaster has Question type ( 0 = header, display, .X> 0 = possible responses
        // Call View to support dmaster question type

        // DMaster record 1
        // load multi select view 
        // display text for Question1, display text for possible answers since multiple choice. 



            return true;

        }

    }
}