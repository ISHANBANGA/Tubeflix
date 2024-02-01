using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace FinalProject4
{
    public partial class TubeFlix : System.Web.UI.Page
    { 

        protected void Page_Load(object sender, EventArgs e)
        {
            //images through out the page
            flix.ImageUrl = "Images/tubeflix.PNG";
            ImageLogout.ImageUrl = "Images/logout.png";
            ImageFacebook.ImageUrl = "Images/facebook.png";
            ImageInstagram.ImageUrl = "Images/Instagram.png";
            ImageTwitter.ImageUrl = "Images/twitter.png";
            ImageSearch.ImageUrl = "Images/searchsss.png";

            //marvel series
            Avengers.ImageUrl = "Images/Avenger.jpg";
            AvenUtlron.ImageUrl = "Images/AvengersUltron.jpg";
            AvenInfinity.ImageUrl = "Images/AvengersIInfinity.jpg";
            AvenEndGame.ImageUrl = "Images/AvengersEndGAme.jpg";
            Thor.ImageUrl = "Images/Thor.jpg";
            Thor2.ImageUrl = "Images/Thor2.jpg";
            Thor3.ImageUrl = "Images/ThorRagnarok.jpg";

            //tv series
            sacredgames.ImageUrl = "Images/SacredGames.jpg";
            moneyh.ImageUrl = "Images/moneyheist.jpg";
            strangert.ImageUrl = "Images/strangerthings.jpg";
            Mirzapur.ImageUrl = "Images/mirzapur.jpg";
            Friends.ImageUrl = "Images/friends.jpg";
            panchayat.ImageUrl = "Images/panchayat.jpg";
            theorder.ImageUrl = "Images/theorder.jpg";

            //horror movie
            Conjuring.ImageUrl = "Images/Conjuring.jpg";
            Conjuring2.ImageUrl = "Images/Conjuring2.jpg";
            Annabelle.ImageUrl = "Images/Annabelle.jpg";
            ACreation.ImageUrl = "Images/ACreation.jpg";
            TheNun.ImageUrl = "Images/TheNun.jpg";
            It.ImageUrl = "Images/It.jpg";
            It2.ImageUrl = "Images/It2.jpg";

            //punjabi movies
            eksandhu.ImageUrl = "Images/eksandhu.jpg";
            Sufna.ImageUrl = "Images/Sufna.jpg";
            jatt1.ImageUrl = "Images/jattandjuliet.jpg";
            jatt2.ImageUrl = "Images/jattandjuliet2.jpg";
            carryonjatta.ImageUrl = "Images/carryonjatta.jpg";
            chalmeraput.ImageUrl = "Images/chalmeraput.jpg";
            chalmeraput2.ImageUrl = "Images/chalmeraput2.jpg";

            //Bollywood Movies
            Idiots.ImageUrl = "Images/3Idiots.jpg";
            Dilwale.ImageUrl = "Images/Dilwale.jpg";
            Queen.ImageUrl = "Images/Queen.jpg";
            Dilchahta.ImageUrl = "Images/Dilchahta.jpg";
            Lagaan.ImageUrl = "Images/Lagaan.jpg";
            Dangal.ImageUrl = "Images/Dangal.jpg";
            GullyBoy.ImageUrl = "Images/Gullyboy.jpg";





            btnSearch.Visible = false;
            txtSearch.Visible = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        { 
            
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
        
        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.facebook.com");
        }

        protected void ImageSearch_Click(object sender, ImageClickEventArgs e)
        {
            txtSearch.Visible = true;
            btnSearch.Visible = true;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
           
        }


        protected void ImageInstagram_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.instagram.com");
        }

        [WebMethod]
        public static List<string> GetName(string name)
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

        protected void ImageTwitter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.twitter.com");
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

        protected void Avengers_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 1;//1
            Session["movieurl"] = "Images/Avenger.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void AvenUtlron_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 2;//2
            Session["movieurl"] = "Images/AvengersUltron.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void AvenInfinity_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 3;//3
            Session["movieurl"] = "Images/AvengersIInfinity.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void AvenEndGame_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 4;//4
            Session["movieurl"] = "Images/AvengersEndGAme.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Thor_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 5;//5
            Session["movieurl"] = "Images/Thor.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Thor2_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 6;//6
            Session["movieurl"] = "Images/Thor2.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Thor3_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 7;//7
            Session["movieurl"] = "Images/ThorRagnarok.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void sacredgames_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 8;//8
            Session["movieurl"] = "Images/SacredGames.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void moneyh_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 9;//
            Session["movieurl"] = "Images/moneyheist.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void strangert_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 10;//10
            Session["movieurl"] = "Images/strangerthings.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Mirzapur_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 11;//11
            Session["movieurl"] = "Images/mirzapur.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Friends_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 12;//12
            Session["movieurl"] = "Images/friends.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void panchayat_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 13;//13
            Session["movieurl"] = "Images/panchayat.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void theorder_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 14;//14
            Session["movieurl"] = "Images/theorder.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Conjuring_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 15;//15
            Session["movieurl"] = "Images/Conjuring.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Conjuring2_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 16;//15
            Session["movieurl"] = "Images/Conjuring.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Annabelle_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 17;//17
            Session["movieurl"] = "Images/Annabelle.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void ACreation_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 18;//18
            Session["movieurl"] = "Images/ACreation.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void TheNun_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 19;//19
            Session["movieurl"] = "Images/TheNun.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void It_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 20;//20
            Session["movieurl"] = "Images/It.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void It2_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 21;//21
            Session["movieurl"] = "Images/It2.jpg";
            Server.Transfer("Details.aspx");
        }
        protected void eksandhu_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 22;//22
            Session["movieurl"] = "Images/eksandhu.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Sufna_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 23;//23
            Session["movieurl"] = "Images/Sufna.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void jatt1_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 24;//24
            Session["movieurl"] = "Images/jattandjuliet.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void jatt2_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 25;//25
            Session["movieurl"] = "Images/jattandjuliet2.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void carryonjatta_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 26;//26
            Session["movieurl"] = "Images/carryonjatta.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void chalmeraput_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 27;//27
            Session["movieurl"] = "Images/chalmeraput.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void chalmeraput2_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 28;//28
            Session["movieurl"] = "Images/chalmeraput2.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Wishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
        }
        protected void Idiots_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 29;//29
            Session["movieurl"] = "Images/3Idiots.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Dilwale_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 30;//30
            Session["movieurl"] = "Images/Dilwale.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Queen_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 31;//31
            Session["movieurl"] = "Images/Queen.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Dilchahta_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 32;//32
            Session["movieurl"] = "Images/Dilchahta.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Lagaan_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 33;//33
            Session["movieurl"] = "Images/Lagaan.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Dangal_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 34;//34
            Session["movieurl"] = "Images/Dangal.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void GullyBoy_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = 35;//35
            Session["movieurl"] = "Images/Gullyboy.jpg";
            Server.Transfer("Details.aspx");
        }

        protected void Tubeflix_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TubeFlix.aspx");
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