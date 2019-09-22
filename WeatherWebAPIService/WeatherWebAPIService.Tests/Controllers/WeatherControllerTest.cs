using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WeatherWebAPIService.Controllers;
using WeatherWebAPIService.DAL;
using System.Net.Http;
using WeatherWebAPIService.Models;
using System.Collections.Generic;
using System.Web.Http.Hosting;
using System.Web.Http;

namespace WeatherWebAPIService.Tests.Controllers
{
    [TestClass]
    public class WeatherControllerTest
    {
        [TestMethod]
        public void GetCountries()
        {
            IWeatherRepository _iWeatherRepository = null;
            _iWeatherRepository = new WeatherRepository();
            List<Country> expectedCountries = new List<Country>() {
                new Country(1,"Australia"),
                new Country(2,"America"),
                new Country(3,"England")
            };
            List<Country> actualCountries = null;
            WeatherController wc = new WeatherController(_iWeatherRepository);
            wc.Request = new HttpRequestMessage()
            {
                Properties = { { HttpPropertyKeys.HttpConfigurationKey, new HttpConfiguration() } }
            };

            HttpResponseMessage response = wc.GetCountries();
            response.TryGetContentValue<List<Country>>(out actualCountries);

            Assert.AreEqual(expectedCountries, actualCountries);
        }

        [TestMethod]
        public void GetCitiesByCountry()
        {
            IWeatherRepository _iWeatherRepository = null;
            int countryID = 1;
            _iWeatherRepository = new WeatherRepository();
            List<City> expectedCities = new List<City>() {
                new City(1,"Sydney"),
                new City(2,"Melbourne")
            };
            List<Country> actualCities = null;
            WeatherController wc = new WeatherController(_iWeatherRepository);
            wc.Request = new HttpRequestMessage()
            {
                Properties = { { HttpPropertyKeys.HttpConfigurationKey, new HttpConfiguration() } }
            };
            HttpResponseMessage response = wc.GetCitiesByCountryID(countryID);
            response.TryGetContentValue<List<Country>>(out actualCities);

            Assert.AreEqual(expectedCities, actualCities);
        }

        [TestMethod]
        public void GetWeatherDataByCity()
        {
            IWeatherRepository _iWeatherRepository = null;
            int cityID = 1;
            _iWeatherRepository = new WeatherRepository();
            tblTemperature expectedTempData = new tblTemperature();

            expectedTempData.CityID = 1;
            expectedTempData.Location = "Paramatta";
            expectedTempData.Preasure = 30;
            expectedTempData.RelativeHumidity = 50;
            expectedTempData.SkyCondition = "Good";
            expectedTempData.Visibility = 1;
            expectedTempData.DewPoint = 1;


            List<Country> actualTempData = null;
            WeatherController wc = new WeatherController(_iWeatherRepository);
            wc.Request = new HttpRequestMessage()
            {
                Properties = { { HttpPropertyKeys.HttpConfigurationKey, new HttpConfiguration() } }
            };
            HttpResponseMessage response = wc.GetWeatherDataByCity(cityID);
            response.TryGetContentValue<List<Country>>(out actualTempData);

            Assert.AreEqual(expectedTempData, actualTempData);
        }
    }
}
