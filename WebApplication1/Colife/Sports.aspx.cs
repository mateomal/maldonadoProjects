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
                string sqlQuery = "Select * from Sports";
                sqlConn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                DataTable dt = ds.Tables[0];


                if (ds.Tables[0].Rows.Count != 0)
                {

                    var queryDiv = dt.AsEnumerable().Select(a => a.Field<string>("Division").ToString()).Distinct();
                    cbDivision.DataSource = queryDiv;
                    cbDivision.DataBind();

                    var queryConf = dt.AsEnumerable().Select(a => a.Field<string>("Conference").ToString()).Distinct();
                    cbConferences.DataSource = queryConf;
                    cbConferences.DataBind();

                    var querySport = dt.AsEnumerable().Select(a => a.Field<string>("SportName").ToString()).Distinct();
                    cbList.DataSource = querySport;
                    cbList.DataBind();

                }
                sqlConn.Close();
            }



        }

        protected void btn_Search(object sender, EventArgs e)
        {
            List<string> sportsList = new List<string>();

            foreach (ListItem item in cbList.Items)
            {
                if (item.Selected)
                {
                    sportsList.Add(item.ToString());
                }

            }

            string sqlQuery = "";

            if (sportsList.Count != 0)
            {

                sqlQuery = "Select * from College where sportsName IN (";
                string last = sportsList.Last();
                foreach (string majorString in sportsList)
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




            //List<string> conferenceList = new List<string>();

            //foreach (ListItem item in cbConferences.Items)
            //{
            //    if (item.Selected)
            //    {
            //        conferenceList.Add(item.ToString());
            //    }

            //}

    
            //if (conferenceList.Count != 0)
            //{

            //    sqlQuery = "Select * from College where sportsName IN (";
            //    string last = sportsList.Last();
            //    foreach (string majorString in sportsList)
            //    {
            //        if (majorString != last)
            //        {
            //            sqlQuery += "'" + majorString + "' , ";
            //        }
            //        else
            //        {
            //            sqlQuery += "'" + majorString + "')";
            //        }
            //    }


            //}



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