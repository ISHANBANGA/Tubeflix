using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject4
{
    public partial class Video : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            flix.ImageUrl = "Images/tubeflix.PNG";
            ImageLogout.ImageUrl = "Images/logout.png";
            ImageFacebook.ImageUrl = "Images/facebook.png";
            ImageInstagram.ImageUrl = "Images/Instagram.png";
            ImageTwitter.ImageUrl = "Images/twitter.png";
            ImageSearch.ImageUrl = "Images/searchsss.png";
        }

        protected void Tubeflix_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TubeFlix.aspx");
        }

        protected void ImageSearch_Click(object sender, ImageClickEventArgs e)
        {
            txtSearch.Visible = true;
            btnSearch.Visible = true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string movieName = txtSearch.Text;
            int id = GetMovieId(movieName);
            Session["movieId"] = id.ToString();

            string url = GetImgUrl(Convert.ToInt32(Session["movieId"]));
            Session["movieurl"] = url;
            Server.Transfer("Details.aspx");
        }
        public int GetMovieId(string name)
        {
            int id = 0;

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();
            string cmdstring = "Select * from Movie where MovieName = @MovieName";


            SqlCommand movie = new SqlCommand(cmdstring, Conn);

            movie.Parameters.AddWithValue("@MovieName", name);

            SqlDataReader sdr = movie.ExecuteReader();
            while (sdr.Read())
            {
                id = sdr.GetInt32(0);
            }

            Conn.Close();

            return id;
        }
        public string GetImgUrl(int id)
        {
            string url = "";

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();
            string cmdstring = "Select * from Movie where MovieId = @MovieId";


            SqlCommand movie = new SqlCommand(cmdstring, Conn);

            movie.Parameters.AddWithValue("@MovieId", id);

            SqlDataReader sdr = movie.ExecuteReader();
            while (sdr.Read())
            {
                url = sdr.GetString(5);
            }

            Conn.Close();

            return url;
        }
        protected void ImageLogout_Click(object sender, ImageClickEventArgs e)
        {
            //Session["username"] = "";
            //Session["movieurl"] = "";
            //Session["movieId"] = "";
            Session.Clear();
            Session.Abandon();
            Response.Redirect("SignUp.aspx");
        }

        protected void Wishlist_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
        }

        protected void current_Click(object sender, EventArgs e)
        {
            Response.Redirect("Current.aspx");
        }

        protected void ImageFacebook_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.facebook.com");
        }

        protected void ImageInstagram_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.instagram.com");
        }

        protected void ImageTwitter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.twitter.com");
        }

    }
}