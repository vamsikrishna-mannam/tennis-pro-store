using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dbms
{
    public class tennis
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public double Price { get; set; }
        public string Power { get; set; }
        public string Country { get; set; }
        public string Image { get; set; }
        public string Review { get; set; }


        public tennis(int id, string name, string type, double price, string power, string country, string image, string review)
        {
            Id = id;
            Name = name;
            Type = type;
            Price = price;
            Power = power;
            Country = country;
            Image = image;
            Review = review;
        }

        public tennis(string name, string type, double price, string power, string country, string image, string review)
        {
            Name = name;
            Type = type;
            Price = price;
            Power = power;
            Country = country;
            Image = image;
            Review = review;
        }

    }
}