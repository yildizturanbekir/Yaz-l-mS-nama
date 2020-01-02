using System;
using System.Linq;
using Xunit;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;

namespace SoruEkle
{
    public class UnitTest1 // test sınfıımız 
    {
        IWebDriver driver = new ChromeDriver();
        [Fact]
        public void SiteyeGiris(){

            driver.Navigate().GoToUrl("http://localhost:59526/GirisSayfasi.aspx");
            System.Threading.Thread.Sleep(11000);
            driver.FindElement(By.Name("txtKullanici")).SendKeys("asdf");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtSifre")).SendKeys("1234");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("btnOgretmen")).Click();
            System.Threading.Thread.Sleep(11000);
            driver.FindElement(By.Name("txtSoru")).SendKeys("2 kaçıncı kuveti 4'ün 5.kuvetine eşittir ? ");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtCevapA")).SendKeys("12");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtCevapB")).SendKeys("10");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtCevapC")).SendKeys("16");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtCevapD")).SendKeys("8");
            System.Threading.Thread.Sleep(1000);
            IWebElement selectElement = driver.FindElement(By.Id("ddlCevaplar"));
            SelectElement oSelect = new SelectElement(selectElement);
            oSelect.SelectByText("B");
            System.Threading.Thread.Sleep(1000);
            IWebElement selectElement2 = driver.FindElement(By.Id("ddlCevaplar"));
            SelectElement oSelect2 = new SelectElement(selectElement2);
            oSelect2.SelectByText("Üslü Sayılar");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("btnSoruEkle")).Click();
        }
       
    }
}
