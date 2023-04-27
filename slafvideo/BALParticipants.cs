using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace slafvideo
{
    public class BALParticipants
    {
        public int insertParticipantData2(CMNParticipants oCMNParticipants, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int insertCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                insertCount = oDALParticipants.insertParticipantData2(oCMNParticipants, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return insertCount;
        }
        public int insertParticipantData(CMNParticipants oCMNParticipants, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int insertCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                insertCount = oDALParticipants.insertParticipantData(oCMNParticipants, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return insertCount;
        }
        public int updateParticipantData(CMNParticipants oCMNParticipants, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updateParticipantData(oCMNParticipants, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }

        public int updateonline(string cid, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updateonline(cid, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }

        
             public int updatest(string cid, string sts, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updatest(cid, sts, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }
        public int updatecloseData(string cid, string sts, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updatecloseData(cid, sts, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }
        public int deleteParticipantData(string cid, string sts, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.deleteParticipantData(cid, sts, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }

        public int updateauth(string cid, string sts, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updateauth(cid, sts, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }
        public int updatepass(string cid, string sts, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updatepass(cid, sts, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }
        public int updatejoin(string cid, string sts, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            int updateCount;

            try
            {
                bool newDBHandle = false;

                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                updateCount = oDALParticipants.updatejoin(cid, sts, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return updateCount;
        }
        public DataTable selectParticipantDataByCardID(CMNParticipants oCMNParticipants, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectParticipantDataByCardID(oCMNParticipants, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }

        
                public DataTable selectAllParti(string id,DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectAllParti(id,oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectAllParticipantData(DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectAllParticipantData(oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectAllParticipantDatan(DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectAllParticipantDatan(oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable getAllParticipantData(DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.getAllParticipantData(oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectcurusers(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectcurusers(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }

        public DataTable gettable(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.gettable(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable getchannel( DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.getchannel( oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }

        
              public DataTable selectAuth(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectAuth(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectAllusers(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectAllusers(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable searchParticipantData(string tst, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.searchParticipantData(tst, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }

        public DataSet SelectUserDetails(string username, string password, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataSet oDataTable = new DataSet();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.SelectUserDetails(username, password, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataSet selectadmin(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataSet oDataTable = new DataSet();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectadmin(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectmeeeting(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectmeeeting(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectmeeeting1(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectmeeeting1(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataSet selectactvcnt(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataSet oDataTable = new DataSet();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectactvcnt(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataSet selectactveconf(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataSet oDataTable = new DataSet();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectactveconf(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }

        public DataSet selectjoin(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataSet oDataTable = new DataSet();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectjoin(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataSet selectcall(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataSet oDataTable = new DataSet();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectcall(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectwait(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectwait(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
        public DataTable selectwait1(string id, DBHandle oDBHandle)
        {
            DALParticipants oDALParticipants = new DALParticipants();
            DataTable oDataTable = new DataTable();
            try
            {
                bool newDBHandle = false;
                if (oDBHandle == null)
                {
                    oDBHandle = new DBHandle();
                    oDBHandle.OpenConnection();
                    oDBHandle.BeginTransaction();
                    newDBHandle = true;
                }
                oDataTable = oDALParticipants.selectwait1(id, oDBHandle);
                if (newDBHandle)
                {
                    oDBHandle.CommitTransaction();
                    oDBHandle.CloseConnection();
                }
            }
            catch (Exception ex)
            {
                oDBHandle.RollbackTransaction();
                oDBHandle.CloseConnection();
                throw ex;
            }
            return oDataTable;
        }
    }
}