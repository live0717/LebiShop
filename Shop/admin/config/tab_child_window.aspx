﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.Tab_Child_window" validateRequest="false"%>

<table cellspacing="0" border="0" id="listcc" class="datalist" style="width: 100%; border-collapse: collapse;">
    <tr class="title">
        <th style="width: 30px;">
            <a href="javascript:void(0);" onclick="$('input[name=\'tpid\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));"><%=Tag("全选")%></a>
        </th>
        <th>
            <%=Tag("类别名称")%>
        </th>
    </tr>
    <%=Shop.Bussiness.EX_Product.TypeList(0, tab.id.ToString(), 0, CurrentLanguage.Code)%>
    <tr>
        <td colspan="2" class="action" align="left">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="Tab_Child_Add();"><%=Tag("提交")%></a><span></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    addtrbg(".datalist");
    function Tab_Child_Add() {
        var ids = GetChkCheckedValues("tpid");
        var postData = { "ids": ids };
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=Tab_Child_Add&tabid=<%=tab.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  