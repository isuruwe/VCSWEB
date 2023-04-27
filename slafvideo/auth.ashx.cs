using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace slafvideo
{
    /// <summary>
    /// Summary description for auth
    /// </summary>
    public class auth : IHttpHandler
    {

        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        bool isclose = false;
        BALParticipants oBALParticipants = new BALParticipants();
        private string uname = "";
        private string adm = "";
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                //string txt = context.Request["txt"];
                string un = context.Request["un"];
                string pw = context.Request["pw"];

                DataTable ods1 = new DataTable();
                ods1 = oBALParticipants.selectAuth(un.ToString().Trim(), null);
                DataTable ods = new DataTable();
               // ods = oBALParticipants.selectmeeeting(pw, null);
                if (ods1.Rows.Count > 0)
                {
                    //string st = ods1.Rows[0]["status"].ToString();
                    uname = ods1.Rows[0]["uname"].ToString();
                    // adm = ods.Rows[0]["callerid"].ToString();
                    //uname = ods1.Rows[0]["password"].ToString();
                    // oBALParticipants.updatecloseData(uname, "4", null);\
                    oBALParticipants.updateauth(un, uname, null);
                    DataSet ods2 = new DataSet();
                    ods2 =oBALParticipants.selectactveconf(uname, null);
                    if (ods2.Tables[0].Rows.Count > 0)
                    {

                    }
                    else
                    {
                        CMNParticipants cn2 = new CMNParticipants();
                        cn2.RegistrationNo = pw;
                        cn2.RankID = uname;
                        cn2.Surname = uname;
                        cn2.Initials = "2";
                        cn2.Status = 1;
                        oBALParticipants.insertParticipantData(cn2, null);
                    }
                        DataSet odscr = new DataSet();
                    
                       
                    
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