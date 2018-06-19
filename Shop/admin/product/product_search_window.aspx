﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_search_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 120px;">
            <%=Tag("名称")%>：
        </th>
        <td>
            <input name="Name" id="Name" value="<%=model.Name %>" shop="true" type="text"
                class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("商品编号")%>：
        </th>
        <td>
            <input name="Number" value="<%=model.Number %>" shop="true" type="text" class="input"
                style="width: 200px;" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("商品类型")%>：
        </th>
        <td>
            <%=Shop.Bussiness.EX_Type.TypeCheckbox("ProductType", "Type_id_ProductType", model.Type_id_ProductType, "shop=\"true\"", CurrentLanguage.Code)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("组合商品")%>：
        </th>
        <td>
            <label><input name="iscombo" value="" shop="true" type="radio"  <%=model.iscombo==""?"checked":"" %>/><%=Tag("全部")%></label>
            <label><input name="iscombo" value="1" shop="true" type="radio" <%=model.iscombo=="1"?"checked":"" %>/><%=Tag("是")%></label>
            <label><input name="iscombo" value="0" shop="true" type="radio" <%=model.iscombo=="0"?"checked":"" %>/><%=Tag("否")%></label>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("状态")%>：
        </th>
        <td>
            <%=Shop.Bussiness.EX_Type.TypeCheckbox("ProductStatus", "Type_id_ProductStatus", model.Type_id_ProductStatus, "shop=\"true\"", CurrentLanguage.Code)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("品牌")%>：
        </th>
        <td>
            <%
                int Brand_id = 0;
                int.TryParse(model.Brand_id, out  Brand_id);    
            %>
            <select id="Brand_id" name="Brand_id" shop="true">
                <option value="0">
                    <%=Tag("全部")%></option>
                <%=Shop.Bussiness.EX_Product.BrandOption(Brand_id, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
        <%if (Shop.LebiAPI.Service.Instanse.Check("plugin_gongyingshang"))
          { %>
    <tr>
        <th>
            <%=Tag("商家")%>：
        </th>
        <td>
            <%
                int Supplier_id = 0;
                int.TryParse(model.Supplier_id, out  Supplier_id);    
            %>
            <select id="Supplier_id" name="Supplier_id" shop="true">
                <option value="0">
                    <%=Tag("全部")%></option>
                <%=Shop.Bussiness.EX_Supplier.SupplierOption(Supplier_id, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("销量")%>：
        </th>
        <td>
            <input name="Count_Sales1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Sales1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
            -
            <input name="Count_Sales2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Sales1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("库存")%>：
        </th>
        <td>
            <input name="Count_Stock1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Stock1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
            -
            <input name="Count_Stock2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Stock2 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("预警库存")%>：
        </th>
        <td>
            <input name="Count_StockCaution1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_StockCaution1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
            -
            <input name="Count_StockCaution2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_StockCaution2 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("浏览量")%>：
        </th>
        <td>
            <input name="Count_Views1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Views1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
            -
            <input name="Count_Views2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Views2 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("价格")%>：
        </th>
        <td>
            <input name="Price1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
            -
            <input name="Price2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price2 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <%if (Shop.Bussiness.EX_Admin.CheckPower("product_price_cost")){ %>
    <tr>
        <th>
            <%=Tag("成本价")%>：
        </th>
        <td>
            <input name="Price_Cost1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price_Cost1 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
            -
            <input name="Price_Cost2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price_Cost2 %>" onkeydown="if(event.keyCode==13){SearchProduct();}" />
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("商品标签")%>：
        </th>
        <td>
            <% foreach (Shop.Model.Lebi_Pro_Tag t in Shop.Bussiness.B_Lebi_Pro_Tag.GetList("", ""))
                   { %>
                <label><input shop="true" type="checkbox" value="<%=t.id %>" name="Pro_Tag_id"
                    <%=(","+model.Pro_Tag_id+",").Contains(","+t.id+",")?"checked":"" %> /><%=Shop.Bussiness.Language.Content(t.Name,CurrentLanguage.Code) %></label>
                <%} %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("添加时间")%>：
        </th>
        <td>
            <input name="Time_Add1" id="Time_Add1" shop="true" type="text" class="input-calendar"
                style="width: 120px;" value="<%=model.Time_Add1 %>" />
            -
            <input name="Time_Add2" id="Time_Add2" shop="true" type="text" class="input-calendar"
                style="width: 120px;" value="<%=model.Time_Add2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("上架时间")%>：
        </th>
        <td>
            <input name="Time_OnSale1" id="Time_OnSale1" shop="true" type="text" class="input-calendar"
                style="width: 120px;" value="<%=model.Time_OnSale1 %>" />
            -
            <input name="Time_OnSale2" id="Time_OnSale2" shop="true" type="text" class="input-calendar"
                style="width: 120px;" value="<%=model.Time_OnSale2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("商品分类")%>：
        </th>
        <td>
            <select name="Pro_Type_id" id="Pro_Type_id" shop="true" multiple="multiple" size="8">
                <%=Shop.Bussiness.EX_Product.TypeOption(0, model.Pro_Type_id, 0, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <%if (domain3admin)
      { %>
    <tr>
        <th>
            <%=Tag("站点")%>：
        </th>
        <td>
             <%=site.SiteCheckbox("Site_ids",model.Site_ids,CurrentLanguage.Code)%>
        </td>
    </tr>
    <%} %>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SearchProduct();"><b></b><span>
                        <%=Tag("提交")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function SearchProduct()
    {
        var postData = GetFormJsonData("shop");
        var url = "<%=site.AdminPath %>/ajax/ajax_search.aspx?__Action=ProductSearch";
        $.ajax({
            type: "POST",
            url: url,
            data: postData,
            dataType: 'json',
            success: function (res) {
                <%=callback %>(res.url);
            }
        });
    }
    $().ready(function () {
    $(".calendar,.input-calendar").datepicker({dateFormat:"yy-mm-dd"});
    $('#Pro_Type_id').multiselect2side({
        selectedPosition: 'right',
        moveOptions: false,
        //search: "<img src='img/search.gif' align=\"absmiddle\" /> ",
        labelsx: '',
        labeldx: '',
        autoSort: false,
        autoSortAvailable: false
    });
    }); 
</script>

  