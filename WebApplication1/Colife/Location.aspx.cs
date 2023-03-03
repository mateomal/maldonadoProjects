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
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            string sqlQuery = "Select * from States";
            SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, sqlConn);
            sqlConn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            stateSelector.DataSource = dt;
            stateSelector.DataTextField = "StateName";
            stateSelector.DataValueField = "StateName";
           
            stateSelector.DataBind();
            sqlConn.Close();

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
    }
}