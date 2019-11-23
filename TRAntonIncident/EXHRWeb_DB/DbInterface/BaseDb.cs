using System;

using EZHRWeb_DB;
using EZHRWeb_DB.Models;
using EZHRWeb_DB.DbInterface;



namespace EZHRWeb_DB.DbInterface
{
    public partial class IncidentDb : IWebDbInterface
    {
        public string SqlConn;
       
        public IncidentDb()
        {
           SqlConn = Properties.Settings.Default.SqlComm;
        }

    }
}
