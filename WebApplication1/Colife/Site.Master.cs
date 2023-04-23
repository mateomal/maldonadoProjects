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
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string finalQuery;

            finalQuery = "Insert into Users(firstName,lastName,Password,Email,Address, CityName, StateCode) VALUES ('" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtPassword.Text + "','" + txtEmail.Text + "','" + txtAddress.Text + "','" + txtCity.Text + "','" + stateList.SelectedValue + "')";
            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            SqlCommand command = new SqlCommand();
            command.Connection = sqlConn;
            command.CommandType = CommandType.Text;
            sqlConn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(finalQuery, sqlConn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
          
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string finalQuery;
            finalQuery = "Select Count(1) from Users where Email='" + txtEmailLog.Text + "' and Password='" + txtPasswordLog.Text + "'";

            string mainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(mainConnection);
            SqlCommand command = new SqlCommand(finalQuery,sqlConn);
            command.Connection = sqlConn;
            command.CommandType = CommandType.Text;
            sqlConn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(finalQuery, sqlConn);
            int count = Convert.ToInt32(command.ExecuteScalar());
            if(count==1)
            {
                Session["Email"] = txtEmail.Text.Trim();
                Response.Redirect("Users.aspx");
            }
            else
            {
                lblError.Visible = true;
            }
             

            DataSet ds = new DataSet();
            sda.Fill(ds);

        }

    }
}