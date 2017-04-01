using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace Data.Connection
{
    public class DataAccess
    {
        #region ConnectionString ...

        private string ConnectionString
        { 
            get
            {
                try
                {
                    return System.Configuration.ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;
                }
                catch (Exception ex)
                {
                    throw new ApplicationException("Unable to get Database Connection string from Web Config File. Contact the site Administrator" + ex);
                }
            }
        }

        #endregion   

        #region Executes Insert Stored Procedure...
        /// <returns>Returns 0 if successful. Otherwise returns 1.</returns>
        public int Execute(string SPName, params SqlParameter[] Parameters)
        {
            int intErr = 0;
            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(SPName, cn);

            cmd.CommandText = SPName;
            cmd.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
                foreach (SqlParameter item in Parameters)
                    cmd.Parameters.Add(item);

            cn.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                intErr = 1;
                if (cn != null) cn.Close();
            }
            cn.Close();

            cmd = null;
            cn = null;

            return intErr;
        }
        #endregion

        #region Returns LastRowstring result...

        public string GetString(string SPName, params SqlParameter[] Parameters)
        {
            string output = "";
            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(SPName, cn);
            SqlDataReader dreader;

            cmd.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
                foreach (SqlParameter item in Parameters)
                    cmd.Parameters.Add(item);

            cn.Open();
            try
            {
                dreader = cmd.ExecuteReader();

                if (dreader.Read())
                    if (dreader.GetValue(0) != DBNull.Value)
                        output = dreader.GetString(0);

                dreader.Close();
            }
            catch
            {
                if (cn != null) cn.Close();
                throw;
            }

            cn.Close();
            cmd = null;
            cn = null;

            return output;
        }

        #endregion

        #region Returns LastRowInt32 Result...
     
        public int GetInt32(string SPName, params SqlParameter[] Parameters)
        {
            int output = 0;
            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(SPName, cn);

            cmd.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
                foreach (SqlParameter item in Parameters)
                    cmd.Parameters.Add(item);

            cn.Open();

            try
            {
                SqlDataReader dreader = cmd.ExecuteReader();
                if (dreader.Read())
                    if (dreader.GetValue(0) != DBNull.Value)
                        output = Convert.ToInt32(dreader.GetValue(0));

                dreader.Close();
            }
            catch
            {
                if (cn != null) cn.Close();
                throw;
            }

            cn.Close();
            cmd = null;
            cn = null;

            return output;
        } 
        #endregion

        #region Returns Int32 scalar value...
     
        public int GetIntScalarVal(string SPName)
        {
            int output = 0;
            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(SPName, cn);

            cmd.CommandType = CommandType.StoredProcedure;

            cn.Open();

            try
            {
                output = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch
            {
                if (cn != null) cn.Close();
                throw;
            }

            cn.Close();
            cmd = null;
            cn = null;

            return output;
        } 
        #endregion

        #region Returns result set in DataTable ...
    
        public DataTable GetFromDataTable(string SPName, params SqlParameter[] Parameters)
        {
            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(SPName, cn);
            DataTable dt = new DataTable();
            IDataReader dr;

            cmd.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
                foreach (SqlParameter item in Parameters)
                    cmd.Parameters.Add(item);

            cn.Open();

            try
            {
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr != null)
                {
                    dt.Load(dr);
                }
            }
            catch
            {
                // If we fail to return the SqlDatReader, we need to close the connection
                if (cn != null) cn.Close();
                throw;
            }

            cmd = null;
            cn = null;

            return dt;
        }

        #endregion    

        #region Returns an IDataReader result...

        public IDataReader GetFromReader(string SPName, params SqlParameter[] Parameters)
        {
            IDataReader dr = null;
            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(SPName, cn);

            cmd.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
                foreach (SqlParameter item in Parameters)
                    cmd.Parameters.Add(item);

            cn.Open();

            try
            {
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch
            {
                if (cn != null) cn.Close();
                throw;
            }

            cmd = null;
            cn = null;

            return dr;
        }


        #endregion

    }
}
