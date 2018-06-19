﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_sales_window" validateRequest="false"%>

<table class="datalist">
    <tr class="title">
        <th style="width: 150px">
            <%=Tag("订购日期")%>
        </th>
        <th style="width: 120px">
            <%=Tag("订单编号")%>
        </th>
        <th style="width: 120px">
            <%=Tag("商品编号")%>
        </th>
        <th style="width: 80px">
            <%=Tag("订购数量")%>
        </th>
        <th style="width: 80px">
            <%=Tag("已发数量")%>
        </th>
        <th style="width: 100px">
            <%=Tag("单价")%>
        </th>
        <th style="width: 100px">
            <%=Tag("小计")%>
        </th>
    </tr>
    <%
        int count = 0; int count_shipped = 0; decimal price = 0; decimal money = 0;
        foreach (Shop.Model.Lebi_Order_Product pro in pros){
        count = count + pro.Count;
        count_shipped = count_shipped + pro.Count_Shipped;
        price = price + pro.Price;
        money = money + pro.Money;
    %>
    <tr class="list">
        <td >
            <%=pro.Time_Add%>
        </td>
        <td>
            <%=pro.Order_Code%>
        </td>
        <td>
            <%=pro.Product_Number%>
        </td>
        <td>
            <%=pro.Count%>
        </td>
        <td>
            <%=pro.Count_Shipped%>
        </td>
        <td>
            <%=FormatMoney(pro.Price)%>
        </td>
        <td>
            <%=FormatMoney(pro.Money)%>
        </td>
    </tr>
    <%} %>
    <tr class="list">
        <td>
            <%=Tag("合计")%>
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <strong><%=count%></strong>
        </td>
        <td>
            <strong><%=count_shipped%></strong>
        </td>
        <td>
            <strong><%=FormatMoney(price)%></strong>
        </td>
        <td>
            <strong><%=FormatMoney(money)%></strong>
        </td>
    </tr>
</table>

  