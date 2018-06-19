﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.theme.AdvertImage_Edit_window" validateRequest="false"%>

<script type="text/javascript" src="<%=site.WebPath %>/Editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=site.WebPath %>/Editor/ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="<%=site.AdminJsPath %>/ajaxfileupload.js"></script>
<table class="table">
<tr>
    <th style="width:20%">
        <%=Tag("位置")%>：
    </th>
    <td>
        <%=model.Theme_Advert_Code %>
    </td>
</tr>
<tr>
    <th style="width:20%">
        <%=Tag("语言")%>：
    </th>
    <td>
        <%= Shop.Bussiness.Language.SiteLanguageCheckbox("Language_ids", model.Language_ids, CurrentLanguage.Code)%>
    </td>
</tr>
<tr>
    <th>
        <%=Tag("标题")%>：
    </th>
    <td>
        <input type="text" id="Title" name="Title" class="input" shop="true" style="width: 300px;" value="<%=model.Title %>" />&nbsp;<span></span>
    </td>
</tr>
<tr>
    <th>
        <%=Tag("跳转页面")%>：
    </th>
    <td>
        <input type="text" id="URL" name="URL" class="input" style="width: 300px;" shop="true" value="<%=model.URL %>" />
    </td>
</tr>
<tr>
    <th>
        <%=Tag("图片地址")%>：
    </th>
    <td>
        <div id="image_Image"><%if (model.ImageSmall != "")
                                        {%><img src="<%=WebPath + theme.Path_Advert + model.ImageSmall%>" /><%} %></div>
        <input type="hidden" shop="true" id="Image" name="Image" class="input" style="width: 300px;" value="<%=model.Image%>" />
        <input type="hidden" shop="true" id="ImageSmall" name="ImageSmall" class="input" style="width: 300px;" value="<%=model.ImageSmall%>" />
        <input id="file_Image" name="file_Image" class="input" type="file" onchange="uploadImage('Image')" />
        
    </td>
</tr>
<tr>
            <th style="vertical-align:top">
                <%=Tag("文字描述")%>：
            </th>
            <td style="text-align: left;">
                <textarea shop="true" class="textarea" style="width:400px;height:60px;" id="Description" name="Description"><%=model.Description%></textarea>
            </td>
        </tr>
<tr>
    <th>
        <%=Tag("排序序号")%>：
    </th>
    <td>
        <input type="text" id="Sort" name="Sort" shop="true" class="input" style="width: 120px" class="texttime" maxlength="4"  value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')" />
    </td>
</tr>
<tr>
<td colspan="2" class="action">
<div class="tools tools-m clear">
    <ul>
        <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
    </ul>
</div>
<input type="hidden" name="Theme_id" id="Theme_id" value="<%=theme.id %>" shop="true" />
<input type="hidden" name="Theme_Advert_id" id="Theme_Advert_id" value="<%=model.Theme_Advert_id %>" shop="true" />
<input type="hidden" name="Theme_Advert_Code" id="Theme_Advert_Code" value="<%=model.Theme_Advert_Code %>" shop="true" />
</td>
</tr>
</table>
<script type="text/javascript">
 CKEDITOR.replace('Description', {
    height: '150',
    toolbar: 'Basic',
    language: '<%=Tag("CKEditor语言")%>'
});
function uploadImage(id) {
    $.ajaxFileUpload
(
	{
	    url: WebPath + '/ajax/imageupload_advert.aspx?theme_id=<%=theme.id %>',
	    secureuri: false,
	    fileElementId: 'file_' + id,
	    dataType: 'json',
	    success: function (data, status) {
	            if (data.msg != "OK") {
	                MsgBox(2, data.msg, "");
	            }
	            else {
	                $("#image_" + id + "").html('<img height="30" src="' + WebPath + data.url + '">');
	                $("#Image").val(data.Image);
                    $("#ImageSmall").val(data.ImageSmall);
	            }
	    },
	    error: function (data, status, e) {
	        MsgBox(2, data.error, "");
	    }
	}
)
}
function SaveObj() {
    var editor = CKEDITOR.instances.Description;
    $("#Description").val(editor.getData())
    var postData = GetFormJsonData("shop");
    if (!CheckForm("shop", "span"))
        return false;
    var url = "<%=site.AdminPath %>/ajax/ajax_theme.aspx?__Action=AdvertImage_Edit&id=<%=model.id %>";
    RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
}
</script>

  