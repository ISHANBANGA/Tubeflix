using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;

namespace FinalProject4
{
    public class Main : MainInterface
    {
       public string[] GetMovie(int id)
        {


            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();
            string cmdstring = "Select * from Movie where MovieId = @MovieId";


            SqlCommand movie = new SqlCommand(cmdstring, Conn);

            movie.Parameters.AddWithValue("@MovieId", id);

            SqlDataReader sdr = movie.ExecuteReader();

            string[] details = new string[4];

            while (sdr.Read())
            {
                details[0] = sdr.GetString(1);
                details[1] = sdr.GetString(4);
                details[2] = sdr.GetInt32(3).ToString();
                details[3] = sdr.GetString(2);
            }

            Conn.Close();

            return details;
        }
        
        [WebMethod]
        public  List<string> GetName(string name)
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