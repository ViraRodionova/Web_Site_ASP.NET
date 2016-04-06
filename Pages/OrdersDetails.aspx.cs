using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_OrdersDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblTitle.Text = string.Format("<h2> Client: {0} <br /> Date: {1}</h2>",
                                        Request.QueryString["client"], Request.QueryString["date"]);
    }

    protected void btnShip_Click(object sender, EventArgs e)
    {

    }
}