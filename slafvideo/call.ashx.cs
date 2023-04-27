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
    /// Summary description for call
    /// </summary>
    public class call : IHttpHandler
    {

        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        BALParticipants oBALParticipants = new BALParticipants();
        private string UserValue;
        private string suvc;
        private int retid=0;

        public void ProcessRequest(HttpContext context)
        {
            string txt = context.Request["txt"];
            string un = context.Request["un"];
            string chid = context.Request["ch"];
            DataSet odscrnw = new DataSet();
            odscrnw = oBALParticipants.selectactveconf(txt.ToString(), null);
            

            if (odscrnw.Tables[0].Rows.Count > 0)
            {
               string chnlid= odscrnw.Tables[0].Rows[0]["channel"].ToString();
                DataTable odsx1 = new DataTable();
                odsx1 = oBALParticipants.selectmeeeting1(chnlid, null);

                if (odsx1.Rows.Count > 1)
                {
                    // suvc = "Caller is in another Call use meetings to join their call!";

                  //  oBALParticipants.updatecloseData(txt.ToString(), "4", null);
                    CMNParticipants cn = new CMNParticipants();
                    cn.Surname = txt;


                    cn.RegistrationNo = chid;
                    cn.RankID = un;
                    cn.Initials = "1";
                    cn.Status = 0;
                    retid = oBALParticipants.insertParticipantData(cn, null);


                }
                else
                {
                    oBALParticipants.updatecloseData(txt.ToString(), "4", null);
                    CMNParticipants cn = new CMNParticipants();
                    cn.Surname = txt;


                    cn.RegistrationNo = chid;
                    cn.RankID = un;
                    cn.Initials = "1";
                    cn.Status = 0;
                    retid = oBALParticipants.insertParticipantData(cn, null);

                    /////////////
                    DataSet odscr = new DataSet();
                    odscr = oBALParticipants.selectactveconf(un.ToString().Trim(), null);

                    if (odscr.Tables[0].Rows.Count > 0)
                    {
                    }
                    else
                    {
                        CMNParticipants cn2 = new CMNParticipants();
                        cn2.RegistrationNo = chid;
                        cn2.RankID = un;
                        cn2.Surname = un;
                        cn2.Initials = "2";
                        cn2.Status = 1;
                        oBALParticipants.insertParticipantData(cn2, null);
                    }
                }
                   
            }
            else
            {
               
                CMNParticipants cn = new CMNParticipants();
                cn.Surname = txt;

                
                cn.RegistrationNo = chid;
                cn.RankID = un;
                cn.Initials = "1";
                cn.Status = 0;
                retid = oBALParticipants.insertParticipantData(cn, null);
                
                 /////////////
                 DataSet odscr = new DataSet();
                odscr = oBALParticipants.selectactveconf(un.ToString().Trim(), null);

                if (odscr.Tables[0].Rows.Count > 0)
                {
                }
                else
                {
                    CMNParticipants cn2 = new CMNParticipants();
                    cn2.RegistrationNo = chid;
                    cn2.RankID = un;
                    cn2.Surname = un;
                    cn2.Initials = "2";
                    cn2.Status = 1;
                    oBALParticipants.insertParticipantData(cn2, null);
                }

               

            }

            string json = JsonConvert.SerializeObject(retid.ToString());
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