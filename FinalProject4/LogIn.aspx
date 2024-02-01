<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="FinalProject4.LogIn" %>

<!DOCTYPE html>

<html xmlns = "http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title></title>
    <style>
* {
  box-sizing: border-box;
}
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color:burlywood;
  text-align:center;
}
        header {
            background-color: black;
            padding: 10px 16px;
            text-align: left;
            color: white;
        }
  article {
            float: left;
            padding: 20px;
            width: 100%;
            background-color: #f1f1f1;
            height: 300px;
        }
    section:after {
        background-color:burlywood;
        content: "";
        display: table;
        clear: both;
    }
    footer {
        background-color: black;
        padding: 10px;
        text-align: center;
        color: white;
    }
      #ImageLogout {
        width: 20px;
        height: 20px;
        text-align: right;
    }
.Image{
 text-align: right;  
}
#ImageFacebook{
    width:20px;
    height:20px;
}
#ImageInstagram{
    width:20px;
    height:20px;
}
#ImageTwitter{
    width:20px;
    height:20px;
}
#ImageSearch{
    width:20px;
    height:20px;
}
        #loginInfo {
            display:flex;
        }
        #uName,#pass {
         width:100%;
         font-size:2em;
        }

        .sticky {
            position: fixed;
            top: 0;
            width: 100%;
        }

        .flex-container {
            display: flex;
            background-color: black;
        }

.flex-container > div {
  background-color: #f1f1f1;
  width: 100px;
 margin: 20px;
  text-align: center;
}
#flix{
        width: 100px;
        height: 50px;
        }
</style>
</head>
<body>
    <form id = "form1" runat="server">
    <header id = "myHeader" >
        <asp:ImageButton ID="flix" runat="server" />
    &nbsp;&nbsp;
    &nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
    <div class="Image">
        <asp:Label ID = "Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text=" Login Page "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;</div>
</header>

   <section class="auto-style4">  
    <p>Note: All the areas with (*) are important</p>
    
        <div class="auto-style1">
            <br />
            <asp:Label ID = "Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <div id = "loginInfo" >
            <table class="auto-style1" align="center" runat="server">
                <tr>
                    <td><asp:label ID = "uName" runat="server">User Name*:</asp:label>&nbsp; </td>
                    <td>&nbsp;<asp:TextBox ID = "txtUserN" runat="server" BackColor="#999999" Width="203px"></asp:TextBox>
                        &nbsp;</td>
                    <td>
                        <asp:RequiredFieldValidator ID = "RequiredFieldValidator1" runat="server" ControlToValidate="txtUserN" ErrorMessage="Provide user name!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:label ID = "pass" runat="server">Password*:</asp:label>&nbsp; </td>
                    <td>&nbsp;<asp:TextBox ID = "txtPass" runat="server" TextMode="Password" BackColor="#999999" Width="201px"></asp:TextBox>
                        &nbsp;</td>
                    <td>
                        <asp:RequiredFieldValidator ID = "RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Provide password!!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID = "btnLogin" runat="server" Text="Login" OnClick="Login_Click" BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" Width="112px" />
                        <br />
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Dont Have any account?Click here!</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
                </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
   
       
     </section>
     <footer>
            <p class="auto-style3">
                <asp:ImageButton ID = "ImageFacebook" runat="server" OnClick="ImageButton1_Click1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID = "ImageInstagram" runat="server" OnClick="ImageInstagram_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID = "ImageTwitter" runat="server" OnClick="ImageTwitter_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
</footer>
    </form>
    <script>
        window.onscroll = function() { myFunction() };

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction()
{
    if (window.pageYOffset > sticky)
    {
        header.classList.add("sticky");
    }
    else
    {
        header.classList.remove("sticky");
    }
}
</script>
</body>
</html>
