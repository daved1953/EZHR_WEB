using System;
using System.Configuration;

namespace EZHRWeb_DB.DbInterface
{
    public class BaseDb
    {
        public string SqlConn;

        public BaseDb()
        {
            SqlConn = Properties.Settings.Default.SqlComm;

        }

    }
}
