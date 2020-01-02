<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisSayfasi.aspx.cs" Inherits="Deneme02.GirisSayfasi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <title>Giriş</title>
    <style>
        html{
            position:relative;
            min-height:100%;
        }
        body{
           
            padding-left:2px;
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
        <div class="container-fluid bg-dark" style="height:10px"></div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-3 col-sm-3 p-0">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCFF" Height="100%" Width="100%" >
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblUyari" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="20pt"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblGiris" CssClass="display-4" runat="server" ForeColor="Blue" Font-Bold="False" Font-Italic="True">Hoş Geldiniz</asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblKullanici" runat="server" Text="Kullanıcı Adı :" ForeColor="#3333CC" Font-Bold="True"></asp:Label>
                        &nbsp;<asp:TextBox ID="txtKullanici" CssClass="btn" runat="server" Width="130px" BackColor="#CCFFCC" ForeColor="#0066FF"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblSifre" runat="server" Text="Şifre :" ForeColor="#3333CC" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox  ID="txtSifre" CssClass="btn" runat="server" Width="130px" MaxLength="9" TextMode="Password" ToolTip="9 karekteri geçmemeli" BackColor="#FFFFCC"></asp:TextBox>
                        
                        <br />
                        &nbsp;<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnOgrenci" CssClass="btn btn-danger" runat="server" Text="Öğrenci Girişi" Width="230px" OnClick="btnOgrenci_Click" Height="60px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnOgretmen" CssClass="btn btn-dark" runat="server" Text="Öğretmen Girişi" OnClick="btnOgretmen_Click" Width="230px" Height="60px" />
                        
                        &nbsp;
                        
                   </asp:Panel>
                </div>
                <div class="col-9 col-sm-9 text-center p-0">
                   
                        <img src="Resimler/Giris.jpg" class="rounded img-fluid" style="width:100%" />
                                       
                </div>
            </div>
        </div>
        <footer class="footer bg-dark">
            <div class="container-fluid text-center text-warning">9999999</div>
        </footer>
    </form>
</body>
</html>
