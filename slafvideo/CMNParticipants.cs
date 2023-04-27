using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace slafvideo
{
    public class CMNParticipants
    {
        public string SysID { get; set; }
        public string RegistrationNo { get; set; }
        public string RankID { get; set; }
        public string Initials { get; set; }
        public string Surname { get; set; }
        public string OtherNames { get; set; }
        public string CountryID { get; set; }
        public string ParticipantImage { get; set; }
        public int Status { get; set; }
        public string CardID { get; set; }
        public byte[] participantImage { get; set; }
        public byte[] IDImage { get; set; }
    }
}