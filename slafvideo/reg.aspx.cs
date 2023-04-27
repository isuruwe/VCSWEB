using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace slafvideo
{
    public partial class reg : System.Web.UI.Page
    {
        BALParticipants oBALParticipants = new BALParticipants();
        string TargetLocation = "";
        string chanl = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            TargetLocation = Server.MapPath("~/users/");
            if (IsPostBack)
            {


                string dn = Request.Form["dname"];
                string un = Request.Form["uname"];
                string pw = Request.Form["pass"];
                string grp = Request.Form["grp"];
                DataTable ods1 = new DataTable();
                ods1 = oBALParticipants.selectAllParti(un.ToString().Trim(), null);

                if (ods1.Rows.Count > 0)
                {
                    //string st = ods1.Rows[0]["status"].ToString();
                    chanl = ods1.Rows[0]["CardID"].ToString();



                }
                if (String.IsNullOrEmpty(chanl))
                {
                    if (!String.IsNullOrEmpty(dn)&& !String.IsNullOrEmpty(un)&&!String.IsNullOrEmpty(pw))
                    {
                        if (Request.Files["flv"] != null)
                    {
                        HttpPostedFile MyFile = Request.Files["flv"];
                        //Setting location to upload files

                        try
                        {
                            if (MyFile.ContentLength > 0)
                            {
                                //Determining file name. You can format it as you wish.
                                string FileName = MyFile.FileName;
                                //Determining file size.
                                int FileSize = MyFile.ContentLength;
                                //Creating a byte array corresponding to file size.
                                byte[] FileByteArray = new byte[FileSize];
                                //Posted file is being pushed into byte array.
                                MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                                //Uploading properly formatted file to server.
                                MyFile.SaveAs(TargetLocation + un + ".jpg");
                            }
                        }
                        catch (Exception BlueScreen)
                        {
                            //Handle errors
                        }
                    }


                    byte[] input = UTF8Encoding.UTF8.GetBytes(pw.ToString().Trim().ToLower());
                    TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
                    tdes.Key = UTF8Encoding.UTF8.GetBytes("XijszJdfJFFIHIdlfkWKIoTo");
                    tdes.Mode = CipherMode.ECB;
                    tdes.Padding = PaddingMode.PKCS7;
                    ICryptoTransform ct = tdes.CreateEncryptor();
                    byte[] result = ct.TransformFinalBlock(input, 0, input.Length);
                    tdes.Clear();
                    string decrypted = Convert.ToBase64String(result);

                    CMNParticipants oCMNParticipants = new CMNParticipants();

                    oCMNParticipants.SysID = "001";
                    oCMNParticipants.RegistrationNo = un.Trim();
                    oCMNParticipants.RankID = grp;
                    oCMNParticipants.OtherNames = TargetLocation + un + ".jpg";
                    oCMNParticipants.Initials = decrypted;
                    oCMNParticipants.Surname = dn.Trim();
                    oBALParticipants.insertParticipantData2(oCMNParticipants, null);
                    Session["suc"] = "Registered!";
                }
                    else
                    {
                        Session["suc"] = "Enter all Fields!";
                    }
                }
                else
                {
                    Session["suc"] = "Already Registered!";
                }
            }
           
        }

    }
}