using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace ResxTranslator
{
   public class ClsDatabase
   {

      public string ConnectionSring;

     public  SqlConnection sqlconn;

       

       public ClsDatabase(string strConnection)
       {
          sqlconn = new SqlConnection(strConnection); 
         
           sqlconn.Open();      
       }


       public  List<string> GetTables()
       {
           var tblList = new List<string>();

           string cmdgettabls = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES"; 
               
               // WHERE TABLE_TYPE = 'BASE TABLE'";
         
           SqlCommand ocommand= new SqlCommand(cmdgettabls, sqlconn);;
           
           SqlDataReader odttabls = ocommand.ExecuteReader();

           if (odttabls.HasRows)
           {
               while (odttabls.Read())
               {
                   tblList.Add(odttabls.GetString(0));
               }
           }
           return tblList;
       }

       public List<string> GetColumns(string strTablename)
       {
           var tblList = new List<string>();

           string cmdgettabls = "select column_name from INFORMATION_SCHEMA.COLUMNS "+
                                    "where TABLE_NAME='"+ strTablename +"' ";

           SqlCommand ocommand = new SqlCommand(cmdgettabls, sqlconn); ;

           SqlDataReader odttabls = ocommand.ExecuteReader();

           if (odttabls.HasRows)
           {
               while (odttabls.Read())
               {
                   tblList.Add(odttabls.GetString(0));
               }
           }
           return tblList;
       } 


   }
}
