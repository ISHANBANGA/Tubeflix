<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TubeFlix.aspx.cs" Inherits="FinalProject4.TubeFlix" %>

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
    .auto-style1 {
        height: auto;
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
    .auto-style4 {
        height: auto;
    }
            #flix{
            width:100px;
            height:50px;
        }
</style>

</head>
<body>
    <form id="form1" runat="server">
<header id="myHeader">
<asp:ImageButton ID="flix" runat="server" OnClick="Tubeflix_Click" />&nbsp;
    <asp:ImageButton ID="ImageSearch" runat="server" OnClick="ImageSearch_Click" />
&nbsp;&nbsp;
    <asp:TextBox ID="txtSearch" runat="server" Height="20px" Width="409px" ></asp:TextBox>
&nbsp;
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:LinkButton ID="Wishlist" runat="server" ForeColor="#FFFFCC" Height="5px" OnClick="Wishlist_Click">MyWishList</asp:LinkButton>
    /<asp:LinkButton ID="current" runat="server" ForeColor="#FFFFCC" Height="5px" OnClick="current_Click" >Currently Watching</asp:LinkButton>
    <div class="Image">
 <asp:ImageButton ID="ImageLogout" runat="server" OnClick="ImageLogout_Click" />
        </div>
</header>
<section class="auto-style4">  
  <article class="auto-style1">
      <label>Marvel Creation</label>
   <div class="flex-container">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <div>
      <asp:ImageButton ID="Avengers" runat="server" OnClick="Avengers_Click" />
</div>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
  <div>
      <asp:ImageButton ID="AvenUtlron" runat="server" OnClick="AvenUtlron_Click" />
       </div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <div>
      <asp:ImageButton ID="AvenInfinity" runat="server" OnClick="AvenInfinity_Click" />
</div>  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <div>
      <asp:ImageButton ID="AvenEndGame" runat="server" OnClick="AvenEndGame_Click" />
       </div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <div>
      <asp:ImageButton ID="Thor" runat="server" OnClick="Thor_Click" />
</div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <div>
      <asp:ImageButton ID="Thor2" runat="server" OnClick="Thor2_Click" />
       </div>  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <div>
      <asp:ImageButton ID="Thor3" runat="server" OnClick="Thor3_Click" />
</div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
</div>
      <br />
      <label>TV Series</label>
     <div class="flex-container">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<div>
    <asp:ImageButton ID="sacredgames" runat="server" OnClick="sacredgames_Click" />
         </div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="moneyh" runat="server" OnClick="moneyh_Click" />
         </div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="strangert" runat="server" OnClick="strangert_Click" />
</div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Mirzapur" runat="server" OnClick="Mirzapur_Click" />
         </div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Friends" runat="server" OnClick="Friends_Click" />
         </div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="panchayat" runat="server" OnClick="panchayat_Click" />
</div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="theorder" runat="server" Height="143px" OnClick="theorder_Click" />
</div>

</div>
      <br />
        <label>Horror Movies</label>
   <div class="flex-container">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Conjuring" runat="server" OnClick="Conjuring_Click" />
</div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Conjuring2" runat="server" OnClick="Conjuring2_Click" />
</div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Annabelle" runat="server" OnClick="Annabelle_Click" />
       </div>  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="ACreation" runat="server" OnClick="ACreation_Click" />
</div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="TheNun" runat="server" OnClick="TheNun_Click" />
       </div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="It" runat="server" OnClick="It_Click" />
</div>  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="It2" runat="server" OnClick="It2_Click" />
</div>
   </div>
      <br />
      <label>Punjabi Movies</label>
     <div class="flex-container">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<div>
    <asp:ImageButton ID="eksandhu" runat="server" OnClick="eksandhu_Click" />
</div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Sufna" runat="server" OnClick="Sufna_Click" />
         </div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="jatt1" runat="server" OnClick="jatt1_Click" />
</div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="jatt2" runat="server" OnClick="jatt2_Click" />
</div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="carryonjatta" runat="server" OnClick="carryonjatta_Click" />
</div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="chalmeraput" runat="server" OnClick="chalmeraput_Click" />
</div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="chalmeraput2" runat="server" OnClick="chalmeraput2_Click" />
</div>

</div>
       <br />
      <label>Bollywood Movies</label>
     <div class="flex-container">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<div>
    <asp:ImageButton ID="Idiots" runat="server" OnClick="Idiots_Click" />
</div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Dilwale" runat="server" OnClick="Dilwale_Click" />
</div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Queen" runat="server" OnClick="Queen_Click" />
</div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Dilchahta" runat="server" OnClick="Dilchahta_Click" />
         </div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Lagaan" runat="server" OnClick="Lagaan_Click" />
</div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="Dangal" runat="server" OnClick="Dangal_Click" />
</div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  <div>
      <asp:ImageButton ID="GullyBoy" runat="server" OnClick="GullyBoy_Click" />
</div>

</div>
  </article>
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

