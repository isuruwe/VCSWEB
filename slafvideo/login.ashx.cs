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
    /// Summary description for login
    /// </summary>
    public class login : IHttpHandler
    {


        SqlConnection oSqlConnection;
        SqlCommand oSqlCommand;
        SqlDataAdapter oSqlDataAdapter;
        public string sqlQuery;
        BALParticipants oBALParticipants = new BALParticipants();
        private string UserValue;
        private string suvc;

        public void ProcessRequest(HttpContext context)
        {
            string un = context.Request["un"];
            string pw = context.Request["pw"];
            byte[] input = UTF8Encoding.UTF8.GetBytes(pw);
            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            tdes.Key = UTF8Encoding.UTF8.GetBytes("XijszJdfJFFIHIdlfkWKIoTo");
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;
            ICryptoTransform ct = tdes.CreateEncryptor();
            byte[] result = ct.TransformFinalBlock(input, 0, input.Length);
            tdes.Clear();

            string decrypted = Convert.ToBase64String(result);
            DataSet ods = new DataSet();
            ods = oBALParticipants.SelectUserDetails(un.ToString().Trim(), decrypted.Trim(), null);

            if (ods.Tables[0].Rows.Count > 0)
            {
                UserValue = ods.Tables[0].Rows[0]["CardID"].ToString();

            }
            if (UserValue.ToLower() == un.ToString().Trim().ToLower())
            {
                suvc = "suc";
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