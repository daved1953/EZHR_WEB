using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading;

namespace TRAntonIncident
{
    public class _CoreController : Controller
    {
        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string cultureName = SessionHelper.get_LangCode();
            if (cultureName != string.Empty)
            {
                // Modify current thread's cultures
                //Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
                Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(cultureName);
                //Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
            }
            if (state == null)
                state = true;
            return base.BeginExecuteCore(callback, state);
        }

    }
}