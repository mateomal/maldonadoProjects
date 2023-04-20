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
    public partial class CampusLife : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                SqlConnection sqlConn = new SqlConnection(mainConnection);


                SqlCommand command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                string sqlQuery = "Select * from StudentClubs";
                sqlConn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    cbList.DataSource = ds;
                    cbList.DataTextField = "ClubName";
                    cbList.DataValueField = "clubID";
                    cbList.DataBind();
                }

                sqlConn.Close();
            }
          

        }

        protected void btn_SearchClick(object sender, EventArgs e)
        {
            List<int> numberList = new List<int>();

            foreach (ListItem item in numberStudents.Items)
            {
                if (item.Selected)
                {
                    numberList.Add(Int32.Parse(item.Value));
                }

            }

            string sqlQuery = "";
                            
            if (numberList.Count != 0)
            {
              
                sqlQuery = "Select * from College where NumberOfStudents IN (";
                int last = numberList.Last();
                foreach (int majorString in numberList)
                {
                    if (majorString != last)
                    {
                        sqlQuery += "'" + majorString + "' , ";
                    }
                    else
                    {
                        sqlQuery += "'" + majorString + "')";
                    }
                }
                

            }

            List<string> valueList = new List<string>();

            foreach (ListItem item in cbList.Items)
            {
                if (item.Selected)
                {
                    valueList.Add(item.Value);
                }
            }

         
            if (valueList.Count!=0)
            {
                sqlQuery = "Select * from College where clubID IN (";
                string last = valueList.Last();
                foreach (string majorString in valueList)
                {
                    if (majorString != last)
                    {
                        sqlQuery += "'" + majorString + "' , ";
                    }
                    else
                    {
                        sqlQuery += "'" + majorString + "')";
                    }
                }
                
                
            }

            List<string> valueSurroundings = new List<string>();

            foreach (ListItem item in surroundingsList.Items)
            {
                if (item.Selected)
                {
                    valueSurroundings.Add(item.Value);
                }
            }


            if (valueSurroundings.Count != 0)
            {
                sqlQuery = "Select * from College where Surroundings IN (";

                string last = valueSurroundings.Last();

                foreach (string majorString in valueSurroundings)
                {
                    if (majorString != last)
                    {
                        sqlQuery += "'" + majorString + "' , ";
                    }
                    else
                    {
                        sqlQuery += "'" + majorString + "')";
                    }
                }


            }




            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            SqlCommand command = new SqlCommand();
            command.Connection = sqlConn;
            command.CommandType = CommandType.Text;
            sqlConn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            collegeTable.DataSource = ds;
            collegeTable.DataBind();








        }
    }
}