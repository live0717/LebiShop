﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.order.shipping_view_window" validateRequest="false"%>

<table class="datalist">
    <tr class="title">
        <th>
            <%=Tag("产品")%>
        </th>
        <th style="width: 80px">
            <%=Tag("发货数量")%>
        </th>
    </tr>
    <%foreach (Shop.Model.TransportProduct tp in tps)
      { %>
    <tr class="list">
        <td >
            <img src="<%=Image(tp.ImageOriginal,50,50)%>" style="width: 30px" />
            <%=Shop.Bussiness.Language.Content(tp.Product_Name, CurrentLanguage)%>
        </td>
        <td>
            <%=tp.Count%>
        </td>
    </tr>
    <%} %>
</table>
<table class="table">
    <tr>
        <th style="width: 15%">
            <%=Tag("配送方式")%>：
        </th>
        <td>
            <select Shipping="true" name="Transport_id" id="Transport_id">
                <%=Shop.Bussiness.EX_Area.TransportOption(torder.Transport_id) %>
            </select>
        </td>
    </tr>
    
    <tr>
        <th>
            <%=Tag("货运单号")%>：
        </th>
        <td>
            <input type="text" Shipping="true" min="notnull" id="Code" name="Code" class="input" value="<%=torder.Code %>" style="width: 300px;" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("收货人")%>：
        </th>
        <td>
            <%=torder.T_Name %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("电话")%>：
        </th>
        <td>
            <%=torder.T_Phone %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("手机")%>：
        </th>
        <td>
            <%=torder.T_MobilePhone %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("EMAIL")%>：
        </th>
        <td>
            <%=torder.T_Email %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("地址")%>：
        </th>
        <td>
            <%=torder.T_Address %>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="Shipping();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function Shipping() {
        if (!CheckForm("Shipping", "span"))
            return false;
        var postData = GetFormJsonData("Shipping");
        var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Order_Shipping_Edit&id=<%=model.id %>&tid=<%=torder.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
</script>

  