<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoruCevap.aspx.cs" Inherits="Deneme02.SoruCevap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <title>Cevapla</title>
     
</head>
<body>
    <form id="form1" runat="server">
         <div class="container-fluid p-3 text-center text-success">
           <p class="display-4"> <asp:Image src="Resimler/LogoOgrenci.jpg" CssClass="rounded" ID="Image1" runat="server" Width="135px" Height="100px" /> <i>Bu Gün Kendinizi Denediniz Mi?</i></p>          
        </div>
        <div class="container-fluid  bg-dark" style="height:10px"></div>
        <div class="container-fluid bg-success" style="height:10px"></div>
         <div class="container-fluid">
           <div class="row">
            <div class="col-3 col-sm-3 p-0">

                <asp:Panel ID="pnlButton" runat="server" BackColor="#FFCC66" Height="720px">
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblSession" CssClass="display-4 text-success" runat="server"></asp:Label>
                    &nbsp;Hoş Geldiniz<br /> 
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnGrafik" CssClass="btn btn-light" runat="server" Font-Bold="True" OnClick="btnGrafik_Click" Text="Grafik" Width="200px" ToolTip="Girafik sayfasına yönlendirir" />
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnBasla" runat="server" CssClass="btn btn-light" Font-Bold="True" OnClick="btnBasla_Click" Text="Başla" ToolTip="Başlamak için tıkla" Width="200px" />
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCikis" runat="server" CssClass="btn btn-warning" OnClick="Button1_Click" Text="Çıkış" Width="200px" />
                </asp:Panel>

            </div>
               
                <div class="col-9 col-sm-9 p-0">
                    <div class=" container">
                <asp:Panel ID="pnlSoru" runat="server" Height="720px">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="imgSoru" CssClass="img-thumbnail" runat="server" Height="120px" Width="400px" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <asp:Label ID="lblSoru" runat="server" Enabled="False" Font-Bold="True" Font-Size="14pt"></asp:Label>
                     
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnA" CssClass="btn btn-success" runat="server" Text="A" OnClick="btnA_Click" />
                    <asp:Label ID="lblCevapA" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnB" CssClass="btn btn-success" runat="server" Text="B" OnClick="btnB_Click" />
                    <asp:Label ID="lblCevapB" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnC" CssClass="btn btn-success" runat="server" Height="33px" Text="C" OnClick="btnC_Click" />
                    <asp:Label ID="lblCevapC" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnD" CssClass="btn btn-success" runat="server" Text="D" OnClick="btnD_Click" />
                    <asp:Label ID="lblCevapD" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:Panel>
                        </div>
                </div>
            </div>
        </div>          
        <footer class="footer">
            <div class="container-fluid bg-dark" style="height:80px"></div>
        </footer>            
    </form>
</body>
</html>
