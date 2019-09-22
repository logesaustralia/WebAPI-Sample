using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Unity;
using WeatherWebAPIService.Models;

namespace WeatherWebAPIService.DAL
{
    public class WeatherRepository : IWeatherRepository
    {
        //[Dependency]
        private WeatherDBEntities _dbContext = null;

        public WeatherRepository()
        {
            _dbContext = new WeatherDBEntities();
        }
        public List<City> GetCities(int countryID)
        {
            List<Models.City> Cities = new List<City>();

            try
            {
                if (_dbContext != null)
                {
                    tblCountry Country = _dbContext.tblCountries.FirstOrDefault(x => x.ID == countryID);

                    foreach (tblCity city in Country.tblCities)
                    {
                        Cities.Add(new City(city.CityID, city.CityName));
                    }
                    return Cities;

                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Country> GetCountries()
        {
           try
            {
                List<Models.Country> lsCountry = new List<Country>();
                if(_dbContext != null)
                {
                    foreach(tblCountry country in _dbContext.tblCountries)
                    {
                        lsCountry.Add(new Country(country.ID, country.Name));
                    }
                    return lsCountry;
                }
                return null; 
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public tblTemperature GetWeatherData(int cityID)
        {
            try
            {
                if (_dbContext != null)
                {
                    return _dbContext.tblTemperatures.FirstOrDefault(x => x.CityID == cityID);
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}