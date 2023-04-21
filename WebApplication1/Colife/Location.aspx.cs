using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Colife
{
    public partial class Location : System.Web.UI.Page
    {

        string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection sqlConn = new SqlConnection(mainConnection);
                string sqlQuery = "Select * from States";
                string sqlQuery2 = "Select * from City";
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                SqlDataAdapter sqlData = new SqlDataAdapter(sqlQuery2, sqlConn);
                sqlConn.Open();
                DataTable dt = new DataTable();
                sda.Fill(dt);
                stateSelector.DataSource = dt;
                stateSelector.DataTextField = "StateName";
                stateSelector.DataValueField = "StateCode";
                stateSelector.DataBind();

                DataTable dt2 = new DataTable();
                sqlData.Fill(dt2);
                citySelector.DataSource = dt2;
                citySelector.DataTextField = "CityName";
                citySelector.DataValueField = "StateCode";
                citySelector.DataBind();
                sqlConn.Close();
            }

        }

        protected void onChangeRadio(object sender, EventArgs e)
        {
            if(rbState.Checked==true)
            {
                stateSelector.Visible = true;
            }
            if (rbCity.Checked == true)
            {
                citySelector.Visible = true;
            }

        }


        protected void btn_Search(object sender, EventArgs e)
        {

            List<string> states = new List<string>();

            List<string> sqlQuery = new List<string>();
            string temp;


            foreach (ListItem item in stateSelector.Items)
            {
                if(item.Selected)
                {
                    states.Add(item.Value);
                }
            }

            temp ="Select * from College where StateCode IN (";

            if (states.Count != 0)
            {
                string last = states.Last();
                foreach (string majorString in states)
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


            List<string> cities = new List<string>();
            
            foreach (ListItem item in citySelector.Items)
            {
                if (item.Selected)
                {
                    cities.Add(item.Value);
                }
            }

            string temp2 = "Select * from College where StateCode IN (";

            if (cities.Count != 0)
            {
                string last = cities.Last();
                foreach (string majorString in cities)
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

            collegeTable.DataSource = ds;
            collegeTable.DataBind();

            sqlConn.Close();
          
        }
    }
}