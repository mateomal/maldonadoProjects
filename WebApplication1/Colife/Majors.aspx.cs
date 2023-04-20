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

          
            string sqlQuery = "Select * from College where majorID IN (";

            string last = valueList.Last();
            foreach (string majorString in valueList)
            {
                if(majorString!=last)
                {
                    sqlQuery += "'"+majorString + "' , ";
                }
                else
                {
                    sqlQuery += "'"+majorString + "')";
                }               
            }
            sqlConn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
            DataSet ds = new DataSet();
            sda.Fill(ds);


            collegeTable.DataSource = ds;
            collegeTable.DataBind();

            
        }
    }
}