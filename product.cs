using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dbms
{
    public class product
    {


        public int Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int Price { get; set; }
        public string Country { get; set; }
        public string Gender { get; set; }
        public string Image { get; set; }
        public string Review { get; set; }
        public string Category { get; set; }
        public string Brand { get; set; }



        public product(int id, string name, string type, int price, string country, string gender, string image, string review, string category, string brand)
        {
            Id = id;
            Name = name;
            Type = type;
            Price = price;
            Country = country;
            Gender = gender;
            Image = image;
            Review = review;
            Category = category;
            Brand = brand;
        }

        public product(string name, string type, int price, string country, string gender, string image, string review, string category, string brand)
        {
            Name = name;
            Type = type;
            Price = price;
            Country = country;
            Gender = gender;
            Image = image;
            Review = review;
            Category = category;
            Brand = brand;
        }

    }
}