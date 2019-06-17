using System;

using EZHRWeb_DB;
using EZHRWeb_DB.Models;
using EZHRWeb_DB.DbInterface;



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
