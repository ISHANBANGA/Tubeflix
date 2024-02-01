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
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImageButton[] arr = new ImageButton[] { ImageButton1, ImageButton2, ImageButton3, ImageButton4, ImageButton5, ImageButton6, ImageButton7, ImageButton8, ImageButton9, ImageButton10, ImageButton11, ImageButton12, ImageButton13, ImageButton14, ImageButton15, ImageButton16, ImageButton17, ImageButton18, ImageButton19, ImageButton20, ImageButton21, ImageButton22, ImageButton23, ImageButton24, ImageButton25, ImageButton26, ImageButton27, ImageButton28, ImageButton29, ImageButton30, ImageButton31, ImageButton32, ImageButton33, ImageButton34, ImageButton35 };

            foreach (ImageButton img in arr)
            {
                img.Visible = false;
            }
            
            //images through out the page
            ImageLogout.ImageUrl = "Images/logout.png";
            ImageFacebook.ImageUrl = "Images/facebook.png";
            ImageInstagram.ImageUrl = "Images/Instagram.png";
            ImageTwitter.ImageUrl = "Images/twitter.png";
            ImageSearch.ImageUrl = "Images/searchsss.png";
            flix.ImageUrl = "Images/tubeflix.PNG";

            btnSearch.Visible = false;
            txtSearch.Visible = false;


            LinkedList<int> wishlist = new LinkedList<int>();
            wishlist = getWishlist(Session["username"].ToString());
            int count = wishlist.Count;

           // Response.Write(count);
            int i = count;
            foreach (int id in wishlist)
            {
                for (;i>0;)
                {
                    arr[i].Visible = true;
                    arr[i].ImageUrl = GetImgUrl(id);
                    arr[i].AlternateText = id.ToString();
                    break;
                }
                i--;
            }


            /*
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           int no = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            //Response.Redirect("Details.aspx?no=" + no);
            Label2.Text = no.ToString();
            Session["movieId"] = no;
            Server.Transfer("Details.aspx");
        }
*/
            /*ImageButton1.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton2.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton3.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton4.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton5.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton6.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton7.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton8.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton9.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));
            ImageButton10.ImageUrl = Session["movieurl"].ToString();
            GetMovie(Convert.ToInt32(Session["movieId"]));*/

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

            Conn.Close();

            return details;
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

        protected void ImageTwitter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.twitter.com");
        }


        /*
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           int no = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            //Response.Redirect("Details.aspx?no=" + no);
            Label2.Text = no.ToString();
            Session["movieId"] = no;
            Server.Transfer("Details.aspx");
        }
*/

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string movieName = txtSearch.Text;
            int id = GetMovieId(movieName);
            Session["movieId"] = id.ToString();

            string url = GetImgUrl(Convert.ToInt32(Session["movieId"]));
            Session["movieurl"] = url;
            Server.Transfer("Details.aspx");
        }

        protected void flix_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TubeFlix.aspx");
        }

        protected void ImageSearch_Click1(object sender, ImageClickEventArgs e)
        {
            txtSearch.Visible = true;
            btnSearch.Visible = true;
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


        public LinkedList<int> getWishlist(string username)
        {
            LinkedList<int> list = new LinkedList<int>();

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

            Conn.Open();
            string cmdstring = "Select * from userWishlist where Username = @username";

            SqlCommand movie = new SqlCommand(cmdstring, Conn);

            movie.Parameters.AddWithValue("@username", username);

            SqlDataReader sdr = movie.ExecuteReader();

            
            while (sdr.Read())
            {
                list.AddLast(sdr.GetInt32(2));
            }

            Conn.Close();

            return list;
        }

       

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton1.AlternateText;
            Session["movieurl"] = ImageButton1.ImageUrl;
            Server.Transfer("Details.aspx");
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton2.AlternateText;
            Session["movieurl"] = ImageButton2.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton3.AlternateText;
            Session["movieurl"] = ImageButton3.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton4.AlternateText;
            Session["movieurl"] = ImageButton4.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton5.AlternateText;
            Session["movieurl"] = ImageButton5.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton6.AlternateText;
            Session["movieurl"] = ImageButton6.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton7.AlternateText;
            Session["movieurl"] = ImageButton7.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton8.AlternateText;
            Session["movieurl"] = ImageButton8.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton9.AlternateText;
            Session["movieurl"] = ImageButton9.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton10.AlternateText;
            Session["movieurl"] = ImageButton10.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton11.AlternateText;
            Session["movieurl"] = ImageButton11.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton12.AlternateText;
            Session["movieurl"] = ImageButton12.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton13_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton13.AlternateText;
            Session["movieurl"] = ImageButton13.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton14_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton14.AlternateText;
            Session["movieurl"] = ImageButton14.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton15_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton15.AlternateText;
            Session["movieurl"] = ImageButton15.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton16_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton16.AlternateText;
            Session["movieurl"] = ImageButton16.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton17_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton17.AlternateText;
            Session["movieurl"] = ImageButton17.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton18_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton18.AlternateText;
            Session["movieurl"] = ImageButton18.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton19_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton19.AlternateText;
            Session["movieurl"] = ImageButton19.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton20_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton20.AlternateText;
            Session["movieurl"] = ImageButton20.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton21_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton21.AlternateText;
            Session["movieurl"] = ImageButton21.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton22_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton22.AlternateText;
            Session["movieurl"] = ImageButton22.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton23_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton23.AlternateText;
            Session["movieurl"] = ImageButton23.ImageUrl;
            Server.Transfer("Details.aspx");

        }

        protected void ImageButton24_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton24.AlternateText;
            Session["movieurl"] = ImageButton24.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton25_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton25.AlternateText;
            Session["movieurl"] = ImageButton25.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton26_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton26.AlternateText;
            Session["movieurl"] = ImageButton26.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton27_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton27.AlternateText;
            Session["movieurl"] = ImageButton27.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton28_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton28.AlternateText;
            Session["movieurl"] = ImageButton28.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton29_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton29.AlternateText;
            Session["movieurl"] = ImageButton29.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton30_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton30.AlternateText;
            Session["movieurl"] = ImageButton30.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton31_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton31.AlternateText;
            Session["movieurl"] = ImageButton31.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton32_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton32.AlternateText;
            Session["movieurl"] = ImageButton32.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton33_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton33.AlternateText;
            Session["movieurl"] = ImageButton33.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton34_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton34.AlternateText;
            Session["movieurl"] = ImageButton34.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void ImageButton35_Click(object sender, ImageClickEventArgs e)
        {
            Session["movieId"] = ImageButton35.AlternateText;
            Session["movieurl"] = ImageButton35.ImageUrl;
            Server.Transfer("Details.aspx");
        }

        protected void Wishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
        }

        protected void current_Click(object sender, EventArgs e)
        {
            Response.Redirect("Current.aspx");
        }
    }
}