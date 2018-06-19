﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_property132_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%;" class="table">
<tr>
    <th>
        <%=Tag("生成范围")%>：
    </th>
    <td>
    <label>
    <input type="radio" value="1" shop="true" name="Way" checked>
    <%=Tag("选定商品")%>
    </label>
    <label>
    <input type="radio" value="0" shop="true" name="Way">
    <%=Tag("全部商品")%>
    </label>
    </td>
</tr>
<tr>
    <th>
        <%=Tag("商品类别")%>：
    </th>
    <td>
        <select name="Pro_Type_id" shop="true" id="Pro_Type_id" onchange="getsubproducts();">
            <option value=""><%=Tag("请选择")%></option>
            <%=Shop.Bussiness.EX_Product.TypeOption(0, 0, 0, CurrentLanguage.Code)%>
        </select>
    </td>
</tr>
<tbody id="shuxing">
</tbody>
<tr id="submit">
    <td colspan="2" class="action">
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
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Property132_Edit&ids=<%=ids %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?");});
    }
    function getsubproducts() {
        var id = $("#Pro_Type_id").val();
        $.ajax({
            type: "POST",
            url: "product_edit_part.aspx?tid="+ id +"&pid=99999999",
            data: '',
            success: function (res) {
                $("#submit").show();
                $("#shuxing").html(res);
            }
        });
    }
</script>

  