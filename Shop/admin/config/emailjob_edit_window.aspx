﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.config.EmailJob_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("邮箱")%>：
        </th>
        <td>
            <%=model.Email %>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("用户")%>：
        </th>
        <td>
            <%=model.User_Name %>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("主题")%>：
        </th>
        <td>
            <%=model.Title%>
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("内容")%>：
        </th>
        <td>
            <%=model.Content%>
        </td>
    </tr>
</table>

  