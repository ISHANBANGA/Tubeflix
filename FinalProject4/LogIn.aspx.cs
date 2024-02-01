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
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImageFacebook.ImageUrl = "Images/facebook.png";
            ImageInstagram.ImageUrl = "Images/Instagram.png";
            ImageTwitter.ImageUrl = "Images/twitter.png";
            flix.ImageUrl = "Images/tubeflix.PNG";
    }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

                Conn.Open();
                string cmdstring = "select count(*) from Users where Username ='" + txtUserN.Text + "';";

                SqlCommand userexist = new SqlCommand(cmdstring, Conn);
                int temp = Convert.ToInt32(userexist.ExecuteScalar().ToString());


                if (temp == 1)
                {
                    string cmd2 = "select Password from Users where Username='" + txtUserN.Text + "';";
                    SqlCommand pass = new SqlCommand(cmd2, Conn);
                    string password = pass.ExecuteScalar().ToString();
                    Conn.Close();

                    if (password == txtPass.Text)
                    {
                        Session["username"] = txtUserN.Text;
                        Response.Redirect("TubeFlix.aspx");

                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.Text = "Try Again! Something is wrong.";
                    }
                }
            }

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
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

