using System;
using System.Linq;
using Xunit;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace HepsiniGoster
{
    public class Hepsi // test sınfıımız 
    {
        IWebDriver driver = new ChromeDriver();// 
        [Fact] //bu ifade bize bu metodun test metodu olduğunu gösterir
        public void GrafikToplam() // test metodumuz
        {
            driver.Navigate().GoToUrl("http://localhost:59526/GirisSayfasi.aspx");
            System.Threading.Thread.Sleep(11000);
            driver.FindElement(By.Name("txtKullanici")).SendKeys("ogrenci");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("txtSifre")).SendKeys("1234");
            System.Threading.Thread.Sleep(1000);
            driver.FindElement(By.Name("btnOgrenci")).Click();
            System.Threading.Thread.Sleep(11000);
            driver.FindElement(By.Name("btnToplam")).Click();
        }
    }
}
