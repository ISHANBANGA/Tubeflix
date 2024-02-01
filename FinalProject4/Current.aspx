<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Current.aspx.cs" Inherits="FinalProject4.Current" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
         #ImageButton1,#ImageButton2,#ImageButton3,#ImageButton4,#ImageButton5{
             width:100px;
             height:150px;
         }
         #ImageButton6,#ImageButton7,#ImageButton8,#ImageButton9,#ImageButton10{
             width:100px;
             height:150px;
         }
         #ImageButton11,#ImageButton12,#ImageButton13,#ImageButton14,#ImageButton15{
             width:100px;
             height:150px;
         }
         #ImageButton16,#ImageButton17,#ImageButton18,#ImageButton19,#ImageButton20{
             width:100px;
             height:150px;
         }
         #ImageButton21,#ImageButton22,#ImageButton23,#ImageButton24,#ImageButton25{
             width:100px;
             height:150px;
         }
         #ImageButton26,#ImageButton27,#ImageButton28,#ImageButton29,#ImageButton30{
             width:100px;
             height:150px;
         }
        #ImageButton31, #ImageButton32, #ImageButton33, #ImageButton34, #ImageButton35 {
            width: 100px;
            height: 150px;
        }
         section{
             margin-top: 20px;
             margin-bottom:20px;
         }
            .flex-container {
            display: flex;
            background-color: burlywood;
        }

.flex-container > div {
  background-color: #f1f1f1;
  width: 100px;
 margin: 20px;
  text-align: center;
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
    <asp:LinkButton ID="Wishlist" runat="server" Height="10px" OnClick="Wishlist_Click1">MyWishList</asp:LinkButton>
              /<asp:LinkButton ID="current" runat="server" ForeColor="#FFFFCC" Height="5px" OnClick="current_Click" >Currently Watching</asp:LinkButton>
    <div class="Image">
 <asp:ImageButton ID="ImageLogout" runat="server" OnClick="ImageLogout_Click" />
        </div>
</header>
        <section>
 <div class="flex-container">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton3" runat="server" OnClick="ImageButton3_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton4" runat="server" OnClick="ImageButton4_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton5" runat="server" OnClick="ImageButton5_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

         
                <asp:ImageButton ID="ImageButton6" runat="server" OnClick="ImageButton6_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton7" runat="server" OnClick="ImageButton7_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
               </div> 
       <br />
       <div class="flex-container"> 

           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton8" runat="server" OnClick="ImageButton8_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton9" runat="server" OnClick="ImageButton9_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton10" runat="server" OnClick="ImageButton10_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton11" runat="server" OnClick="ImageButton11_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton12" runat="server" OnClick="ImageButton12_Click"   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton13" runat="server" OnClick="ImageButton13_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton14" runat="server" OnClick="ImageButton14_Click"   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

           </div>
       <br />
        <div class="flex-container">  
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton15" runat="server" OnClick="ImageButton15_Click"   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton16" runat="server" OnClick="ImageButton16_Click" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton17" runat="server" OnClick="ImageButton17_Click"  />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton18" runat="server" OnClick="ImageButton18_Click" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton19" runat="server" OnClick="ImageButton19_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

             <asp:ImageButton ID="ImageButton20" runat="server" OnClick="ImageButton20_Click"  />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton21" runat="server" OnClick="ImageButton21_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </div> 
       <br />
       <div class="flex-container">  
       
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton22" runat="server" OnClick="ImageButton22_Click"/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton23" runat="server" OnClick="ImageButton23_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton24" runat="server" OnClick="ImageButton24_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton25" runat="server" OnClick="ImageButton25_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton26" runat="server" OnClick="ImageButton26_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton27" runat="server" OnClick="ImageButton27_Click"  />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton28" runat="server" OnClick="ImageButton28_Click"  />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
           </div>  
       <br />
       <div class="flex-container">  

           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton29" runat="server" OnClick="ImageButton29_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:ImageButton ID="ImageButton30" runat="server" OnClick="ImageButton30_Click"   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton31" runat="server" OnClick="ImageButton31_Click"   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton32" runat="server" OnClick="ImageButton32_Click"   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton33" runat="server" OnClick="ImageButton33_Click"  />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:ImageButton ID="ImageButton34" runat="server" OnClick="ImageButton34_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:ImageButton ID="ImageButton35" runat="server" OnClick="ImageButton35_Click"   />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
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
