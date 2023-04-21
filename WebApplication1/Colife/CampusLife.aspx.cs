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
                

                string sqlQuery2 = "Select Distinct SportName from Sports";
                
                SqlDataAdapter sda2 = new SqlDataAdapter(sqlQuery2, sqlConn);
                DataSet ds2 = new DataSet();
                sda2.Fill(ds2);

                if (ds2.Tables[0].Rows.Count != 0)
                {
                    cbSports.DataSource = ds2;
                    cbSports.DataTextField = "SportName";
                    cbSports.DataValueField = "SportName";
                    cbSports.DataBind();
                }

                string sqlQuery3 = "Select * from NumberStudents";

                SqlDataAdapter sda3 = new SqlDataAdapter(sqlQuery3, sqlConn);
                DataSet ds3 = new DataSet();
                sda3.Fill(ds3);

                if (ds3.Tables[0].Rows.Count != 0)
                {
                    numberStudents.DataSource = ds3;
                    numberStudents.DataTextField = "Size";
                    numberStudents.DataValueField = "NumberOfStudentsMin";
                    numberStudents.DataBind();
                }
                sqlConn.Close();



            }
           

        }

        protected void btn_SearchClick(object sender, EventArgs e)
        {
            List<string> numberList = new List<string>();
            List<string> sqlQuery = new List<string>();
            string temp;

            foreach (ListItem item in numberStudents.Items)
            {
                if (item.Selected)
                {                
                    sqlQuery.Add("Select * from College where NumberOfStudents Between "+item.Value+" And (Select NumberOfStudentsMax from NumberStudents where NumberOfStudentsMin="+item.Value+")");
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


            if (valueList.Count != 0)
            {
                temp = "Select * from College where clubID IN (";
                string last = valueList.Last();
                foreach (string majorString in valueList)
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


            List<string> sportList = new List<string>();
            string sportTemp;


            foreach (ListItem item in cbSports.Items)
            {
                if (item.Selected)
                {
                    sportList.Add(item.Value);
                }
            }


            if (sportList.Count != 0)
            {
                sportTemp = "Select * from College where SportName IN (";
                string last = sportList.Last();
                foreach (string majorString in sportList)
                {
                    if (majorString != last)
                    {
                        sportTemp += "'" + majorString + "' , ";
                    }
                    else
                    {
                        sportTemp += "'" + majorString + "')";
                    }
                }

                sqlQuery.Add(sportTemp);

            }

            List<string> valueSurroundings = new List<string>();

            foreach (ListItem item in surroundingsList.Items)
            {
                if (item.Selected)
                {
                    valueSurroundings.Add(item.Value);
                }
            }

            string temp2;

            if (valueSurroundings.Count != 0)
            {
                temp2 = "Select * from College where Surroundings IN (";

                string last = valueSurroundings.Last();

                foreach (string majorString in valueSurroundings)
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


        }
    }
}