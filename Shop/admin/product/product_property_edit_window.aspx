﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_property_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%;" class="table">
<tr>
    <th>
        <%=Tag("生成范围")%>：
    </th>
    <td>
    <label>
    <input type="radio" value="1" sonproduct="true" name="Way" checked>
    <%=Tag("选定商品")%>
    </label>
    <label>
    <input type="radio" value="0" sonproduct="true" name="Way">
    <%=Tag("全部商品")%>
    </label>
    </td>
</tr>
<tr>
    <th>
        <%=Tag("商品类别")%>：
    </th>
    <td>
        <select name="Pro_Type_id" sonproduct="true" id="Pro_Type_id" onchange="getsubproducts();">
            <option value=""><%=Tag("请选择")%></option>
            <%=Shop.Bussiness.EX_Product.TypeOption(0, 0, 0, CurrentLanguage.Code)%>
        </select>
    </td>
</tr>
</table>
<div id="table4">
</div>
<script type="text/javascript">
    function Product_Edit_muti() {
        var postData = GetFormJsonData("sonproduct");
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Property_Edit&ids=<%=ids %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?");});
    }
    function CreateProduct(){
        if (!confirm("<%=Tag("确认要生成同款的商品数据吗？")%>"))
            return false;
        var ggs=GetChkCheckedValues("Property131");
        var pid=99999999;
        var tid=$("#Pro_Type_id").val();
        var postData={ "ggs": ggs,"pid":pid,"tid":tid,"randnum":99999999 };
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=CreateProductGuiGe";
        RequestAjax(url,postData,function(){getsubproducts();});
    }
    function Product_Status_Edit_muti(status) {
        var postData = GetFormJsonData("ShopKeyID");
        var action = $("#action").val();
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Status_Edit_muti&status="+status;
        RequestAjax(url,postData,function(){getsubproducts();});
    }
    function Product_Del() {
        if (!confirm("<%=Tag("确认要删除吗？")%>"))
            return false;
        var postData = GetFormJsonData("ShopKeyID");
        var action = $("#action").val();
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Del";
        RequestAjax(url,postData,function(){getsubproducts();});
    }
    function getsubproducts() {
        var id = $("#Pro_Type_id").val();
        var Property131=GetChkCheckedValues("Property131");
        var ProPertyMain=$("#ProPertyMain").val();
        $.ajax({
            type: "POST",
            url: "product_edit_list.aspx?tid="+ id +"&pid=99999999&Property131="+ Property131 +"&ProPertyMain="+ProPertyMain+"&mutiadd_property=1",
            data: '',
            success: function (res) {
                $("#table4").html(res);
            }
        });
    }
</script>

  