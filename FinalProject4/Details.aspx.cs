using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject4
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            flix.ImageUrl = "Images/tubeflix.PNG";
            ImageLogout.ImageUrl = "Images/logout.png";
            ImageFacebook.ImageUrl = "Images/facebook.png";
            ImageInstagram.ImageUrl = "Images/Instagram.png";
            ImageTwitter.ImageUrl = "Images/twitter.png";
            ImageSearch.ImageUrl = "Images/searchsss.png";
            wish.ImageUrl = "Images/addtowishlist.Png";
            PlayNow.ImageUrl = "Images/pn.png";

           // int id = Convert.ToInt32(Request.QueryString["no"]);
            //Geturl(id);
            
            if (Session["movieId"] != null)
            {
                Big.ImageUrl = Session["movieurl"].ToString();
                GetMovie(Convert.ToInt32(Session["movieId"]));
            }
            
        }

        public void SendToWishList(int id,string username)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();

            string check = "select count(*) from userWishlist where Username = @Username and MovieId = @MovieId";
            SqlCommand movieUserExist = new SqlCommand(check, Conn);
            movieUserExist.Parameters.AddWithValue("@Username", username);
            movieUserExist.Parameters.AddWithValue("@MovieId", id);
            int temp = Convert.ToInt32(movieUserExist.ExecuteScalar().ToString());

            if (temp == 0)
            {
                string cmdstring = "Insert into userWishlist (Username, MovieId) VALUES (@Username, @MovieId)";

                SqlCommand insertWishlist = new SqlCommand(cmdstring, Conn);

                insertWishlist.Parameters.AddWithValue("@Username", username);
                insertWishlist.Parameters.AddWithValue("@MovieId", id);

                insertWishlist.ExecuteNonQuery();

                Response.Write("<script>alert('Added to WishList')</script>");

                Conn.Close();
            }
            else
            {
                Response.Write("<script>alert('Movie already in wishlist!!')</script>");
            }
        }

        public void SendToCurrentlyWatching(int id,string username)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();

            string check = "select count(*) from userPlaying where Username = @Username and MovieId = @MovieId";
            SqlCommand movieUserExist = new SqlCommand(check, Conn);
            movieUserExist.Parameters.AddWithValue("@Username", username);
            movieUserExist.Parameters.AddWithValue("@MovieId", id);
            int temp = Convert.ToInt32(movieUserExist.ExecuteScalar().ToString());


            if (temp == 0)
            {
                string cmdstring = "Insert into userPlaying VALUES (@Username, @MovieId)";

                SqlCommand insertUser = new SqlCommand(cmdstring, Conn);

                insertUser.Parameters.AddWithValue("@Username", username);
                insertUser.Parameters.AddWithValue("@MovieId", id);

                insertUser.ExecuteNonQuery();

                Response.Write("<script>alert('Enjoy your movie!')</script>");

                Conn.Close();
            }
            else
            {
                Response.Write("<script>alert('Enjoy your movie!')</script>");
            }
        }

        protected void wish_Click(object sender, ImageClickEventArgs e)
        {
            SendToWishList(Convert.ToInt32(Session["movieId"].ToString()), Session["username"].ToString());
        }

        protected void PlayNow_Click(object sender, ImageClickEventArgs e)
        {
            SendToCurrentlyWatching(Convert.ToInt32(Session["movieId"].ToString()), Session["username"].ToString());
            Response.Redirect("Video.aspx");
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            /*string movieName = txtSearch.Text;

            switch (movieName)
            {
                //MARVEL********************************************
                case "Avengers":
                    Session["movieId"] = 9;//1

                    break;
                case "Avengers:Age of Ultron":
                    Session["movieId"] = 10;//2

                    break;
                case "Avengers:Infinity War":
                    Session["movieId"] = 11;//3

                    break;
                case "Avengers:End Game":
                    Session["movieId"] = 12;//4

                    break;
                case "Thor":
                    Session["movieId"] = 13;//5

                    break;
                case "Thor-2":
                    Session["movieId"] = 14;//6

                    break;
                case "Thor Ragnarok":
                    Session["movieId"] = 15;//7

                    break;


                //Series*****************************************************
                case "Sacred Games":
                    Session["movieId"] = 16;//8

                    break;
                case "Money Heist":
                    Session["movieId"] = 17;//

                    break;
                case "Stranger Things":
                    Session["movieId"] = 18;//10

                    break;
                case "Mirzapur":
                    Session["movieId"] = 19;//11

                    break;
                case "Friends":
                    Session["movieId"] = 20;//12

                    break;
                case "Panchayat":
                    Session["movieId"] = 21;//13

                    break;
                case "The Order":
                    Session["movieId"] = 22;//14

                    break;

                //horror***************************************************8
                case "Conjuring":
                    Session["movieId"] = 23;//15

                    break;
                case "Conjuring 2":
                    Session["movieId"] = 24;//16

                    break;
                case "Annabelle":
                    Session["movieId"] = 25;//17

                    break;
                case "Annabelle Creation":
                    Session["movieId"] = 26;//18

                    break;
                case "The Nun":
                    Session["movieId"] = 27;//19

                    break;
                case "It":
                    Session["movieId"] = 28;//20

                    break;
                case "It2":
                    Session["movieId"] = 29;//21

                    break;

                //punjabi************************************************
                case "Ek Sandhu Hunda Si":
                    Session["movieId"] = 30;//22

                    break;
                case "Sufna":
                    Session["movieId"] = 31;//23

                    break;
                case "Jatt and Juliet":
                    Session["movieId"] = 32;//24

                    break;
                case "Jatt and Juliet 2":
                    Session["movieId"] = 33;//25

                    break;
                case "Carry on Jatta ":
                    Session["movieId"] = 34;//26

                    break;
                case "Chal Mera Put":
                    Session["movieId"] = 35;//27

                    break;
                case "Chal Mera Put 2":
                    Session["movieId"] = 36;//28

                    break;

                //hindi************************************
                case "3 Idiots":
                    Session["movieId"] = 37;//29

                    break;
                case "Dilwale Dulhania Le Jayenge":
                    Session["movieId"] = 38;//30
                    break;
                case "Queen":
                    Session["movieId"] = 39;//31

                    break;
                case "Dil Chahta Hai":
                    Session["movieId"] = 40;//32

                    break;
                case "Lagaan":
                    Session["movieId"] = 41;//33

                    break;
                case "Dangal":
                    Session["movieId"] = 42;//34

                    break;
                case "Gully Boy":
                    Session["movieId"] = 43;//35

                    break;
                default:
                    Session["movieId"] = 0;
                    break;
            }*/
            string movieName = txtSearch.Text;
            int id = GetMovieId(movieName);
            Session["movieId"] = id.ToString();

            string url = GetImgUrl(Convert.ToInt32(Session["movieId"]));
            Session["movieurl"] = url;
            Server.Transfer("Details.aspx");  

        }

        protected void ImageSearch_Click(object sender, ImageClickEventArgs e)
        {
            txtSearch.Visible = true;
            btnSearch.Visible = true;
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

        protected void Tubeflix_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TubeFlix.aspx");
        }
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
                MName.Text = sdr.GetString(1);
                MDirector.Text = sdr.GetString(4);
                Year.Text = sdr.GetInt32(3).ToString();
                moviedetail.Text = sdr.GetString(2);
            }

            Conn.Close();

            return details;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }
        protected void Wishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
        }

        protected void Wishlist_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
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
        protected void current_Click(object sender, EventArgs e)
        {
            Response.Redirect("Current.aspx");
        }
    }
}