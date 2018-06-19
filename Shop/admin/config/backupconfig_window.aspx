﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.BackUPConfig" validateRequest="false"%>

<table class="table">
    <tbody>
        <tr>
            <th style="width: 20%;">
                <%=Tag("备份路径")%>：
            </th>
            <td>
                <input type="text" id="DataBase_BackPath" name="DataBase_BackPath" shop="true" style="width: 300px;"
                    value="<%=model.DataBase_BackPath %>" class="input" />
                <span class="FormALT"></span>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("备份文件扩展名")%>：
            </th>
            <td>
                <input type="text" id="DataBase_BackName" name="DataBase_BackName" shop="true" style="width: 300px;"
                    value="<%=model.DataBase_BackName %>" class="input" />
                <span class="FormALT"></span>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("备份间隔")%>：
            </th>
            <td>
                <input type="text" id="DataBase_BackUpTime" name="DataBase_BackUpTime" shop="true" style="width: 100px;"
                    value="<%=model.DataBase_BackUpTime %>" class="input" onkeyup="value=value.replace(/[^\d]/g,'')" />
                <span class="FormALT"><%=Tag("单位：分钟") %> （<%=Tag("0 表示不备份") %>）</span>
            </td>
        </tr>
        <%if (!IsEnable)
            { %>
        <tr>
        <td colspan="2" class="classfaq">
        <div class="faq_main">
            <%=Tag("数据库与网站程序不在同一服务器，备份功能不可用")%>
                
        </div>
        </td>
    </tr>
    <%}else{ %>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
    <%} %>
    </tbody>
</table>
<script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        var url="<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=BackUPConfig_Edit";
        RequestAjax(url,postData,function(res){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
        
</script>

  