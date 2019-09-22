using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Unity;
using Unity.Mvc5;
using System.Web.Http.Dependencies;
using WeatherWebAPIService.DAL;

namespace WeatherWebAPIService.App_Start
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();
           

            // register all your components with the container here 
            // it is NOT necessary to register your controllers 

            // e.g. container.RegisterType<ITestService, TestService>(); 

            container.RegisterType<IWeatherRepository, WeatherRepository>();
           

            System.Web.Mvc.DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }

    }
}