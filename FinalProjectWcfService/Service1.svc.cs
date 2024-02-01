using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace FinalProjectWcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public List<string> GetName(string name)
        {
            List<string> movies = new List<string>();
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();
            string cmdstring = "Select MovieName from Movie where MovieName LIKE '%" + name + "%'";
            SqlCommand movie = new SqlCommand(cmdstring, Conn);
            SqlDataReader sdr = movie.ExecuteReader();

            while (sdr.Read())
            {
                movies.Add(sdr.GetString(0));
            }
            Conn.Close();
            return movies;
        }
    }
}
