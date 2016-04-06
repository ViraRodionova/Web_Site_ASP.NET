using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Shop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateControls();
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        Authenticate();
        GenerateReview();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        Authenticate();
        SendOrder();

        lblResult.Text = "Your order has been placed, thank you for shopping at our store";
        btnOK.Visible = false;
        btnCancel.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session["orders"] = null;
        btnOK.Visible = false;
        btnCancel.Visible = false;
        lblResult.Visible = false;
    }

    private void GenerateControls()
    {
        //Get all coffeeObjects from database
        ArrayList coffeeList = ConnectionClass.GetCoffeByType("%");

        foreach (_Coffee coffee in coffeeList)
        {
            //Create Controls
            Panel coffeePanel = new Panel();
            Image image = new Image { ImageUrl = coffee.Image, CssClass = "ProductsImage" };
            Literal literal = new Literal { Text = "<br />" };
            Literal literal2 = new Literal { Text = "<br />" };
            Label lblName = new Label { Text = coffee.Name, CssClass = "ProductsName" };
            Label lblPrice = new Label
            {
                Text = String.Format("{0:0.00}", coffee.Price + "<br />"),
                CssClass = "ProductsPrice"
            };
            TextBox textBox = new TextBox
            {
                ID = coffee.Id.ToString(),
                CssClass = "ProductsTextBox",
                Width = 60,
                Text = "0"
            };

            //Add validation so only numbers can be entered into the textfields
            RegularExpressionValidator regex = new RegularExpressionValidator
            {
                ValidationExpression = "^[0-9]*",
                ControlToValidate = textBox.ID,
                ErrorMessage = "Please enter a number."
            };

            //Add controls to Panels
            coffeePanel.Controls.Add(image);
            coffeePanel.Controls.Add(literal);
            coffeePanel.Controls.Add(lblName);
            coffeePanel.Controls.Add(literal2);
            coffeePanel.Controls.Add(lblPrice);
            coffeePanel.Controls.Add(textBox);
            coffeePanel.Controls.Add(regex);

            pnlProducts.Controls.Add(coffeePanel);
        }
    }

    private ArrayList GetOrders()
    {
        ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
        ControlFinder<TextBox> cf = new ControlFinder<TextBox>();
        cf.FindControlsRecursive(cph);

        var textBoxList = cf.FoundControls;

        ArrayList orderList = new ArrayList();

        foreach(TextBox textBox in textBoxList)
        {
            if(textBox.Text != "")
            {
                int amountOfOrders = Convert.ToInt32(textBox.Text);

                if(amountOfOrders > 0)
                {
                    _Coffee coffee = ConnectionClass.GetCoffeById(Convert.ToInt32(textBox.ID));
                    Order order = new Order(
                        Session["login"].ToString(), coffee.Name, amountOfOrders, coffee.Price, DateTime.Now, false);
                    orderList.Add(order);
                }
            }
        }
        return orderList;
    }

    private void GenerateReview()
    {
        double totalAmount = 0;
        ArrayList orderList = GetOrders();
        Session["orders"] = orderList;

        StringBuilder sb = new StringBuilder();
        sb.Append("<table>");
        sb.Append("<h3>Please review your order</h3>");

        foreach(Order order in orderList)
        {
            double totalRow = order.Price * order.Amount;
            sb.Append(String.Format(@"<tr>
                                        <td width = '50px'>{0}</td>
                                        <td width = '200px'>{1} ({2})</td>
                                        <td>{3}</td><td>$</td>
                                    </tr>", 
                                    order.Amount, order.Product, order.Price, String.Format("{0:0.00}", totalRow)));
            totalAmount += totalRow;
        }

        sb.Append(String.Format(@"<tr>
                                    <td><b>Total: </b></td>
                                    <td><b>{0} $</b></td>
                                </tr></table>", totalAmount));

        lblResult.Text = sb.ToString();
        lblResult.Visible = true;
        btnOK.Visible = true;
        btnCancel.Visible = true;
    }

    private void SendOrder()
    {
        ArrayList orderList = (ArrayList)Session["orders"];
        ConnectionClass.AddOrders(orderList);
        Session["orders"] = null;
    }

    private void Authenticate()
    {
        if(Session["login"] == null)
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
    }
}