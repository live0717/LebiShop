﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_brand_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%;" class="table">
    <tr>
        <th>
            <%=Tag("商品品牌")%>：
        </th>
        <td>
            <div style="float: left;" id="divBrnad">
                <select id="Brand_id" shop="true" name="Brand_id">
                    <%=Shop.Bussiness.EX_Product.BrandOption(0)%>
                </select>
            </div>
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
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Brand_Edit&ids=<%=ids %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?");});
    }
</script>

  