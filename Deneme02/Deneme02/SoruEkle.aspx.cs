using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Deneme02
{
    public partial class SoruEkle : System.Web.UI.Page
    {
        //sql bağlantı adresini buraya yazdık heryerde kulanılsın diye
        SqlConnection conn = new SqlConnection("Data Source = .; Initial Catalog = Sınav; Integrated Security = True");
        static string soruResim;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Eğer öğretmen olarak giriş yapmadıysa tekrar giriş sayfasına yönlediriliyor
              if(Session["Ogretmen"]==null)
              {               
                Response.Redirect("GirisSayfasi.aspx");               
              }
            lblSession.Text = Session["Ogretmen"].ToString();
            
        }
       //Soru ekleme kısmı
        protected void btnSoruEkle_Click(object sender, EventArgs e)
        {
          
            soruResim =@"Resimler\yok.png";
            if (fileResim.HasFile)
            {
                if (Path.GetExtension(fileResim.PostedFile.FileName) == ".jpg" || Path.GetExtension(fileResim.PostedFile.FileName) == ".png")
                {
                    Random r = new Random();
                    int rdnSayi = r.Next(0, 999999999);
                    string ResimUzantisi = Path.GetExtension(fileResim.PostedFile.FileName);
                    string ResimAdi=fileResim.PostedFile.FileName;
                    //Geçici olarak FileUpload nesnemizdeki resmi Resimler dizinine kayıt ediyoruz.
                    fileResim.SaveAs(Server.MapPath("~\\Resimler\\") +rdnSayi+ResimAdi);
                    soruResim = @"Resimler\" + rdnSayi + fileResim.FileName ;
                }
                else
                {                  
                    Response.Write("<script>alert('jpg veya png resim seciniz ')</script>");
                }

            }

            if (txtCevapA.Text != "" && txtCevapA.Text != "" && txtCevapB.Text != "" && txtCevapC.Text != "" && txtCevapD.Text != "" && txtSoru.Text!="")
            {
                conn.Open();
                SqlCommand cmdEkle = new SqlCommand("INSERT INTO tblSoru(katagoriID,ogretmenID,soruResim,soruSoru,soruCevapA,soruCevapB,soruCevapC,soruCevapD,soruDogruCevap)" +
                    " values(@kID,@oID,@sR,@sS,@sA,@sB,@sC,@sD,@sDC,@sSf)", conn);
                cmdEkle.Parameters.AddWithValue("@oID", Session["idOgretmen"].ToString());
                cmdEkle.Parameters.AddWithValue("@kID", ddlKatagori.SelectedValue);
                cmdEkle.Parameters.AddWithValue("@sR", soruResim);
                cmdEkle.Parameters.AddWithValue("@sS", txtSoru.Text);
                cmdEkle.Parameters.AddWithValue("@sA", txtCevapA.Text);
                cmdEkle.Parameters.AddWithValue("@sB", txtCevapB.Text);
                cmdEkle.Parameters.AddWithValue("@sC", txtCevapC.Text);
                cmdEkle.Parameters.AddWithValue("@sD", txtCevapD.Text);
                cmdEkle.Parameters.AddWithValue("@sDC", ddlCevaplar.SelectedValue);
                cmdEkle.ExecuteNonQuery();
                conn.Close();
                temizle();
                
            }
            else
                Response.Write("<script>alert('Resim Haricinde Boş Alan Bırakmayınız ')</script>");

            
        }
        protected void temizle()
        {
            txtCevapA.Text = "";
            txtCevapB.Text = "";
            txtCevapC.Text = "";
            txtCevapD.Text = "";
            txtSoru.Text = "";
            soruResim = @"Resimler\yok.png";

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("GirisSayfasi.aspx");
        }
    }
}