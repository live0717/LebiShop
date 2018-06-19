﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.theme.Theme_Edit" validateRequest="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<meta name="author" content="LebiShop" />

    <title><%=Tag("模板管理")%>-<%=site.title%></title>

<script src="<%=site.AdminJsPath %>/jquery-3.1.0.min.js"></script>
<script src="<%=site.AdminJsPath %>/jquery-migrate-1.2.1.js"></script>
<script src="<%=site.AdminJsPath %>/Cookies.js"></script>
<script src="<%=site.AdminJsPath %>/main.js"></script>
<script src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script src="<%=site.AdminJsPath %>/master.js"></script>
<script src="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.min.js"></script>
<%if (CurrentLanguage.Code=="CN"){%><script src="<%=site.AdminJsPath %>/jquery-ui/datepicker-zh-CN.js"></script><%}%>
<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/lightbox/lightbox.min.css" />
<%if (Shop.LebiAPI.Service.Instanse.Check("managelicenese")){%>
<style>#body_head #logo {width:112px;height:62px;background:url(<%=site.AdminImagePath %>/2015/logo_oem.gif) center 20px #0669c5 no-repeat;float:left;}</style>
<%}%>
<script>
    var AdminPath = "<%=site.AdminPath %>";var WebPath ="<%=site.WebPath %>";var AdminImagePath = "<%=site.AdminImagePath %>";var requestPage = "<%=Shop.Tools.RequestTool.GetRequestUrl().ToLower() %>";var refPage = "<%=Shop.Tools.RequestTool.GetUrlReferrer().ToLower() %>";
    function quit() { if (confirm("<%=Tag("您确定要退出吗？")%>")) return true; else return false; }
</script>

    <script type="text/javascript" src="<%=site.AdminJsPath %>/ajaxfileupload.js"></script>
    <style>
        textarea
        {
            font-size: 12px;
        }
    </style>

</head>
<body>
<div id="body_head">
  <div class="admintop">
    <div id="logo">
        <a href="<%=site.AdminPath %>/ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"></a>
        <%=LicenseString %>
    </div>
    <%=Version %>
    <div class="admininfo">
        <div id="NewEvent">
            <span><%=Tag("未确认")%></span><em><a href="<%=site.AdminPath %>/order/default.aspx?t=211&type=1"><span id="NewEvent_Order_IsVerified"><%=SYS.NewEvent_Order_IsVerified%></span></a></em>
            <span><%=Tag("已支付")%></span><em><a href="<%=site.AdminPath %>/order/default.aspx?t=211&type=4"><span id="NewEvent_Order_IsPaid"><%=SYS.NewEvent_Order_IsPaid%></span></a></em>
            <span><%=Tag("未发货")%></span><em class="noborder"><a href="<%=site.AdminPath %>/order/default.aspx?t=211&type=5"><span id="NewEvent_Order_IsShipped"><%=SYS.NewEvent_Order_IsShipped%></span></a></em>
        </div>
    </div>
    <%if (Tips()!=""){ %><div id="tips"><%=Tips() %></div><%} %>
    <div id="service">
        <div class="layout">
          <div class="adminface" onmousehover="">
            <img src="<%=CurrentAdmin.Avatar%>" alt="[<%=Lang(CurrentAdminGroup.Name)%>]<%=CurrentAdmin.UserName%>" />
          </div>
          <div class="adminfacepop">
              <a href="javascript:AdminPWD(0);"><%=Tag("改密")%></a>
              <a href="<%=site.AdminPath %>/Logout.aspx" onclick="return quit()"><%=Tag("注销")%></a>
              <a href="<%=site.WebPath %>/" target="_blank"><%=Tag("网站前台")%></a>
          </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
    <div class="navmenu">
        <ul id="shopmenu" class="menu">
            <%foreach (Shop.Model.Lebi_Menu menu in TopMenus)
                { %>
            <li class="<%=CurrentTopMenu.id==menu.id?"current":"" %>"><a href="<%=site.AdminPath %>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=<%=menu.id %>"><span><img src="<%if (menu.Image != ""){ %><%=GetImage(site.WebPath + menu.Image) %><%}else{%><%=site.AdminImagePath%>/icon/plugin.png<%} %>" /><%=Tag(menu.Name)%></span></a> </li>
            <%} %>
        </ul>
        <ul class="menu">
            <li class="menuline"></li>
            <li><a href="javascript:void(0);" onclick="updateadmin();"><span><img src="<%=site.AdminImagePath%>/icon/reh.png" /><%=Tag("系统刷新")%></span></a></li>
            <li><a href="javascript:void(0);" onclick="UpdateCache(0);"><span><img src="<%=site.AdminImagePath%>/icon/cache.png" /><%=Tag("更新缓存")%></span></a></li>
            <li><a href="javascript:void(0);" onclick="UpdateCache(1);"><span><img src="<%=site.AdminImagePath%>/icon/data.png" /><%=Tag("数据同步")%></span></a></li>
            <li><a href="<%=site.AdminPath%>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"><span><img src="<%=site.AdminImagePath%>/icon/dasktop.png" /><%=Tag("桌面") %></span></a></li>
            <li><a href="<%=site.WebPath %>/" target="_blank"><span><img src="<%=site.AdminImagePath%>/icon/web.png" /><%=Tag("网站前台")%></span></a></li>
            <li><a href="javascript:void(0);" onclick="Copyright();"><span><img src="<%=site.AdminImagePath%>/icon/about.png" /><%=Tag("关于") %></span></a></li>
        </ul>
        
    </div>
  </div>
