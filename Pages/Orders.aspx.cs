using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (txtOpenOrders1.Text != "" && txtOpenOrders2.Text != "")
            GenerateOrders(txtOpenOrders1.Text, txtOpenOrders2.Text, false);
    }

    private void GenerateOrders(string beginDate, string endDate, bool shipped)
    {
        //для того формата даты, который юзается в БД, например "en-us" - Америка
        DateTimeFormatInfo info = new CultureInfo("en-uk", false).DateTimeFormat;
        StringBuilder sb = new StringBuilder();

        DateTime date1 = DateTime.Parse(beginDate);
        DateTime date2 = DateTime.Parse(endDate);

        //получить дату и конвертировать в нужный формат
        //DateTime date1 = Convert.ToDateTime(beginDate, info);
        //DateTime date2 = Convert.ToDateTime(endDate, info);
        DateTime incrementalDate = date1;
        

        while (incrementalDate <= date2)
        {
            sb.Append(string.Format("Orders for {0} {1} <br />", info.GetMonthName(incrementalDate.Month), incrementalDate.Year));

            ArrayList orderList = ConnectionClass.GetGroupedOrders(incrementalDate, date2, shipped);

            if(orderList.Count > 0)
            {
                sb.Append(@"<table class='orderTable'>
                                <tr><th>Date</th><th>Client</th><th>Total</th></tr>");

                foreach (GroupedOrder groupedOrder in orderList)
                {
                    sb.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>$ {2}</td><td>{3}</td></tr>",
                                            groupedOrder.Date, groupedOrder.Client, groupedOrder.Total,
                                            string.Format("<a href='OrdersDetails.aspx?client={0}&date={1}'>View Detail</a>", groupedOrder.Client, groupedOrder.Date)));
                }
                sb.Append("</table>");
            }
            else
            {
                sb.Append("no orders for this month <br /> <br />");
            }

            incrementalDate = incrementalDate.AddMonths(1);
            incrementalDate = new DateTime(incrementalDate.Year, incrementalDate.Month, 1);

        }

        if (shipped == false)
            lblOpenOrders.Text = sb.ToString();
        else
        {
            //TODO: Closed orders
        }
    }
}