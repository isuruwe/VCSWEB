using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
namespace slafvideo
{
    /// <summary>
    /// Summary description for getcall
    /// </summary>
    public class getcall : IHttpHandler
    {

        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        bool isclose = false;
        BALParticipants oBALParticipants = new BALParticipants();
        private string chanl = "";


        public void ProcessRequest(HttpContext context)
        {
            try
            {
                //string txt = context.Request["txt"];
                string un = context.Request["txt"];
                DataTable ods1 = new DataTable();
                ods1 = oBALParticipants.selectwait(un.ToString().Trim(), null);

                if (ods1.Rows.Count > 0)
                {

                    chanl = "suc";



                }


                string json = JsonConvert.SerializeObject(chanl);
                context.Response.ContentType = "text/json";
                context.Response.Write(json);
            }
            catch (Exception ex)
            {

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}