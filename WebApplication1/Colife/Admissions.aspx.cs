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
    public partial class Sports : System.Web.UI.Page
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
                string sqlQuery = "Select * from Admissions ORDER BY min";
                sqlConn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                DataTable dt = ds.Tables[0];

                gridAceptance.DataSource = dt;
                gridAceptance.DataBind();

                //if (ds.Tables[0].Rows.Count != 0)
                //{
                //    var queryAcceptance = dt.AsEnumerable().Select(a => a.Field<string>("AcceptanceRate").ToString()).Distinct();
                //    cbList.DataSource = queryAcceptance;
                //    cbList.DataBind();
                //}

                sqlConn.Close();
            }



        }

        protected void btn_Search(object sender, EventArgs e)
        {
         
      
            string val = valueField.Value;


            List<string> sqlQuery = new List<string>();
            string temp;


            List<string> ranges = val.Split('-').ToList();


            if (!ranges.Contains(""))
            {
                sqlQuery.Add("Select * from College where (SATmin >= " + ranges.First() + ") and SATmax <=" + ranges.Last());
            }


            string val2 = valueField2.Value;

            

            List<string> rangesGPA = val2.Split('-').ToList();


            if (!rangesGPA.Contains(""))
            {
                sqlQuery.Add("Select * from College where (GPAMax >= " + rangesGPA.First() + ")");
            }


            List<string> ls = new List<string>();

            foreach(GridViewRow gridViewRow in gridAceptance.Rows)
            {
                var checkbox = gridViewRow.FindControl("Checkbox1") as CheckBox;
                if(checkbox.Checked)
                {
                    var lblAceptance = gridViewRow.FindControl("Label1") as Label;
                    ls.Add(lblAceptance.Text);
                    
                }
            }



            temp = "Select * from College where AcceptanceRate IN (";


            if(ls.Count!=0)
            {
                string last = ls.Last();
                foreach (string majorString in ls)
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