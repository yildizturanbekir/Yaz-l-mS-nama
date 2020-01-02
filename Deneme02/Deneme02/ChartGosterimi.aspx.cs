using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Deneme02
{
    public partial class ChartGosterimi : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source = .; Initial Catalog = Sınav; Integrated Security = True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSession.Text = Session["Ogrenci"] + " ";
            if (Session["Ogrenci"] == null) Response.Redirect("GirisSayfasi.aspx");
            if (!IsPostBack)
            {
                GrafikEkle();
                ddlDoldur();
            }
           // lblMesaj.Text= "Select * from tblSonuc where ogrenciID=" + Session["idOgrenci"] + " and testTarihi='" + ddlTarih.SelectedItem.Text + "'";

        }
        void GrafikEkle()
        {
            try
            {
                DataTable dt = new DataTable();
                conn.Open();
                string chartSorgu = "select top 10 * from tblSonuc where ogrenciID="+ Session["idOgrenci"]+"Order by testTarihi desc";
                SqlDataAdapter daChart = new SqlDataAdapter(chartSorgu, conn);
                DataSet dsChart = new DataSet();
                daChart.Fill(dt);
                dsChart.Dispose();
               
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    chrtDogru.Series["Dogru"].Points.AddXY(dt.Rows[i][3],dt.Rows[i][1]);
                    chrtDogru.Series["Yanlis"].Points.AddY(dt.Rows[i][2]);
                }
                conn.Close();
            }

            catch
            {
                Response.Write("<script>alert('VeriTabanı Hatası...')</script>");
            }
           
        }
        void ddlDoldur()
        {
            conn.Open();
            SqlDataAdapter daSorgu = new SqlDataAdapter("Select testTarihi from tblSonuc where ogrenciID='"+ Session["idOgrenci"] + "'", conn);
            DataSet ds = new DataSet();
            daSorgu.Fill(ds);
            ddlTarih.DataSource = ds;
            ddlTarih.DataTextField = "testTarihi";
            ddlTarih.DataBind();
            daSorgu.Dispose();
            ds.Dispose();
            conn.Close();
        }
        protected void btnBasla_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            string kontrol = "";
            kontrol = dt.ToString("MM/dd/yyyy");

            // bu gün sınav oldumu kontrol
            string SqlKontrol = "select count(*) from tblSonuc where ogrenciID='" + Session["idOgrenci"] + "' and testTarihi='" + kontrol + "'";
            conn.Open();
            SqlCommand cmdBugun = new SqlCommand(SqlKontrol, conn);
            int sinavOldumu = Convert.ToInt32(cmdBugun.ExecuteScalar());
            conn.Close();
            if (sinavOldumu == 0)
            {
                Response.Redirect("SoruCevap.aspx");
            }
            else Response.Write("<script>alert('Bu gün Sınav Oldunuz')</script>");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("GirisSayfasi.aspx");
        }

        protected void btnToplam_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                conn.Open();
                string chartSorgu = "select sum(dogruSayisi) as 'Dogru',sum(yanlisSayisi) as 'Yanlis' from tblSonuc where ogrenciID=" + Session["idOgrenci"] ;
                SqlDataAdapter daChart = new SqlDataAdapter(chartSorgu, conn);
                DataSet dsChart = new DataSet();
                daChart.Fill(dt);
                dsChart.Dispose();
                
                chrtDogru.Series["Dogru"].Points.AddXY("Toplam", dt.Rows[0][0]);
                chrtDogru.Series["Yanlis"].Points.AddY(dt.Rows[0][1]);                
                conn.Close();
                lblMesaj.Text = "Toplam Dogru-Yanlış Sayısı";
            }

            catch
            {
                Response.Write("<script>alert('VeriTabanı Hatası...')</script>");
            }
        }

       

        protected void btnGoster_Click(object sender, EventArgs e)
        {

            lblMesaj.Text = ddlTarih.SelectedItem.Text + "- Tarihli Sınav Sonucu";
            try
            {
                string ddlSorgu = "Select * from tblSonuc where ogrenciID=" + Session["idOgrenci"] + " and testTarihi='" + ddlTarih.SelectedItem.Text + "'";
                DataTable dt1 = new DataTable();
                conn.Open();
                SqlDataAdapter daDdl = new SqlDataAdapter(ddlSorgu, conn);
                DataSet dsChartDll = new DataSet();
                daDdl.Fill(dt1);
                dsChartDll.Dispose();
                chrtDogru.Series["Dogru"].Points.AddXY(dt1.Rows[0][3], dt1.Rows[0][1]);
                chrtDogru.Series["Yanlis"].Points.AddY(dt1.Rows[0][2]);
            }

            catch
            {
              
            }
        }
    }
}