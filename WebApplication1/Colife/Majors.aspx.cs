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
    public partial class Majors : System.Web.UI.Page
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
                string sqlQuery = "Select * from Academics";
                sqlConn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    cbList.DataSource = ds;
                    cbList.DataTextField = "MajorName";
                    cbList.DataValueField = "majorID";
                    cbList.DataBind();
                }
                sqlConn.Close();

            }
        }

        protected void btn_Search(object sender, EventArgs e)
        {
            List<string> valueList = new List<string>();
            List<string> sqlQuery = new List<string>();
            string temp="";

            foreach (ListItem item in cbList.Items)
            {
                if(item.Selected)
                {
                    valueList.Add(item.Value);
                }
            }
            
            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            SqlCommand command = new SqlCommand();
            command.Connection = sqlConn;
            command.CommandType = CommandType.Text;

         
            if(valueList.Count!=0)
            {
                temp = "Select * from College where majorID IN (";

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
                sqlConn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(temp, sqlConn);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                string[] distinct = { "CollegeName", "CityName", "StateCode", "NumberOfStudents", "Type", "Surroundings", "SATMin", "SATMax", "AcceptanceRate", "Tuiton", "Photo", "URL" };
                DataTable dtDistinct = DistinctTables(ds.Tables[0], distinct);
                collegeResults.DataSource = dtDistinct;
                collegeResults.DataBind();

            }
            else
            {
                lblError.Text = "Please Select one of the fields above";
            }





        }
        protected static DataTable DistinctTables(DataTable dt, string[] columns)
        {
            DataTable dtUnique = new DataTable();
            dtUnique = dt.DefaultView.ToTable(true, columns);
            return dtUnique;
        }
    }
}