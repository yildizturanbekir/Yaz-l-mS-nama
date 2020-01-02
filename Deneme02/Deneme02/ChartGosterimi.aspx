<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartGosterimi.aspx.cs" Inherits="Deneme02.ChartGosterimi" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <title>Grafik</title>
    <style type="text/css">
        .auto-style1 {
            color: #0000CC;
        }
    </style>
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
                    <asp:Button ID="btnBasla" CssClass="btn btn-light" runat="server" Font-Bold="True" OnClick="btnBasla_Click" Text="Sınav Sayfasi" Width="200px" ToolTip="Kulanıma Kapalı ise Bugunkü Hakınızı Kulandınız Demektir!" />
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCikis" CssClass="btn btn-warning" runat="server" OnClick="Button1_Click" Text="Çıkış" Width="200px" />
                </asp:Panel>
                </div>
                 <div class="col-9 col-sm-9 p-0">
                    <div class=" container">
                        <div class="container-fluid">                        
                         <asp:Panel ID="pnlChart" runat="server" Height="720px">
                             <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">&nbsp;<strong><em>Sınav Tarihi Seçiniz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </em>
                             <asp:Label ID="Label1" runat="server" BackColor="#0000CC" CssClass="btn" ForeColor="White" Text="Dogru"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                             <asp:Label ID="Label2" runat="server" BackColor="Red" CssClass="btn" ForeColor="#0000CC" Text="Yanlis"></asp:Label>
                             </span>
                             <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:DropDownList ID="ddlTarih" runat="server">
                             </asp:DropDownList>
                             <asp:Button ID="btnGoster" runat="server" BackColor="Yellow" CssClass="btn" OnClick="btnGoster_Click" Text="Göster" />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnToplam" runat="server" CssClass="btn btn-success" Font-Bold="True" OnClick="btnToplam_Click" Text="ToplamSonuç" />
                             <br />
                             <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Label ID="lblMesaj" runat="server" Font-Size="14pt" ForeColor="#FF0066" Text="Son olunan Sınavlar "></asp:Label>
                             <br />
                             <asp:Chart ID="chrtDogru" runat="server" Height="470px" Width="744px">
                                 <series>
                                     <asp:Series Color="Blue" MarkerSize="1" Name="Dogru" YValuesPerPoint="1">
                                     </asp:Series>
                                     <asp:Series ChartArea="ChartArea1" Color="Red" MarkerSize="1" Name="Yanlis" XAxisType="Secondary">
                                     </asp:Series>
                                 </series>
                                 <chartareas>
                                     <asp:ChartArea Name="ChartArea1">
                                     </asp:ChartArea>
                                 </chartareas>
                             </asp:Chart>
                        </asp:Panel>
                            </div>
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
