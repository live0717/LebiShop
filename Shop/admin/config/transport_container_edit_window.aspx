﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.Transport_Container_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("货柜名称")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" min="notnull" id="Name" name="Name" class="input" style="width: 200px;" value="<%=model.Name %>" />
        </td>
    </tr>
    <tr>
        <th style="width: 20%;">
            <%=Tag("体积")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" id="Volume" name="Volume" class="input" style="width: 70px;" value="<%=model.Volume %>" /> <%=Tag("立方米")%>
        </td>
    </tr>
    <tr>
        <th style="width: 20%;">
            <%=Tag("重量")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" id="Weight" name="Weight" class="input" style="width: 70px;" value="<%=model.Weight %>" /> <%=Tag("吨")%>
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("货柜描述")%>：
        </th>
        <td>
            <textarea name="Description" id="Description" class="input" shop="true" style="width: 300px;height: 60px;"><%=model.Description%></textarea>
            <div class="tools clear">
                <ul>
                    <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Description',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                    <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Description',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=Transport_Container_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  