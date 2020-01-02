<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoruEkle.aspx.cs" Inherits="Deneme02.SoruEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <title>Soru Ekle</title>
    <style>
        html{
            position:relative;
            min-height:100%;
        }
        
        .footer{
            
            bottom:0;
            width:100%;
            height:80px;
            line-height:80px;
        }
    </style>
</head>
<body>
    
       <form id="form1" runat="server">
        <div class="container-fluid p-3 text-center text-success">
           <p class="display-3"> <asp:Image src="Resimler/LogoOgrenci.jpg" ID="Image1" runat="server" Width="135px" Height="146px" /> <i>Bu Gün Kendinizi Denediniz Mi?</i></p>          
        </div>
        <div class="container-fluid  bg-dark" style="height:10px"></div>
        <div class="container-fluid bg-danger" style="height:10px"></div>
         <div class="container-fluid">
           <div class="row">
            <div class="col-3 col-sm-3 p-0">

                <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC66" Height="760px">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblSession" runat="server" CssClass=" display-4" ForeColor="#FF6600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <h3 class="text-success">&nbsp;&nbsp;&nbsp; Hoş Geldiniz</h3>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnExit" runat="server" OnClick="btnExit_Click" Text="Çıkış" Width="230px" CssClass="btn btn-success" Height="60px" />
                    <br /> </asp:Panel>

            </div>
            <div class="col-8 col-sm-8 p-0">

                <asp:Panel ID="Panel2" runat="server" Height="760px" BorderColor="#FFCCFF">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Resim Seçiniz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:FileUpload ID="fileResim" runat="server" Width="300px" CssClass="btn" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Soruyu Yazınız&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtSoru" runat="server" Height="60px" TextMode="MultiLine" Width="300px" BorderColor="#3333CC" BorderStyle="Solid" CssClass="btn"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorunun A Şıkkı&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCevapA" runat="server" TextMode="MultiLine" Width="300px" BorderColor="#3333CC" BorderStyle="Solid" CssClass="btn"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorunun B Şıkkı&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCevapB" runat="server" TextMode="MultiLine" Width="300px" BorderColor="#3333CC" BorderStyle="Solid" CssClass="btn"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorunun C Şıkkı&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCevapC" runat="server" TextMode="MultiLine" Width="300px" BorderColor="#3333CC" BorderStyle="Solid" CssClass="btn"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorunun D Şıkkı&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCevapD" runat="server" TextMode="MultiLine" Width="300px" BorderColor="#3333CC" BorderStyle="Solid" CssClass="btn"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorunun Doğru Şıkkı&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlCevaplar" runat="server" Width="53px">
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                        <asp:ListItem>D</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; Soru Katagorisi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlKatagori" DataTextField="katagoriAd" DataValueField="katagoriID" runat="server">
                        <asp:ListItem Value="1">Üslü Sayılar</asp:ListItem>
                        <asp:ListItem Value="2">Mutlak Değer</asp:ListItem>
                        <asp:ListItem Value="6">Ondalıklı sayılar</asp:ListItem>
                        <asp:ListItem Value="9">Problemler</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSoruEkle" runat="server" OnClick="btnSoruEkle_Click" Text="Soru Ekle" Width="150px" />
                </asp:Panel>

            </div>
        </div>
             </div>
        <footer class="footer">
            <div class="container-fluid bg-dark" style="height:80px"></div>
        </footer>
    </form>
    
</body>
</html>
