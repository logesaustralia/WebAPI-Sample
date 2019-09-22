using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeatherWebAPIService.Models;

namespace WeatherWebAPIService.DAL
{
    public interface IWeatherRepository
    {
        List<Country> GetCountries();
        List<City> GetCities(int countryID);
        tblTemperature GetWeatherData(int cityID);
    }
}