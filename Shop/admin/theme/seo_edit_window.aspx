﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.theme.Page_Edit_window" validateRequest="false"%>

<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" style="display: none">
        <tr>
            <th style="width:20%">
               <%=Tag("名称")%>：
            </th>
            <td>
                <%=Lang(model.Name) %>
            </td>
        </tr>
        <tr>
            <th>
               <%=Tag("网页标题")%>：
            </th>
            <td>
                <input type="text" id="SEO_Title<%=lang.Code %>" name="SEO_Title<%=lang.Code %>" class="input" shop="true" min="notnull" style="width: 400px;" value="<%=Shop.Bussiness.Language.Content(model.SEO_Title,lang.Code) %>" />
            </td>
        </tr>
        <tr>
            <th>
               <%=Tag("关键词")%>：
            </th>
            <td>
                <input type="text" id="SEO_Keywords<%=lang.Code %>" name="SEO_Keywords<%=lang.Code %>" class="input" shop="true" min="notnull" style="width: 400px;" value="<%=Shop.Bussiness.Language.Content(model.SEO_Keywords,lang.Code) %>" />
            </td>
        </tr>
        <tr>
            <th>
               <%=Tag("网页描述")%>：
            </th>
            <td>
                <input type="text" id="SEO_Description<%=lang.Code %>" name="SEO_Description<%=lang.Code %>" class="input" shop="true" min="notnull" style="width: 400px;" value="<%=Shop.Bussiness.Language.Content(model.SEO_Description,lang.Code) %>" />
            </td>
        </tr>
    </tbody>
    <%} %>
    <tr>
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
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        
        var url = "<%=site.AdminPath %>/ajax/ajax_theme.aspx?__Action=ThemeSEO_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  