</div>
<div id="body_content">
<div id="sidebar">
    <div class="menubar ">
        <%if (desk == 1)
            { 
        %>
        <h2><span><img src="<%=site.AdminImagePath %>/2015/minus.png" id="img1" /> <%=Tag("快捷菜单")%></span></h2>
        <ul class="clear">
            <%foreach (Shop.Model.Lebi_Menu menu in GetIndexMenus()){ %><li><a href="<%=MenuUrl(menu.URL,1) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <% }else{ %>
        <%foreach (Shop.Model.Lebi_Menu pmenu in GetMenus(CurrentTopMenu.id)){ %>
        <h2><span><img mid="<%=pmenu.id %>" src="<%=site.AdminImagePath %>/2015/<%=MenuShow(pmenu.id)==true?"minus":"plus" %>.png" id="imgStatis" /> <%=Tag(pmenu.Name)%></span></h2>
        <ul class="clear" <%=MenuShow(pmenu.id)==true?"":"style=\"display:none;\"" %>>
            <%foreach (Shop.Model.Lebi_Menu menu in GetMenus(pmenu.Code)){ %><li><a href="<%=MenuUrl(menu.URL,0) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <%} } %>
    </div>
</div>
<div id="sideplus">
    <a href="javascript:void()" onclick="switchSysBar()"><span class="navPoint" id="switchPoint" title="<%=Tag("关闭/打开左栏")%>"><img src="<%=site.AdminImagePath%>/2015/left.png" alt="<%=Tag("关闭/打开左栏")%>" /></span></a>
</div>
<div id="sidecontent" class="clear">
    <div class="mainbody_path" id="body_path">
      
    <div class="tools">
        <ul>
            <%if (PageReturnMsg == ""){%>
            <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
            <%}%>
            <li class="rotate"><a href="javascript:void(0);" onclick="history.go(-1);"><b></b><span><%=Tag("返回")%></span></a></li>
            <%=publish() %>
            <li class="name"><span id="navIgation">
                <%=Tag("当前位置")%>：<a href="<%=site.AdminPath %>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"><%=Tag("管理首页")%></a> > <a href="<%=site.AdminPath %>/theme/default.aspx"><%=Tag("模板管理")%></a><%if (model.id > 0){ %> > <%=model.Name%> > <%=Tag("配置")%><%}else{ %> > <%=Tag("添加")%><%} %></span></li>
        </ul>
    </div>

    </div>
    <%if (PageReturnMsg == ""){%>
        
        
    <%}%>
    <div class="mainbody" id="body_main">
        <div id="body_main_form">
          <%if (PageReturnMsg == ""){%>
            
    <table class="table">
        <tr>
            <th>
                <%=Tag("作者")%>：
            </th>
            <td>
                <%=model.LebiUser %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("名称")%>：
            </th>
            <td>
                <%=GetName()%>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("支持语言")%>：
            </th>
            <td>
                <%=GetLanguage()%>
            </td>
        </tr>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("启用语言")%>：
            </th>
            <td>
                <%= Shop.Bussiness.Language.SiteLanguageCheckbox("Language_ids", GetLanguageid(model), CurrentLanguage.Code)%>
            </td>
        </tr>
        <tr>
            <th valign="top" style="width: 15%;">
                <%=Tag("缩略图")%>：
            </th>
            <td>
                <%if (model.id > 0)
                  { %>
                <div id="image_ImageUrl">
                    <%if (model.ImageSmallUrl != "")
                      {%>
                    <img height="50" src="<%=Shop.Bussiness.ThemeUrl.CheckURL(WebPath + model.Path_Files+"/"+model.ImageSmallUrl)%>" />
                    <%} %>
                </div>
                <%=GetUpLoadDiv()%> <em><%=Tag("推荐尺寸")%>：600*600px</em>
                <%}
                  else
                  { %>
                <%=Tag("保存后上传") %>
                <%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("模板路径")%>：
            </th>
            <td>
                <input type="text" id="Path_Files" name="Path_Files" class="input" shop="true" style="width: 500px;"
                    value="<%=model.Path_Files %>" />
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("JS文件路径")%>：
            </th>
            <td>
                <input type="text" id="Path_JS" name="Path_JS" class="input" shop="true" style="width: 500px;"
                    value="<%=model.Path_JS %>" />
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("CSS文件路径")%>：
            </th>
            <td>
                <input type="text" id="Path_CSS" name="Path_CSS" class="input" shop="true" style="width: 500px;"
                    value="<%=model.Path_CSS %>" />
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("图片文件路径")%>
                ：
            </th>
            <td>
                <input type="text" id="Path_Image" name="Path_Image" class="input" shop="true" style="width: 500px;"
                    value="<%=model.Path_Image %>" />
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("图片尺寸")%>：
            </th>
            <td>
                <input type="text" id="ImageMedium_Width" name="ImageMedium_Width" style="width: 70px"
                    shop="true" class="input" value="<%=model.ImageMedium_Width %>" onkeyup="value=value.replace(/[^\d]/g,'')"
                    maxlength="4" />
                *
                <input type="text" id="ImageMedium_Height" name="ImageMedium_Height" style="width: 70px"
                    shop="true" class="input" value="<%=model.ImageMedium_Height %>" onkeyup="value=value.replace(/[^\d]/g,'')"
                    maxlength="4" />
            </td>
        </tr>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("描述")%>：
            </th>
            <td>
                <textarea id="Description" name="Description" shop="true" cols="95" rows="4" class="textarea"
                    style="width: 500px; height: 60px;"><%=model.Description%></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Description',100);">
                            <b></b><span>
                                <%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Description',-100)">
                            <b></b><span>
                                <%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("升级")%>：
            </th>
            <td>
                <label><input type="radio" name="IsUpdate" value="1" shop="true" <%=model.IsUpdate==1?"checked":"" %> /><%=Tag("开启")%></label>
                <label><input type="radio" name="IsUpdate" value="0" shop="true" <%=model.IsUpdate==0?"checked":"" %> /><%=Tag("关闭")%></label>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("排序序号")%>：
            </th>
            <td>
                <input type="text" id="Sort" name="Sort" style="width: 70px" shop="true" class="input"
                    value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                    maxlength="4" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        var url="<%=site.AdminPath %>/ajax/ajax_theme.aspx?__Action=Theme_Edit&id=<%=model.id %>";
//        RequestAjax(url,postData,function(res){MsgBox(1, "<%=Tag("操作成功")%>", "?id="+res.id)})
        RequestAjax(url,postData,function(res){MsgBox(1, "<%=Tag("操作成功")%>", "default.aspx")});
    }
    function Publish()
    {
        var postData = GetFormJsonData("shop");
        var url="<%=site.AdminPath %>/ajax/ajax_theme.aspx?__Action=Theme_publish&id=<%=model.id %>";
        RequestAjax(url,postData,function(res){MsgBox(1, "<%=Tag("操作成功")%>", "?id=<%=model.id %>")});
    }
    </script>
    <script type="text/javascript">
        function uploadImage(id) {
            var path = $("#Path_Files").val();
            $.ajaxFileUpload
        (
	        {
	            url: WebPath + '/ajax/imageupload_theme.aspx?path=' + path,
	            secureuri: false,
	            fileElementId: 'file_' + id,
	            dataType: 'json',
	            success: function (data, status) {
	                if (data.msg != 'OK') {
	                    MsgBox(2, data.msg, "");
	                }
	                else {
	                    var imageUrl = data.ImageUrl;
	                    var tpath = $("#Path_Files").val();
	                    if (imageUrl.length > 0) {
	                        $("#image_" + id + "").html('<img height="50" src=' + WebPath + tpath + "/" + imageUrl + '>');
	                        $("#" + id + "").val(imageUrl);
	                    }
	                }

	            }
	        }
        )
        }
    </script>

          <%}else{%>
            <%=PageReturnMsg%>
          <%}%>
        </div>
    </div>
    
    <div id="body_foot">
        <div class="foot">
            <div class="copy" id="lebicopy">
                <asp:Label ID="LBLicense" runat="server"></asp:Label>
            </div>
            <div class="lang">
                <ul class="droplang">
                    <li class="lang_li"><a class="noclick">
                        <%int langi = 0;
                          if (CurrentAdminLanguage.Name == "")
                            {%><%=Tag("语言选择")%><%}else{%><%=CurrentAdminLanguage.Name%><%} %></a>
                        <dl class="lang_li_content">
                            <%foreach (Shop.Model.Lebi_Language_Code langc in langs)
                              {
                                  langi++; if (langi== langs.Count)
                                  {%>
                            <dd class="last"><%}
                                  else
                                  {%><dd><%} %>
                            <a href="javascript:SetLanguage('<%=langc.Code %>','<%=langc.Name %>');"><%=langc.Name %></a></dd>
                                  <%} %>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
<div id="sound"></div>
<script src="<%=site.AdminJsPath %>/lightbox/lightbox.min.js"></script>
<script>
    function Copyright() {
        var title_ = "<%=Tag("关于")%>";
        var url_ = "<%=site.AdminPath %>/Config/Copyright_window.aspx";
        var width_ = 500;
        var height_ = 'auto';
        var modal_ = true;
        EditWindow(title_, url_, width_, height_, modal_);
    }
    function UpdateCache(type) {
        var postData = ""; 
        if (type == 0){
            postData = {'datatype':'languagetag,producttype,config,themepage'};
        }else{
            postData = {'datatype':'dbbody,lebitype,lebimenu,lebipage'};
        }
        var url = "<%=site.AdminPath %>/ajax/ajax_db.aspx?__Action=CacheReset";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
    function updateadmin(){
        var url="<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=UpdateAdmin";
        RequestAjax(url,"",function(res){RequestAjax("<%=site.AdminPath %>/ajax/ajax_db.aspx?__Action=CacheReset","{'datatype':'dbbody'}",function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});});
    }
    function NewEvent(){
        GetNewEvent();
        setTimeout(function(){NewEvent();},<%=SYS.NewEventTimes%>);
    }
    function PlayAudio(){
        <%if (config.NewEventPlayAudio=="1"){%>
        $('#sound').html('<audio autoplay="autoplay"><source src="<%=site.AdminImagePath %>/msg.mp3" type="audio/mpeg"><source src="<%=site.AdminImagePath %>/msg.wav" type="audio/wav"></audio>');
        <%}%>
    }
    setTimeout(function(){NewEvent();},<%=LeftNewEventTimes%>);
</script>
</body>
</html>