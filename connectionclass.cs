using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace dbms
{
    public static class connectionclass
    {

        private static SqlConnection con;
        private static SqlCommand cmd;

        static connectionclass()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["tennisConnectionString"].ToString();
            con = new SqlConnection(connectionString);
            cmd = new SqlCommand("", con);
        }


        public static System.Collections.ArrayList GetCoffeeByType(string tennistype)
        {
            ArrayList list = new ArrayList();
            string query = string.Format("SELECT * FROM tennis WHERE type LIKE '{0}'", tennistype);

            try
            {
                con.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string name = reader.GetString(1);
                    string type = reader.GetString(2);
                    double price = reader.GetDouble(3);
                    string power = reader.GetString(4);
                    string country = reader.GetString(5);
                    string image = reader.GetString(6);
                    string review = reader.GetString(7);

                    tennis tns = new tennis(id, name, type, price, power, country, image, review);
                    list.Add(tns);
                }
            }
            finally
            {
                con.Close();
            }

            return list;
        }


        public static ArrayList getproducts(string pbrand, string pgender, string pcategory)
        {
            ArrayList list = new ArrayList();
            if (pbrand == "%" && pcategory == "%" && pgender == "%")
            {
                cmd.CommandText = string.Format("SELECT * FROM products ");
            }
            else if( pgender=="any")
            {
                cmd.CommandText= "SELECT * FROM products WHERE brand='" + pbrand + "' AND category='" + pcategory + "'";
            }
            else
            {
                cmd.CommandText = "SELECT * FROM products WHERE brand='" + pbrand + "' AND gender='" + pgender + "' AND category='" + pcategory + "'";
            }
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string name = reader.GetString(1);
                    string type = reader.GetString(2);
                    int price = reader.GetInt32(3);
                    string country = reader.GetString(4);
                    string gender = reader.GetString(5);
                    string image = reader.GetString(6);
                    string review = reader.GetString(7);
                    string category = reader.GetString(8);
                    string brand = reader.GetString(9);

                    product prd = new product(id, name, type, price, country, gender, image, review, category, brand);
                    list.Add(prd);
                }
            }
            finally
            {
                con.Close();
            }

            return list;
        }

        
        public static void addproduct(product prd)
        {
            string query = string.Format(
                @"INSERT INTO products VALUES ('{0}', '{1}', @prices, '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')",
                prd.Name, prd.Type, prd.Country, prd.Gender, prd.Image, prd.Review, prd.Category, prd.Brand);
            cmd.CommandText = query;
            cmd.Parameters.Add(new SqlParameter("@prices", prd.Price));
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
                cmd.Parameters.Clear();
            }
        }


        public static user LoginUser(string name, string password)
        {
            string query = string.Format("SELECT COUNT(*) FROM CoffeeDB.dbo.users WHERE name = '{0}'", name);
            cmd.CommandText = query;

            try
            {
                con.Open();
                int users = (int)cmd.ExecuteScalar();

                if (users == 1)
                {
                    query = string.Format("SELECT password FROM users WHERE name = '{0}'", name);
                    cmd.CommandText = query;
                    string dbPassword = cmd.ExecuteScalar().ToString();

                    if (dbPassword == password)
                    { 
                        query = string.Format("SELECT email, user_type FROM users WHERE name = '{0}'", name);
                        cmd.CommandText = query;

                        SqlDataReader reader = cmd.ExecuteReader();
                        user usr = null;

                        while (reader.Read())
                        {
                            string email = reader.GetString(0);
                            string type = reader.GetString(1);

                            usr = new user(name, password, email, type);
                        }
                        return usr;
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    return null;
                }
            }
            finally
            {
                con.Close();
            }
        }


        public static string RegisterUser(user usr)
        {
            string query = string.Format("SELECT COUNT(*) FROM users WHERE name = '{0}'", usr.Name);
            cmd.CommandText = query;

            try
            {
                con.Open();
                int users = (int)cmd.ExecuteScalar();

                if (users < 1)
                {
                    query = string.Format("INSERT INTO users VALUES ('{0}', '{1}', '{2}', '{3}')", usr.Name, usr.Password,
                                          usr.Email, usr.Type);
                    cmd.CommandText = query;
                    cmd.ExecuteNonQuery();
                    return "User registered!";
                }
                else
                { 
                    return "A user with this name already exists";
                }
            }
            finally
            {
                con.Close();
            }
        }


        public static void AddOrders(ArrayList orders)
        {
            try
            {
                cmd.CommandText = "INSERT INTO orders VALUES (@client, @product, @amount, @price, @date, @orderSent)";
                con.Open();

                foreach (order odr in orders)
                {
                    cmd.Parameters.Add(new SqlParameter("@client", odr.Client));
                    cmd.Parameters.Add(new SqlParameter("@product", odr.Product));
                    cmd.Parameters.Add(new SqlParameter("@amount", odr.Amount));
                    cmd.Parameters.Add(new SqlParameter("@price", odr.Price));
                    cmd.Parameters.Add(new SqlParameter("@date", odr.Date));
                    cmd.Parameters.Add(new SqlParameter("@orderSent", odr.OrderShipped));

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
            finally
            {
                con.Close();
            }
        }


        public static tennis GetCoffeeById(int id)
        {
            string query = String.Format("SELECT * FROM tennis WHERE id =  '{0}'", id);
            tennis tns = null;

            try
            {
                con.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string name = reader.GetString(1);
                    string type = reader.GetString(2);
                    double price = reader.GetDouble(3);
                    string power = reader.GetString(4);
                    string country = reader.GetString(5);
                    string image = reader.GetString(6);
                    string review = reader.GetString(7);

                    tns = new tennis(name, type, price, power, country, image, review);
                }
            }
            finally
            {
                con.Close();
            }

            return tns;
        }




        public static product GetProductById(int id)
        {
            string query = String.Format("SELECT * FROM products WHERE id =  '{0}'", id);
            product prd= null;

            try
            {
                con.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string name = reader.GetString(1);
                    string type = reader.GetString(2);
                    int price = reader.GetInt32(3);
                    string country = reader.GetString(4);
                    string gender = reader.GetString(5);
                    string image = reader.GetString(6);
                    string review = reader.GetString(7);
                    string category = reader.GetString(8);
                    string brand = reader.GetString(9);

                    prd = new product(name, type, price, country, gender, image, review, category, brand);
                }
            }
            finally
            {
                con.Close();
            }

            return prd;
        }


        public static ArrayList GetGroupedOrders(DateTime currentDate, DateTime endDate, Boolean shipped)
        {
            const string query = @"SELECT client, date, SUM(total) as total
                                FROM (
	                                    SELECT client, date, (amount * price) AS total
	                                    FROM [CoffeeDB].[dbo].[orders]
	                                    WHERE date >= @date1
	                                    AND date <= @date2
                                        AND orderShipped = @shipped
                                )as result
                                GROUP BY client, date";
            ArrayList orderList = new ArrayList();
            int lastDay;

            if (currentDate.Month == endDate.Month && currentDate.Year == endDate.Year)
            {
                lastDay = endDate.Day;
            }
            else
            {
                lastDay = DateTime.DaysInMonth(currentDate.Year, currentDate.Month);
            }

            DateTime date2 = new DateTime(currentDate.Year, currentDate.Month, lastDay);

            try
            {
                con.Open();
                cmd.CommandText = query;
                cmd.Parameters.Add(new SqlParameter("@date1", currentDate));
                cmd.Parameters.Add(new SqlParameter("@date2", date2));
                cmd.Parameters.Add(new SqlParameter("@shipped", shipped));
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string client = reader.GetString(0);
                    DateTime date = reader.GetDateTime(1);
                    double total = reader.GetDouble(2);

                    groupedorder grpodr = new groupedorder(client, date, total);
                    orderList.Add(grpodr);
                }
            }
            catch (SqlException ex)
            {
               // MessageBox.Show(ex.ToString());
            }
            finally
            {
                con.Close();
                cmd.Parameters.Clear();
            }

            return orderList;
        }


        public static user GetUserDetails(string userName)
        {
            string query = string.Format("SELECT * FROM users WHERE name = '{0}'", userName);
            cmd.CommandText = query;
            user usr = null;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string name = reader.GetString(1);
                    string password = reader.GetString(2);
                    string email = reader.GetString(3);
                    string userType = reader.GetString(4);

                    usr = new user(id, name, password, email, userType);
                }
            }
            catch (Exception ex)
            { 
               // this.RegisterClientScriptBlock(typeof(string), "key", string.Format("alert('{0}');", ex.Message), true);
            }
            finally
            {
                con.Close();
            }
            return usr;
        }



        public static ArrayList GetDetailedOrders(string client, DateTime date)
        {
            const string query = @" SELECT id, product, amount, price, orderShipped
                                FROM orders WHERE client = @client AND date = @date";
            ArrayList orderList = new ArrayList();

            try
            {
                con.Open();
                cmd.CommandText = query;
                cmd.Parameters.Add(new SqlParameter("@client", client));
                cmd.Parameters.Add(new SqlParameter("@date", date));
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string product = reader.GetString(1);
                    int amount = reader.GetInt32(2);
                    double price = reader.GetDouble(3);
                    bool orderShipped = reader.GetBoolean(4);

                    order odr = new order(id, client, product, amount, price, date, orderShipped);
                    orderList.Add(odr);
                }
            }
            catch (SqlException ex)
            {
               
              //  MessageBox.Show(ex.ToString());
            }
            finally
            {
                con.Close();
                cmd.Parameters.Clear();
            }
            return orderList;
        }



        public static void UpdateOrders(string client, DateTime date)
        {
            string query = string.Format(@"UPDATE [CoffeeDB].[dbo].[orders]
                                       SET orderShipped = 1
                                       WHERE client = @client
                                       AND date = @date");
            try
            {
                con.Open();
                cmd.CommandText = query;
                cmd.Parameters.Add(new SqlParameter("@client", client));
                cmd.Parameters.Add(new SqlParameter("@date", date));
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
               // MessageBox.Show(ex.ToString());
            }
            finally
            {
                con.Close();
                cmd.Parameters.Clear();
            }
        }

    }
}