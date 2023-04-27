using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;


namespace slafvideo
{
    /// <summary>
    /// Summary description for gethome
    /// </summary>
    public class gethome : IHttpHandler
    {
        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        bool isclose = false;
        BALParticipants oBALParticipants = new BALParticipants();
        private string chanl = "";
        DataTable dtAllParticipants = new DataTable();

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                //string txt = context.Request["txt"];
                string un = context.Request["tt"];
                try
                {
                    oBALParticipants.updateonline(un, null);
                    dtAllParticipants = oBALParticipants.getAllParticipantData(null);

                    dtAllParticipants.Columns.Add("online", typeof(System.String));
                    if (dtAllParticipants.Rows.Count > 0)
                    {

                        foreach (DataRow rowr in dtAllParticipants.Rows)
                        {
                            string[] validformats = new[] { "MM/dd/yyyy", "yyyy/MM/dd", "MM/dd/yyyy HH:mm:ss",
                                        "MM/dd/yyyy hh:mm tt", "yyyy-MM-dd HH:mm:ss,fff","yyyy-MM-dd'T'HH:mm:ss.SSS","yyyy-MM-dd h:mm tt" };

                            CultureInfo provider = CultureInfo.InvariantCulture;
                            DateTime enteredDate;
                            DateTime.TryParseExact(rowr["Initials"].ToString(), "yyyy-MM-dd h:mm:ss tt", new CultureInfo("en-US"),
                                            DateTimeStyles.None, out enteredDate);
                            //DateTime enteredDate = DateTime.Parse(row.Cells[5].Value.ToString());
                            DateTime nrt;





                            DateTime.TryParseExact(DateTime.Now.ToString("yyyy-MM-dd h:mm:ss tt"), "yyyy-MM-dd h:mm:ss tt", new CultureInfo("en-US"),
                                           DateTimeStyles.None, out nrt);
                            Double mny = (nrt.Subtract(enteredDate).TotalMinutes);
                            if (mny > 1)
                            {
                                rowr["online"] = "Offline";
                            }
                            else
                            {
                                rowr["online"] = "Online";
                            }
                            //if (rowr.Cells[2].Value.ToString().Equals("IT3MM"))
                            //{

                            //}
                            DataSet awdst = new DataSet();
                            awdst = oBALParticipants.selectactveconf(rowr["CardID"].ToString(), null);
                            if (awdst.Tables[0].Rows.Count > 0)
                            {
                                //string chlb = awdst.Tables[0].Rows[0]["status"].ToString();
                                //if(chlb.Equals("2"))
                                //{

                                //}
                                rowr["online"] = "In-Call";
                            }

                        }
                    }



                }
                catch (Exception ex)
                {

                }


                string json = JsonConvert.SerializeObject(dtAllParticipants);
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