﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.imagesupload" validateRequest="false"%>

<script type="text/javascript" src="<%=site.AdminJsPath %>/jquery.dragsort-0.5.2.min.js"></script>
<script type="text/javascript">
    function deleteimage(img,i) {
        var images = $("#<%=inputname %>").val();
        images = images.replace('@' + img, '');
        $("#<%=inputname %>img" + i + "").remove();
        $("#<%=inputname %>").val(images);
    }
</script>
<style>
    body{margin: 0;padding: 0;}
    .delete{cursor: pointer;}
    #<%=inputname %>images{POSITION: relative; width:400px; list-style-type:none; margin:0; padding:0; z-index:5}
</style>
<ul id="<%=inputname %>images">
    <%
        int i = 1;
        foreach (Shop.Model.LBimage model in list)
          {%>
        <li class="imagespreviewlist" id="<%=inputname %>img<%=i %>">
            <span class="image">
                <a href="<%=model.original %>" data-lightbox="image<%=pid %>"><img src="<%=Image(model.small) %>" /></a><input type="hidden" name="pic" value="<%=model.small %>" />
            </span>
            <span class="image-manage">
                <a href="javascript:void(0)" onclick="deleteimage('<%=model.original %>',<%=i %>);"><%=Tag("删除") %></a>
            </span>
        </li>
     <%
         i++;
        } %>
</ul>
<input name="listpicSortOrder" id="listpicSortOrder" type="hidden" />
<div class="clear"></div>
<script type="text/javascript">
    $(function () {
        $("ul#<%=inputname %>images").dragsort({ dragSelector: "span", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });
    });
    function saveOrder() {
        var str = "";
        var pic = document.getElementsByName("pic");
        for (k = 0; k < pic.length; k++) {
            str += "@" + pic[k].value;
        }
        $("#<%=inputname %>").val(str);
    };
</script>
<div><iframe src="upload.aspx?n=<%=inputname %>&i=<%=i %>" frameborder="0" width="400" height="40px" scrolling="no" allowtransparency="true"></iframe>
</div>

  