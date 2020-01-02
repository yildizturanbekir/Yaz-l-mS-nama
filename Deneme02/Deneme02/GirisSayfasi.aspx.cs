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
    public partial class GirisSayfasi : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source = .; Initial Catalog = Sınav; Integrated Security = True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Ogrenci"]!=null)
                Response.Redirect("ChartGosterimi.aspx");
            else if(Session["Ogretmen"]!=null)
                Response.Redirect("SoruEkle.aspx");
        }

        protected void btnOgrenci_Click(object sender, EventArgs e)
        {
            if (txtKullanici.Text != "" && txtSifre.Text != "")
            {
                string buNumaramı = txtSifre.Text;
                if (IsNumeric(buNumaramı))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("select * from tblOgrenci where ogrenciKullanici='" + txtKullanici.Text + "' and ogrenciSifre='" + txtSifre.Text + "'", conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session.Timeout = 60;
                        Session["Ogrenci"] = dr["ogrenciAd"].ToString();
                        Session["idOgrenci"] = dr["ogrenciID"].ToString();
                        Response.Redirect("ChartGosterimi.aspx");
                        conn.Close();
                    }
                    else
                    lblUyari.Text = "Hatalı Giriş";
                    txtKullanici.Text = "";
                    txtSifre.Text = "";
                }
                else lblUyari.Text = " Hatali Giriş";

            }
            else lblUyari.Text = "Boş Alan Bırakmayınız";
            
        }

        protected void btnOgretmen_Click(object sender, EventArgs e)
        {
            if (txtKullanici.Text != "" && txtSifre.Text != "")
            {
                string buNumaramı = txtSifre.Text;
                if (IsNumeric(buNumaramı))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("select * from tblOgretmen where ogretmenKullanici='" + txtKullanici.Text + "' and ogretmenSifre='" + txtSifre.Text + "'", conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session.Timeout = 60;
                        Session["Ogretmen"] = dr["ogretmenAd"].ToString();
                        Session["idOgretmen"] = dr["ogretmenID"].ToString();
                        Response.Redirect("SoruEkle.aspx");
                        conn.Close();
                    }
                    else
                        lblUyari.Text = "Hatalı Giriş";
                    txtKullanici.Text = "";
                    txtSifre.Text = "";
                }
                else lblUyari.Text = " Hatali Giriş";

            }
            else lblUyari.Text = "Boş Alan Bırakmayınız";

        }

        public static bool IsNumeric(object Expression)
        {
            double retNum;

            bool isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
            return isNum;
        }

    }
}