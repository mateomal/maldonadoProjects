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
}