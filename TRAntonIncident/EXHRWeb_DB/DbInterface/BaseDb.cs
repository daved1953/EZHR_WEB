using System;
using System.Configuration;

namespace EXHRWeb_DB.DbInterface
{
    public class BaseDb
    {
        public string SqlConn;

        public BaseDb()
        {
            SqlConn = ConfigurationManager.AppSettings["SqlComm"];

        }

    }
}
