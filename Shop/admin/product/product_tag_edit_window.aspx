﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_tag_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%;" class="table">
    <tr>
        <th>
            <%=Tag("商品标签")%>：
        </th>
        <td>
            <% foreach (Shop.Model.Lebi_Pro_Tag t in Shop.Bussiness.B_Lebi_Pro_Tag.GetList("", ""))
                { %>
            <label><input shop="true" type="checkbox" id="Pro_Tag_id" value="<%=t.id %>" name="Pro_Tag_id" /><%=Shop.Bussiness.Language.Content(t.Name,CurrentLanguage.Code) %></label>
            <%} %>
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("分组商品标签")%>：
        </th>
        <td>
            <input type="text" class="input" shop="true" name="Tags" id="Tags" value="" style="width: 300px;" />
            <br /><em><%=Tag("标签通过匹配商品名称来识别相关商品，多个标签用，隔开")%></em>
        </td>
    </tr>
    <tr>
        <td class="action" colspan="2">
            <div class="tools tools-m clear">
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
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Tag_Edit&ids=<%=ids %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?");});
    }
</script>

  