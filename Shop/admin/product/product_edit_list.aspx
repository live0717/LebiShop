﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_Edit_list" validateRequest="false"%>

<div class="proBox clear">
    <ul class="btns clear">
        <li class="add" onclick="CreateProduct();"><%=Tag("生成")%></li>
        <li class="submit" onclick="Product_Edit_muti();"><%=Tag("保存")%></li>
        <li class="delete" onclick="Product_Del();"><%=Tag("删除")%></li>
        <%if (mutiadd_property == 0){ %>
        <li class="edit" onclick="Product_Image_Edit();"><%=Tag("修改图片")%></li>
        <%} %>
        <li class="up" onclick="Product_Status_Edit_muti(1);"><%=Tag("上架")%></li>
        <li class="down" onclick="Product_Status_Edit_muti(0);"><%=Tag("下架")%></li>
    </ul>
    <div class="iTabHead">
        <table class="table">
            <%if (tid > 0){ %>
            <tr>
                <th>
                    <%=Tag("主规格")%>：
                </th>
                <td>
                    <select id="ProPertyMain" name="ProPertyMain" shop="true" sonproduct="true">
                        <option value="0"><%=Tag("不设置")%></option>
                        <%
                            foreach (Shop.Model.Lebi_ProPerty pro in ggs)
                            {
                        %>
                        <option value="<%=pro.id %>" <%=modelp.ProPertyMain==pro.id?"selected":"" %> ><%=Lang(pro.Name)%></option>
                        <%} %>
                    </select>
                </td>
            </tr>
            <%
                foreach (Shop.Model.Lebi_ProPerty pro in ggs)
                {
            %>
            <tr>
                <th>
                    <%=Lang(pro.Name)%>：
                </th>
                <td>
                    <%=Getpro131List(pro.id)%>
                </td>
            </tr>
            <%
            }}else{
            %>
            <tr>
                <th>
                </th>
                <td>
                    <%=Tag("请先选择商品类别")%>
                </td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</div>
<table class="datalist">
    <tr class="title">
        <th style="width: 40px;">
            <a href="javascript:void(0);" onclick="$('input[name=\'sonproductid\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));">
                <%=Tag("全选")%></a>
        </th>
        <%if (mutiadd_property == 0){ %>
        <th style="width: 40px">
            <%=Tag("图片")%>
        </th>
        <%} %>
        <th style="width: 100px">
            <%=Tag("编号")%>
        </th>
        <th style="width: 80px">
            <%=Tag("规格")%>
        </th>
        <%if (mutiadd_property == 0){ %>
        <th>
            <%=Tag("商品名称")%>
        </th>
        <%} %>
        <th style="width: 80px">
            <%=Tag("市场价")%>
        </th>
        <th style="width: 80px">
            <%=Tag("销售价")%>
        </th>
        <%if (modelp.Type_id_ProductType == 321)
        { %>
        <th style="width: 80px">
            <%=Tag("抢购价")%>
        </th>
        <%}else if (modelp.Type_id_ProductType == 322)
        { %>
        <th style="width: 80px">
            <%=Tag("团购价")%>
        </th>
        <%}else if (modelp.Type_id_ProductType == 323)
        { %>
        <th style="width: 80px">
            <%=Tag("换购积分")%>
        </th>
        <%} %>
        <%if (Shop.Bussiness.EX_Admin.CheckPower("product_price_cost")){ %>
        <th style="width: 80px">
            <%=Tag("成本价")%>
        </th>
        <%} %>
        <th style="width: 80px">
            <%=Tag("库存")%>
        </th>
        <%if (mutiadd_property == 0){ %>
        <th style="width: 80px">
            <%=Tag("冻结库存")%>
        </th>
        <th style="width: 80px">
            <%=Tag("销量")%>
        </th>
        <th style="width: 80px">
            <%=Tag("显示销量")%>
        </th>
        <%} %>
        <th style="width: 80px">
            <%=Tag("状态")%>
        </th>
        <%if (mutiadd_property == 0){ %>
        <th style="width: 80px">
            <%=Tag("操作")%>
        </th>
        <%} %>
    </tr>
    <tbody id="subproducts"></tbody>
</table>
<script type="text/javascript">
    function getsubproducts() {
        $.ajax({
            type: "POST",
            url: "subproduct_list.aspx?pid=<%=pid %>&randnum=<%=randnum %>&mutiadd_property=<%=mutiadd_property %>",
            data: '',
            success: function (res) {
                $("#div_error").dialog('close');
                $("#subproducts").html(res);
            }
        });
    }
    $(function () {
        getsubproducts();
        addtrbg(".datalist");
    });
</script>

  