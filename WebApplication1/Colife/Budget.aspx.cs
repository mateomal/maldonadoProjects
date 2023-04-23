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
    public partial class Budget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                SqlConnection sqlConn = new SqlConnection(mainConnection);
                SqlCommand command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                string sqlQuery = "Select * from Scholarships";
                sqlConn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    cbList.DataSource = ds;
                    cbList.DataTextField = "ScholarshipName";
                    cbList.DataValueField = "ScholarshipName";
                    cbList.DataBind();
                }
                sqlConn.Close();

            }
        }


        protected void btn_SearchClick(object sender, EventArgs e)
        {

            string val = valueField.Value;

            List<string> sqlQuery =new List<string>();
            string temp;

            List<string> ranges = val.Split('-').ToList();


            if(ranges.Count!=0)
            {
                sqlQuery.Add("Select * from College where Tuiton Between " + ranges.First() +"and"+ ranges.Last());
            }

          
            List<string> scholarshipList = new List<string>();
            

            foreach (ListItem item in cbList.Items)
            {
                if (item.Selected)
                {
                    scholarshipList.Add(item.Value);
                }

            }

            if (scholarshipList.Count != 0)
            {

                temp = "Select * from College where ScholarshipName IN (";
                string last = scholarshipList.Last();
                foreach (string majorString in scholarshipList)
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

            string finalQuery="";
            string lastofQuery = sqlQuery.Last();

            if(sqlQuery.Count>=2)
            {
                foreach (string item in sqlQuery)
                {
                    if (item != lastofQuery)
                    {
                        finalQuery += item + " Intersect ";
                    }
                    else
                    {
                        finalQuery += item ;
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
        }
    }
}