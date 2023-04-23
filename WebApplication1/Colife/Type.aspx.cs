using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Colife
{
    public partial class Type : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Search(object sender, EventArgs e)
        {

            List<string> sqlQuery = new List<string>();
            string temp;

            List<string> type = new List<string>();

            foreach(ListItem item in educationList.Items)
            {
                if(item.Selected)
                {
                    type.Add(item.Value);
                }
                
            }

            temp = "Select * from College where Education IN (";

            if (type.Count != 0)
            {         
                string last = type.Last();
                foreach (string majorString in type)
                {
                    if (majorString != last)
                    {
                        temp += "'" + majorString + "' , ";
                    }
                    else
                    {
                        temp += "'" + majorString + "')";
                    }
                }
                sqlQuery.Add(temp);
            }
          

            List<string> time = new List<string>();
            string temp2;

            foreach (ListItem item in typeList.Items)
            {
                if(item.Selected)
                {
                    time.Add(item.Value);
                }
                
            }

            temp2 = "Select * from College where Type IN (";

            if (time.Count != 0)
            {
                string last = time.Last();
                foreach (string majorString in time)
                {
                    if (majorString != last)
                    {
                        temp2 += "'" + majorString + "' , ";
                    }
                    else
                    {
                        temp2 += "'" + majorString + "')";
                    }
                }

                sqlQuery.Add(temp2);
            }

            string finalQuery = "";
            string lastofQuery = sqlQuery.Last();

            if (sqlQuery.Count >= 2)
            {
                foreach (string item in sqlQuery)
                {
                    if (item != lastofQuery)
                    {
                        finalQuery += item + " Intersect ";
                    }
                    else
                    {
                        finalQuery += item;
                    }
                }
            }
            else
            {
                finalQuery = sqlQuery.First();
            }


            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            SqlCommand command = new SqlCommand();
            command.Connection = sqlConn;
            command.CommandType = CommandType.Text;
            sqlConn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(finalQuery, sqlConn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            collegeResults.DataSource = ds;
            collegeResults.DataBind();
            sqlConn.Close();


        }
    }
}