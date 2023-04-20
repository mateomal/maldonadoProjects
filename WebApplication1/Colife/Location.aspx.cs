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
                SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
                sqlConn.Open();
                DataTable dt = new DataTable();
                sda.Fill(dt);
                stateSelector.DataSource = dt;
                stateSelector.DataTextField = "StateName";
                stateSelector.DataValueField = "StateCode";
                stateSelector.DataBind();
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

            List<int> states = new List<int>();
            string sqlQuery = "";


            if(stateSelector.Multiple)
            {
                states.Add(stateSelector.SelectedIndex);
            }
            else
            {
                states.Add(stateSelector.SelectedIndex);
            }



            //foreach(int item in stateSelector.)
            //{
            //    states.Add(item.ToString());
            //}

            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            SqlCommand command = new SqlCommand();
            command.Connection = sqlConn;
            command.CommandType = CommandType.Text;


            if(states.Count!=0)
            {
                foreach(int item in states)
                {
                    sqlQuery = "Select * from College where stateID='" + item + "'" ;
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