using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using AS.Common.Abstractions;

namespace AS.Common.Connection
{
    public class ConnectionManager
    {
        public IDbConnection Connection
        {
            get
            {
                if (HttpContext.Current == null)
                {
                    return CreateConnection();
                }

                var connection = HttpContext.Current.Items["Db:Connection"] as IDbConnection;
                if (connection == null || string.IsNullOrEmpty(connection.ConnectionString))
                {
                    connection = CreateConnection();
                    HttpContext.Current.Items["Db:Connection"] = connection;
                }
                return connection;
            }
            set { HttpContext.Current.Items["Db:Connection"] = value; }
        }

        private IDbConnection CreateConnection()
        {
            var connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Strings.Configuration.DB.ConnectionStringName].ConnectionString);
            connection.Open();
            return connection;
        }

        private void CloseConnection()
        {
            Connection.Close();
        }
        
    }
}