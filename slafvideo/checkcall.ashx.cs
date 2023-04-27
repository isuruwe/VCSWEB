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
    /// Summary description for checkcall
    /// </summary>
    public class checkcall : IHttpHandler
    {
        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        bool isclose = false;
        BALParticipants oBALParticipants = new BALParticipants();
        private string chanl="";

        public void ProcessRequest(HttpContext context)
        {
            try {
                //string txt = context.Request["txt"];
                string un = context.Request["un"];
                DataTable ods1 = new DataTable();
                ods1 = oBALParticipants.selectAllusers(un.ToString().Trim(), null);

                if (ods1.Rows.Count > 0)
                {
                    //string st = ods1.Rows[0]["status"].ToString();
                     chanl = ods1.Rows[0]["channel"].ToString();

                   

                }


                string json = JsonConvert.SerializeObject(ods1);
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