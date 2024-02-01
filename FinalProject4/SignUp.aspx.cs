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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            flix.ImageUrl = "Images/tubeflix.PNG";
            ImageFacebook.ImageUrl = "Images/facebook.png";
            ImageInstagram.ImageUrl = "Images/Instagram.png";
            ImageTwitter.ImageUrl = "Images/twitter.png";
            
        }

        protected void Tubeflix_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TubeFlix.aspx");
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.facebook.com");
        }

        protected void ImageInstagram_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.Instagram.com");
        }

        protected void ImageTwitter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.twitter.com");
        }

        protected void btntubeflix_Click(object sender, EventArgs e)
        {
           try
            {
                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDatabaseConnectionString"].ConnectionString);

                Conn.Open();

                string insertString = "Insert into Users(Username,Password,FirstName,LastName,Email,Phone)" +
                    "VALUES(@Username,@Password,@FirstName,@LastName,@Email,@Phone)";

                SqlCommand insertUser = new SqlCommand(insertString, Conn);
                insertUser.Parameters.AddWithValue("@Username", UserN.Text);
                insertUser.Parameters.AddWithValue("@Password",Password.Text);
                insertUser.Parameters.AddWithValue("@FirstName", FirstN.Text);
                insertUser.Parameters.AddWithValue("@LastName", LastN.Text);
                insertUser.Parameters.AddWithValue("@Email", Email.Text);
                insertUser.Parameters.AddWithValue("@Phone", PhoneN.Text);

                insertUser.ExecuteNonQuery();

                Conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('Registration Successful');window.location ='LogIn.aspx';", true);

            }
            catch (Exception Ex)
            {
                Response.Write("Error");
                Response.Write(Ex.ToString());
            }
        }
    }
}