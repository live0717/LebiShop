﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.Product.product_price_list_window" validateRequest="false"%>

    <%foreach (Shop.Model.Lebi_User model in users)
    {
    Shop.Model.Lebi_Product_Price price=GetPriceInfo(model);

    %>
    <tr class="list">

        <td>
            <%=model.UserName %>&nbsp;
        </td>
        <td style="width:400px;word-wrap: break-word;">
            <%=model.RealName %>&nbsp;
        </td>
        <td>
            <%=GetlevelName(model.UserLevel_id) %>&nbsp;
        </td>
        <td>
            <input type="text" class="input" id="Price<%=model.id%>" shop="true" min="notnull" name="Price<%=model.id%>" style="width: 70px;" value="<%=FormatMoney(price.Price,"Number") %>" onkeyup="value=value.replace(/[^.\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))" />
            <input type="hidden" name="userid" value="<%=model.id%>" shop="true" />
        </td>
    </tr>
    <%} %>
    <tr class="list">
        <td colspan="4">
            <%=PageString %>
        </td>
    </tr>

  