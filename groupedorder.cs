using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dbms
{
    public class groupedorder
    {
        public string Client { get; set; }
        public DateTime Date { get; set; }
        public double Total { get; set; }

        public groupedorder(string client, DateTime date, double total)
        {
            Client = client;
            Date = date;
            Total = total;
        }

    }
}