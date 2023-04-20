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
            List<string> scholarshipList = new List<string>();
            string sqlQuery = "";


            foreach (ListItem item in cbList.Items)
            {
                if (item.Selected)
                {
                    scholarshipList.Add(item.Value);
                }

            }

            if (scholarshipList.Count != 0)
            {

                sqlQuery = "Select * from College where ScholarshipName IN (";
                string last = scholarshipList.Last();
                foreach (string majorString in scholarshipList)
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


                //}

                //string result = budgetRange.ToString();


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
}