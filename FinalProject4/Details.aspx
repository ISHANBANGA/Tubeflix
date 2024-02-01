<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="FinalProject4.Details" %>

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
        header {
            background-color: black;
            padding: 10px 16px;
            text-align: left;
            color: white;
        }
    .sticky {
        position: fixed;
        top: 0;
        width: 100%;
    }
    body {
  font-family: Arial, Helvetica, sans-serif;
  background-color:burlywood;
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
   
    section:after {
      /*  background-color:burlywood; */
        content: "";
        display: table;
        clear: both;
        margin-bottom: 10px;
        margin-top:10px;
        border:solid;
    }
    footer {
        background-color: black;
        padding: 10px;
        text-align: center;
        color: white;
    }
        #Big {
             width :500px;
             height: 500px;
        }
        nav{   
            text-align:center;
            float: left;
            width:50%;
            height:300%;
           padding: 20px;
        }
         article {
            
  float: left;
  padding: 20px;
  width: 50%;
  height: 300%; 
  margin-bottom: 150px;
}
        #ImageLogout {
        width: 20px;
        height: 20px;
        text-align: right;
    }
        .Image{
 text-align: right;  
}
        #wish,#PlayNow{
            width: 50px;
            height: 50px;
        }
        #flix{
            width:100px;
            height:50px;
        }
        @media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
        * {
  box-sizing: border-box;
}
        table{
            width:60%;
            margin-top:40px;
        }
        td{
            padding: 30px;
        }
        #wish{
            border-radius:50px;
            border-color:White;
            border-style:Solid;
            Height:40px;
            Width:100px; 
        }
        #PlayNow{
            border-radius:50px;
             border-color:White;
             Height:40px;
             Width:100px;
             border-style:Solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <header id="myHeader">
           <asp:ImageButton ID="flix" runat="server" OnClick="Tubeflix_Click" />&nbsp;
    <asp:ImageButton ID="ImageSearch" runat="server" OnClick="ImageSearch_Click" />
&nbsp;&nbsp;
    <asp:TextBox ID="txtSearch" runat="server" Height="20px" Width="409px" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
&nbsp;
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:LinkButton ID="Wishlist" runat="server" ForeColor="#FFFFCC" Height="5px" OnClick="Wishlist_Click1">MyWishList</asp:LinkButton>
           /<asp:LinkButton ID="current" runat="server" ForeColor="#FFFFCC" Height="5px" OnClick="current_Click" >Currently Watching</asp:LinkButton>
    <div class="Image">
 <asp:ImageButton ID="ImageLogout" runat="server" OnClick="ImageLogout_Click" />
        </div>
</header>
        <section>
             <nav>
                <asp:Image ID="Big" runat="server" />
             </nav>

             <article>
                 <table>
                     <tr>
                     <td>
                         <b>Movie Name:</b>
                     </td>
                     <td><asp:Label ID="MName" runat="server" Text="Label"></asp:Label></td>
                         </tr>
                     <tr>
                     <td>
                         <b>Directed By:</b>
                     </td>
                     <td>
                         <asp:Label ID="MDirector" runat="server" Text="Label"></asp:Label>
                     </td>
                         </tr>
                      
                     <tr>
                     <td>
                         <b>Year:</b>
                     </td>
                     <td>
                         <asp:Label ID="Year" runat="server" Text="Label"></asp:Label>
                     </td>  
                         </tr>
                     
                     <tr>
                     <td>
                         <b>Category:</b>
                     </td>
                     <td>
                         <asp:Label ID="moviedetail" runat="server" Text="Label"></asp:Label>
                     </td>
                     </tr>
                     <tr>
                     <td>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="wish" runat="server" OnClick="wish_Click" />
                     </td>
                     <td>
                         <asp:ImageButton ID="PlayNow" runat="server" OnClick="PlayNow_Click" />
                     </td>
                         </tr>
                 </table>
            </article>
        </section>
         <footer>
            <p class="auto-style3">
                <asp:ImageButton ID="ImageFacebook" runat="server" OnClick="ImageFacebook_Click"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageInstagram" runat="server" OnClick="ImageInstagram_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageTwitter" runat="server" OnClick="ImageTwitter_Click"  />
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
