<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FinalProject4.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>TUBEFLIX</title>

     <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>
    <link rel="Stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />
    
    <script>
        $(function () {
            $("#txtSearch").autocomplete({
                source: function (request, response) {
                    var param = { name: $('#txtSearch').val() };
                    $.ajax({
                        url: "TubeFlix.aspx/GetName",
                        data: JSON.stringify(param),
                        type: "post",
                        contentType: "application/json; charset=utf-8",
                        datafilter: function (data) { return data; },
                        success: function (data) {
                            response($.map(data.d, function (item) { return { value: item } }))
                        },
                    });
                },
                minLength: 1
            });
        });
    </script>

<style>
* {
  box-sizing: border-box;
}
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color:burlywood;
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
#Avengers,#AvenUtlron,#AvenInfinity,#AvenEndGame,#Thor,#Thor2,#Thor3,#sacredgames,#moneyh,#strangert,#Mirzapur,#Friends,#panchayat,#theorder{
    width:100px;
   height:150px;
}
#Conjuring,#Conjuring2,#Annabelle,#ACreation,#TheNun,#It,#It2{
    width:100px;
    height:150px;
}
#eksandhu,#Sufna,#jatt1,#jatt2,#carryonjatta,#chalmeraput,#chalmeraput2{
    width:100px;
    height:150px;
}
#Idiots,#Dilwale,#Queen,#Dilchahta,#Lagaan,#Dangal,#GullyBoy{
    width:100px;
    height:150px;
}
    .auto-style3 {
        height: auto;
    }
            #flix{
            width:100px;
            height:50px;
        }
            table{
                padding-left:20px;
                width: 60%;
                padding-right: 20px;
            }
    .auto-style4 {
        margin-top: 5px;
    }
    .auto-style5 {
        width: 211px;
    }
    td{
            padding: 10px;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <header id="myHeader">
<asp:Image ID="flix" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Sign Up" Font-Size="XX-Large"></asp:Label>
    <br />
</header>
    <section>
        <p style="text-align:center">Note: All the areas with (*) are important</p>
        <table align="center">
            <tr>
                <td>First Name*:</td>
                <td class="auto-style5"><asp:TextBox ID="FirstN" runat="server" BackColor="#999999" Width="203px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Required" ControlToValidate="FirstN"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Last Name*:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="LastN" runat="server" BackColor="#999999" Width="203px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Required" ControlToValidate="LastN"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>User Name*:</td>
                <td class="auto-style5"><asp:TextBox ID="UserN" runat="server" BackColor="#999999" Width="203px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Required" ControlToValidate="UserN"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Password*:</td>
                <td class="auto-style5"><asp:TextBox ID="Password" runat="server" BackColor="#999999" Width="203px" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Required" ControlToValidate="Password"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Email*</td>
                <td class="auto-style5">
                    <asp:TextBox ID="Email" runat="server" BackColor="#999999" Width="203px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="red" ErrorMessage="Required" ControlToValidate="Email"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Phone Number*</td>
                <td class="auto-style5">
                    <asp:TextBox ID="PhoneN" runat="server" BackColor="#999999" Width="203px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="red" ErrorMessage="Required" ControlToValidate="PhoneN"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btntubeflix" runat="server" Text="SignUp"  BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" Width="110px" CssClass="auto-style4" OnClick="btntubeflix_Click" /></td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LogIn.aspx">Have an account? Click Here!</asp:HyperLink></td>
            </tr>
        </table>
        <br />
    </section>
        <footer>
            <p class="auto-style3">
                <asp:ImageButton ID="ImageFacebook" runat="server" OnClick="ImageButton1_Click1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageInstagram" runat="server" OnClick="ImageInstagram_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageTwitter" runat="server" OnClick="ImageTwitter_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
</footer>

    </form>
    <script>
        window.onscroll = function () { myFunction() };

        var header = document.getElementById("myHeader");
        var sticky = header.offsetTop;

        function myFunction() {
            if (window.pageYOffset > sticky) {
                header.classList.add("sticky");
            } else {
                header.classList.remove("sticky");
            }
        }
</script>
</body>
</html>
