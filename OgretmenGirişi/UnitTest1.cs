using System;
using System.Linq;
using Xunit;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace OnlineSınav
{
    public class UnitTest1 
    {
        IWebDriver driver = new ChromeDriver();
        [Fact]  
        public void SiteyeGiris() 
        {

            driver.Navigate().GoToUrl("http://localhost:59526/GirisSayfasi.aspx");
            System.Threading.Thread.Sleep(11000);
            driver.FindElement(By.Name("txtKullanici")).SendKeys("asdf");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtSifre")).SendKeys("1234");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("btnOgretmen")).Click();
        }
    }
}
