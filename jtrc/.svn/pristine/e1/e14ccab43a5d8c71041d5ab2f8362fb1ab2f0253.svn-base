<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/taglibs.jsp" %>

<html>
<head>
<title></title>
 <link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>js/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=basePath%>js/jquery-easyui/themes/icon.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui/jquery.min.js"></script>
<script src="<%=basePath%>js/jquery-easyui/jquery.easyui.min.js"></script>
<script src="<%=basePath%>js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.rotate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui/jquery-form.js"></script>
<script type="text/javascript" src="<%=basePath%>js/staticData.js"></script>

<%-- <script type="text/javascript" src="<%=basePath%>js/WdatePicker/WdatePicker.js"></script> --%>
<script type="text/javascript">var basePath ="<%=basePath%>";var sessionUserId ="<%=sessionUserId%>";var sessionUserName ="<%=sessionUserName%>";var sessionRealName ="<%=sessionRealName%>";</script>
<script type="text/javascript" src="<%=basePath%>js/validator.js"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>js/verification_regular.js"></script>
<script type="text/javascript">
var eve = eve || {};
eve.path = '<%=path%>';
eve.basePath = '<%=basePath%>';
eve.msgTitle = '系统提示';
/**
 * 指定位置显示$.messager.show
 * options $.messager.show的options
 * param = {left,top,right,bottom}
 */
$.extend($.messager, {
	showBySite : function(options,param) {
		var site = $.extend( {
			left : "",
			top : "",
			right : 0,
			bottom : -document.body.scrollTop
					- document.documentElement.scrollTop
		}, param || {});
		var win = $("body > div .messager-body");
		if(win.length<=0)
			$.messager.show(options);
		win = $("body > div .messager-body");
		win.window("window").css( {
			left : site.left,
			top : site.top,
			right : site.right,
			zIndex : $.fn.window.defaults.zIndex++,
			bottom : site.bottom
		});
	}
})
	
$.extend({
    log: function(message) {
       // if(console && console.log){console.log(message);}
    },
    msg: function(msg){
    	$.messager.show({title: eve.msgTitle, msg: msg, style:{
    	    left: $(document.body).width()/2-150, // 与左边界的距离
    	    top:  $(document.body).height()/2-150 // 与顶部的距离
    	    }});
    },
    alert: function(msg){
    	$.messager.alert(eve.msgTitle, msg);    	
    }
})

/**
 * 将form表单元素的值序列化成对象
 * @example eve.serializeObject($('#formId'))
 * @requires jQuery
 * @returns object
 */
eve.serializeObject = function(form) {
    var o = {};
    $.each(form.serializeArray(), function(index) {
        if (this['value'] != undefined && this['value'].length > 0) {// 如果表单项的值非空，才进行序列化操作
            if (o[this['name']]) {
                o[this['name']] = o[this['name']] + "," + this['value'];
            } else {
                o[this['name']] = this['value'];
            }
        }
    });
    return o;
};

function PreviewImage(fileObj,imgPreviewId,divPreviewId){  
    var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;  
    var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();              
    var browserVersion= window.navigator.userAgent.toUpperCase();  
    if(allowExtention.indexOf(extention)>-1){   
        if(fileObj.files){//HTML5实现预览，兼容chrome、火狐7+等  
            if(window.FileReader){  
                var reader = new FileReader();   
                reader.onload = function(e){  
                    document.getElementById(imgPreviewId).setAttribute("src",e.target.result);  
                }    
                reader.readAsDataURL(fileObj.files[0]);  
            }else if(browserVersion.indexOf("SAFARI")>-1){  
                alert("不支持Safari6.0以下浏览器的图片预览!");  
            }  
        }else if (browserVersion.indexOf("MSIE")>-1){  
            if(browserVersion.indexOf("MSIE 6")>-1){//ie6  
                document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
            }else{//ie[7-9]  
                fileObj.select();  
                if(browserVersion.indexOf("MSIE 9")>-1)  
                    fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问  
                var newPreview =document.getElementById(divPreviewId+"New");  
                if(newPreview==null){  
                    newPreview =document.createElement("div");  
                    newPreview.setAttribute("id",divPreviewId+"New");  
                    newPreview.style.width = document.getElementById(imgPreviewId).width+"px";  
                    newPreview.style.height = document.getElementById(imgPreviewId).height+"px";  
                    newPreview.style.border="solid 1px #d2e2e2";  
                }  
                newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";                              
                var tempDivPreview=document.getElementById(divPreviewId);  
                tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);  
                tempDivPreview.style.display="none";                      
            }  
        }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox  
            var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);  
            if(firefoxVersion<7){//firefox7以下版本  
                document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());  
            }else{//firefox7.0+                      
                document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));  
            }  
        }else{  
            document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
        }           
    }else{  
        alert("仅支持"+allowExtention+"为后缀名的文件!");  
        fileObj.value="";//清空选中文件  
        if(browserVersion.indexOf("MSIE")>-1){                          
            fileObj.select();  
            document.selection.clear();  
        }                  
        fileObj.outerHTML=fileObj.outerHTML;  
    }  
}
</script>
<body>

</body>

</html>
