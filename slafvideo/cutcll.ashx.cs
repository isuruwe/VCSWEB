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
    /// Summary description for cutcll
    /// </summary>
    public class cutcll : IHttpHandler
    {

        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        bool isclose = false;
        BALParticipants oBALParticipants = new BALParticipants();
        private string chanl = "";
        string msg = "";
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                //string txt = context.Request["txt"];
                string un = context.Request["clid"];
                string chl = context.Request["chl"];
                string clid = context.Request["txt"];
                
                try
                {
                   
                      

                       
                        string val1 = clid.ToString();


                        DataSet odscr = new DataSet();

                        odscr = oBALParticipants.selectadmin(un.ToString().Trim(), null);
                        if (val1.ToLower() == un.ToString().ToLower().Trim())
                        {
                            oBALParticipants.updatecloseData(val1, "4", null);
                            string val22 = chl.ToString();
                            DataTable sdfg2 = new DataTable();
                            sdfg2 = oBALParticipants.selectcurusers(val22, null);
                            if (odscr.Tables[0].Rows.Count > 0)
                            {
                                if (val1.ToLower() == odscr.Tables[0].Rows[0]["callerid"].ToString().ToLower().Trim())
                                {
                                    foreach (DataRow rowr in sdfg2.Rows)
                                    {
                                        string dfghj = rowr["callerid"].ToString();
                                        oBALParticipants.updatecloseData(dfghj, "4", null);
                                    msg = "Disconnected";
                                }

                                }
                            }
                        }
                        else
                        {
                            if (odscr.Tables[0].Rows.Count > 0)
                            {


                                oBALParticipants.updatecloseData(val1, "4", null);
                            msg = "Disconnected";

                        }
                            else
                            {
                            msg="You can only disconnect your connection !";
                            }
                        }

                        string val2 = chl.ToString();
                        DataTable sdfg = new DataTable();
                        sdfg = oBALParticipants.selectcurusers(val2, null);
                        if (sdfg.Rows.Count == 1)
                        {
                            string clkd = sdfg.Rows[0]["callerid"].ToString();
                            oBALParticipants.updatecloseData(clkd, "4", null);
                        msg = "Disconnected";
                    }

                    
                }
                catch (Exception ex)
                {
                    msg = "Error!";
                }




                string json = JsonConvert.SerializeObject(msg);
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