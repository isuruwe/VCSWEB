using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace slafvideo
{
    public partial class home : System.Web.UI.Page
    {
        BALParticipants oBALParticipants = new BALParticipants();
        DataTable dtAllParticipants = new DataTable();
        public string jsonString;

        public string UserValue { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           // jsonString = JsonConvert.SerializeObject(loadAllParticipants());
        }
        public DataTable loadAllParticipants()
        {
            try
            {
                
                dtAllParticipants = oBALParticipants.selectAllParticipantData(null);

                
              

            }
            catch (Exception ex)
            {
               
            }
            return dtAllParticipants;
        }

        
    }
}