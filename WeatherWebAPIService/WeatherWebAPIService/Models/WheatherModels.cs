using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeatherWebAPIService.Models
{
    public class City
    {
        int _id;
        string _name;
        public City(int id, string name)
        {
            _id = id;
            _name = name;
        }
        public int ID
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
    }

    public class Country
    {
        int _id;
        string _name;
        public Country(int id, string name)
        {
            _id = id;
            _name = name;
        }
        public int ID
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
    }
}