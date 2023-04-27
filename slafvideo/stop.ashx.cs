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
    /// Summary description for stop
    /// </summary>
    public class stop : IHttpHandler
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
            oBALParticipants.deleteParticipantData(txt, "3", null);

            DataTable dtAllParticipants = new DataTable();
            dtAllParticipants = oBALParticipants.selectAllusers(un, null);
            //dataGridView1.DataSource = dtAllParticipants;



            if (dtAllParticipants.Rows.Count > 0)
            {
                //cnt = 1;

                string chlb = dtAllParticipants.Rows[0]["channel"].ToString();

                DataTable dtAllParticipants1 = new DataTable();
                dtAllParticipants1 = oBALParticipants.selectcurusers(chlb, null);
                if (dtAllParticipants1.Rows.Count > 1)
                {

                }
                else
                {
                    try
                    {

                        oBALParticipants.updatecloseData(un, "3", null);
                        //System.Diagnostics.Process.Start(@"chrome.exe", "https://meet.jit.si/" );
                    }
                    catch (Exception eex)
                    {
                    }
                }

            }
            else
            {

            }

            string json = JsonConvert.SerializeObject(suvc);
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