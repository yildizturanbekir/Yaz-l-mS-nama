using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Deneme02
{

    public partial class SoruCevap : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source = .; Initial Catalog = Sınav; Integrated Security = True");
        static int[] soruBilgisi = new int[30];
        static int[] ktgrID = new int[4] { 1, 2, 6, 9 };
        static int soruSayaci = 0, toplamYanlis;
        static string dogruCevap, soruKatagori;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblSession.Text = Session["Ogrenci"] +" ";
            if (Session["Ogrenci"] == null) Response.Redirect("GirisSayfasi.aspx");
            


            DateTime dt = DateTime.Now;
            string kontrol = "";
            kontrol = dt.ToString("dd/MM/yyyy");
            // bu gün sınav oldumu kontrol
            string SqlOldumu = "select count(*) from tblSonuc where ogrenciID='" + Session["idOgrenci"] + "' and testTarihi='"+kontrol+"'";
            conn.Open();
            SqlCommand cmdBugun = new SqlCommand(SqlOldumu, conn);
            int sinavOldumu = Convert.ToInt32(cmdBugun.ExecuteScalar());
            conn.Close();
            if (sinavOldumu != 0)
            {
                Response.Redirect("ChartGosterimi.aspx");
            }
            
        }

        public void LblTemizle()
        {
            lblSoru.Text = "";
            lblCevapD.Text = "";
            lblCevapC.Text = "";
            lblCevapB.Text = "";
            lblCevapA.Text = "";

        }
        static double[] soruAdet = new double[4];
        void SoruEkle()
        {            
            if (soruBilgisi[19] == 0)
            {
                string SqlYalisSayisi = "select sum(yanlis) from tblYanlisSayisi where ogrenciID='" + Session["idOgrenci"] + "'";
                conn.Open();
                SqlCommand cmdYanlis = new SqlCommand(SqlYalisSayisi, conn);
                toplamYanlis = Convert.ToInt32(cmdYanlis.ExecuteScalar());
                conn.Close();


                conn.Open();
                string katagoriYanlis = "select yanlis from tblYanlisSayisi where ogrenciID=" + Session["idOgrenci"] + " and katagoriID= " + ktgrID[0].ToString() + " ";
                SqlCommand cmdK_Yanlis = new SqlCommand(katagoriYanlis, conn);
                int k_Yanlis = Convert.ToInt32(cmdK_Yanlis.ExecuteScalar());
                soruAdet[0] = (k_Yanlis * 12) / toplamYanlis;
                soruAdet[0] = Math.Round(soruAdet[0]);
                conn.Close();

                conn.Open();
                string katagoriYanlis1 = "select yanlis from tblYanlisSayisi where ogrenciID=" + Session["idOgrenci"] + " and katagoriID= " + ktgrID[1].ToString() + " ";
                SqlCommand cmdK_Yanlis1 = new SqlCommand(katagoriYanlis1, conn);
                int k_Yanlis1 = Convert.ToInt32(cmdK_Yanlis1.ExecuteScalar());
                soruAdet[1] = (k_Yanlis1 * 12) / toplamYanlis;
                soruAdet[1] = Math.Round(soruAdet[1]);
                conn.Close();
                conn.Open();
                string katagoriYanlis2 = "select yanlis from tblYanlisSayisi where ogrenciID=" + Session["idOgrenci"] + " and katagoriID= " + ktgrID[2].ToString() + " ";
                SqlCommand cmdK_Yanlis2 = new SqlCommand(katagoriYanlis2, conn);
                int k_Yanlis2 = Convert.ToInt32(cmdK_Yanlis2.ExecuteScalar());
                soruAdet[2] = (k_Yanlis2 * 12) / toplamYanlis;
                soruAdet[2] = Math.Round(soruAdet[2]);
                conn.Close();
                conn.Open();
                string katagoriYanlis3 = "select yanlis from tblYanlisSayisi where ogrenciID=" + Session["idOgrenci"] + " and katagoriID= " + ktgrID[3].ToString() + " ";
                SqlCommand cmdK_Yanlis3 = new SqlCommand(katagoriYanlis3, conn);
                int k_Yanlis3 = Convert.ToInt32(cmdK_Yanlis3.ExecuteScalar());
                soruAdet[3] = (k_Yanlis1 * 12) / toplamYanlis;
                soruAdet[3] = Math.Round(soruAdet[3]);
                conn.Close();

                for (int i = 0; i < 4; i++)
                {
                    int soruMiktari = 2;
                    soruMiktari += Convert.ToInt32(soruAdet[i]);
                    string SqlSorgu = "Select  top " + soruMiktari + " soruID  from tblSoru where katagoriID='" + ktgrID[i].ToString() + "' order by newid()";
                    conn.Open();
                    SqlCommand cmdSorgu = new SqlCommand(SqlSorgu, conn);
                    SqlDataReader dr = cmdSorgu.ExecuteReader();
                    while (dr.Read())
                    {
                        soruBilgisi[soruSayaci] = Convert.ToInt32(dr["soruID"].ToString());
                        soruSayaci++;
                    }
                    conn.Close();
                }
            }
        }
        static int getirSayac = 0;
        void SoruGetir()
        {
            if(getirSayac < 20)
            {
                try
                {
                    string SqlGetir = "Select  * from tblSoru where soruID=" + soruBilgisi[getirSayac] + " order by newid()";;
                    conn.Open();
                    SqlCommand cmdGetir = new SqlCommand(SqlGetir, conn);
                    SqlDataReader drGetir = cmdGetir.ExecuteReader();
                    while (drGetir.Read())
                    {
                        imgSoru.ImageUrl = drGetir["soruResim"].ToString();
                        dogruCevap = drGetir["soruDogruCevap"].ToString();
                        lblSoru.Text = (getirSayac + 1).ToString() + " )   " + drGetir["soruSoru"].ToString();
                        lblCevapA.Text = drGetir["soruCevapA"].ToString();
                        lblCevapB.Text = drGetir["soruCevapB"].ToString();
                        lblCevapC.Text = drGetir["soruCevapC"].ToString();
                        lblCevapD.Text = drGetir["soruCevapD"].ToString();
                        soruKatagori = drGetir["katagoriID"].ToString();
                    }
                    drGetir.Close();
                    conn.Close();
                }
                catch
                {
                    Response.Write("<script>alert('Soru ekleme hatası..')</script>");
                }
                
            }
            

           
        }
        static int sayacDogru = 0;    

        protected void btnGrafik_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChartGosterimi.aspx");       
                     
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Session.Abandon();
            Response.Redirect("GirisSayfasi.aspx");
            
        }

        void YanlisSayisiArtir()
        {
            conn.Open();
            string yanlisKatagoriAdeti = "select yanlis from tblYanlisSayisi where ogrenciID=" + Session["idOgrenci"] + " and katagoriID= " + soruKatagori + " ";
            SqlCommand cmdYanlisAdet = new SqlCommand(yanlisKatagoriAdeti, conn);
            int yanlisAdet = Convert.ToInt32(cmdYanlisAdet.ExecuteScalar());
            conn.Close();

            try
            {
                yanlisAdet++;
                string upYanlis = "Update tblYanlisSayisi set yanlis=@yanlis where ogrenciID=" + Session["idOgrenci"] + " and katagoriID= " + soruKatagori + " ";
                conn.Open();
                SqlCommand cmd = new SqlCommand(upYanlis, conn);
                cmd.Parameters.AddWithValue("@yanlis", yanlisAdet);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch
            {
                Response.Write("<script>alert('VeriTabanı Hatası katagorisel veri eklemede...')</script>");
            }
        }
        void SonucEkle()
        {
            try
            {
                DateTime dt = DateTime.Now;
                string buGun = "";
                buGun = dt.ToString("dd/MM/yyyy");
                int yanlis_adet;
                yanlis_adet = 20 - sayacDogru;
                string sonucUpdate = " INSERT INTO tblSonuc (ogrenciID,dogruSayisi,yanlisSayisi,testTarihi) VALUES (@id,@dogru,@yanlis,@tarih)";
                conn.Open();
                SqlCommand cmd = new SqlCommand(sonucUpdate, conn);
                cmd.Parameters.AddWithValue("@id", Session["idOgrenci"]);
                cmd.Parameters.AddWithValue("@dogru", sayacDogru);
                cmd.Parameters.AddWithValue("@yanlis", yanlis_adet);
                cmd.Parameters.AddWithValue("@tarih", buGun);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch
            {
                Response.Write("<script>alert('VeriTabanı Hatası...')</script>");
            }
            
        }
        protected void btnA_Click(object sender, EventArgs e)
        {

            getirSayac++;
            if (getirSayac <20)
            {
                if (dogruCevap == "A")
                {
                    sayacDogru++;
                    
                }
                else
                {
                    YanlisSayisiArtir();
                }
               
            }
            else            
            {
                SonucEkle();
                Response.Write("<script>alert('Sınaviniz bitmiştir " + sayacDogru + "')</script>");
                LblTemizle();
            }
            
            SoruGetir();
        }
        protected void btnB_Click(object sender, EventArgs e)
        {
            getirSayac++;
            if (getirSayac <20)
            {
                if (dogruCevap == "B")
                {
                    sayacDogru++;
                }
                else
                {
                    YanlisSayisiArtir(); 
                }
               
            }
            else
            {
                SonucEkle();
                Response.Write("<script>alert('Sınaviniz bitmiştir " + sayacDogru + "')</script>");
                LblTemizle();
            }
           
            SoruGetir();
           
        }

        protected void btnBasla_Click(object sender, EventArgs e)
        {
            getirSayac = 0;
            SoruEkle();
            SoruGetir();
            btnBasla.Enabled = false;
        }

        protected void btnC_Click(object sender, EventArgs e)
        {
            getirSayac++;
            if (getirSayac <20)
            {
                
                if (dogruCevap == "C") 
                {
                    sayacDogru++;
                }
                else
                {
                    YanlisSayisiArtir(); 
                }
            }
            else
            {
                SonucEkle();
                Response.Write("<script>alert('Sınaviniz bitmiştir " + sayacDogru + "')</script>");
                LblTemizle();
               
            }

            
            SoruGetir();
        }

        protected void btnD_Click(object sender, EventArgs e)
        {
            getirSayac++;
            if (getirSayac <20)
            {
               
                if (dogruCevap == "D")
                {
                    sayacDogru++; 
                }
                else
                {
                    YanlisSayisiArtir();  
                }
               
            }
            else
            {
                SonucEkle();
                Response.Write("<script>alert('Sınaviniz bitmiştir " + sayacDogru + "')</script>");
                LblTemizle();              
            }
            
            SoruGetir();
        }
        
    }
}