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
    /// Summary description for updatestatus
    /// </summary>
    public class updatestatus : IHttpHandler
    {

        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        BALParticipants oBALParticipants = new BALParticipants();
        private string UserValue;
        private string suvc;
        private int retid;

        public void ProcessRequest(HttpContext context)
        {
            string txt = context.Request["txt"];
            string un = context.Request["un"];
            // isclos = false;
            oBALParticipants.updatest(txt, un, null);

           

            string json = JsonConvert.SerializeObject("");
            context.Response.ContentType = "text/json";
            context.Response.Write(json);
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