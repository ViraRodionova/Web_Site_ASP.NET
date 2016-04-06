using System;
using System.Collections;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Coffee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }

    private void FillPage()
    {
        string val = DropDownList1.SelectedValue;

        ArrayList coffeeList = ConnectionClass.GetCoffeByType(DropDownList1.SelectedValue);
        StringBuilder sb = new StringBuilder();

        foreach (_Coffee coffee in coffeeList)
        {
            sb.Append(string.Format(@"<table class='coffeeTable'>
            <tr>
                <th rowspan='6' width='150px'><img runat='server' src='{6}'</th>
                <th width='50px'>Name:</th>
                <td>{0}<td>
            </tr>
            <tr>
                <th>Type:</th>
                <td>{1}<td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>{2}<td>
            </tr>
            <tr>
                <th>Roast:</th>
                <td>{3}<td>
            </tr>
            <tr>
                <th>Origin:</th>
                <td>{4}<td>
            </tr>
            <tr>
                <td colspan='2'>{5}<td>
            </tr>
            </table>",
             
                coffee.Name, coffee.Type, coffee.Price, coffee.Roast, coffee.Country, coffee.Review, coffee.Image));
        }
        lblOutput.Text = sb.ToString();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillPage();
    }
}