using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Colife
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdmissions_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admissions.aspx");
        }

        protected void btnCities_Click(object sender, EventArgs e)
        {
            Response.Redirect("Location.aspx");
        }

        protected void btnAcademics_Click(object sender, EventArgs e)
        {
            Response.Redirect("Majors.aspx");
        }

        protected void btnType_Click(object sender, EventArgs e)
        {
            Response.Redirect("Type.aspx");
        }
        protected void btnCampusLife_Click(object sender, EventArgs e)
        {
            Response.Redirect("CampusLife.aspx");
        }
        protected void btnBudget_Click(object sender, EventArgs e)
        {
            Response.Redirect("Budget.aspx");
        }

    }
}