using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Unity;
using WeatherWebAPIService.DAL;
using WeatherWebAPIService.Models;

namespace WeatherWebAPIService.Controllers
{
    public class WeatherController : ApiController
    {
        IWeatherRepository _iWeatherRepository = null;

        public WeatherController(IWeatherRepository weatherRepository)
        {
            _iWeatherRepository = weatherRepository;
        }
        [HttpGet]
        [Route("GetCountries")]
     
        public HttpResponseMessage GetCountries()
        {
            try
            {
                List<Country> Countries = _iWeatherRepository.GetCountries();
                return Request.CreateResponse(HttpStatusCode.OK, Countries);
            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("GetCitiesByCountryID/{countryID}")]
        
        public HttpResponseMessage GetCitiesByCountryID([FromUri]int countryID)
        {
            try
            {
                List<City> Cities = _iWeatherRepository.GetCities(countryID);
                return Request.CreateResponse(HttpStatusCode.OK, Cities);
            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("GetTemperatureDataByCity/{cityID}")]
        public HttpResponseMessage GetWeatherDataByCity([FromUri] int cityID)
        {
            try
            {
                tblTemperature temperatureData = _iWeatherRepository.GetWeatherData(cityID);
                return Request.CreateResponse(HttpStatusCode.OK, temperatureData);
            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
