<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>业务修改</title>
</head>

<body>
	<form id="fmEdit" method="post">
	    <input id="id" type="hidden" name="id">
	    <input id="childId" type="hidden" name="childId">
	    <input id="sstate" type="hidden" name="sstate">
			<div>
			<table class="table2" id="editTable">
				<tr>
					<td class="left">
						业务编码
					</td>
					<td class="right">
						<input id="e_pno" class="easyui-textbox" size="20" name="pno" readonly="readonly" disabled="disabled"
							data-options="required:true" style="height: 22px">
					</td>
					<td class="left">
						业务名称
					</td>
					<td class="right">
						<input id="e_name" class="easyui-textbox" size="20" name="name"
							data-options="required:true" style="height: 22px">
					</td>
				</tr>
				<tr>
					<td class="left">
						业务分类
					</td>
					<td class="right">
					    <select  id="parentId" name="parentId" class="easyui-combobox" editable="false" style="width:135px;height: 22px" data-options="
								url:'../typeInfo/typeInfoListJson',
								method:'get',
								valueField:'id',
								textField:'name',
								required:true,
								panelHeight:'auto'
						">
						</select>
					</td>
					<td class="left">
						材料递送方向
					</td>
					<td class="right">
					    <select id="sDirect" name="sDirect" class="easyui-combobox" editable="false" data-options="required:true" style="width:135px;height: 22px">
							<option value="2" selected="selected">无</option>
							<option value="0">寄出</option>
							<option value="1">回收</option>
						</select>
					</td>
				</tr>
				<tr>
                    <td class="left">办理说明</td>
                    <td class="right" colspan="3"  style="padding-right: 30px">
                        <input class="easyui-textbox" name="remark" id="remark" data-options="multiline:true" style="width:90%;height:100px">
                    </td>
                 </tr>
                 <tr>
                    <td class="left">选择图片:</td>
                    <td class="right" colspan="3">
                        <input id="idFile" name="idFile" type="file" size="45" onchange="javascript:setImagePreview(this);" name="idFile" class="input" />
                    </td>
                 </tr>
			</table>
			<%--显示大图标的区域--%>  
	        <div id="divImage" style="display: none;left:40px;top:40px;position: absolute">  
	            <img id="imgbig" onclick="out();" src="" alt="大图" />  
	        </div>
	        <div   id="localImagIe" onclick="ieOut();" style="left:40px;top:40px;position: absolute">
		</div>
		
	</form> 
	<script type="text/javascript">
	var maxSize = 2 * 1024 * 1024;
	var k = 0;
	//检查图片的格式是否正确,同时实现预览   
	function setImagePreview(obj) {   
		var m = $('.table2').find("tr[name='picTr']").length;
		if(m > 2){
			$.messager.alert("系统消息","最多上传3张图片!");            
		    return false;    
		} 
		var array = new Array('jpeg', 'png', 'jpg'); //可以上传的文件类型        
		if (obj.value == '') {           
			$.messager.alert("系统消息","请选择选择要上传的图片!");            
		     return false;        
	    }else {
		                
	    	var reg = /^(.*)(\.)(.{1,8})$/;
	        var fileContentType = obj.value.match(reg)[3];//这个文件类型正则很有用             ////布尔型变量            
	        var isExists = false;            //循环判断图片的格式是否正确            
	        var file_size = 0;
	        
            if (!!window.ActiveXObject || "ActiveXObject" in window) {
            /* var filepath = $("input[name='idFile']").val();
             
                var image=new Image();      
                image.dynsrc=obj;      
                   alert(image.fileSize); */
             
            } else {
                file_size = obj.files[0].size;
                var size = file_size / 1024;
                if (size > 2048) {
                    alert("上传的附件大小不能超过2M！");
                    return ;
                }
            } 
            var str = '<tr valign="bottom" name="picTr">';
            str += '<td class="left" colspan="3">';
            str += '<div  style="margin-left:100px;" id="localImag'+k+'">';
            str += '<img id="preview'+k+'" name="pic'+k+'" src="" style="width: 200px; height: 150px;" />';
            str += '</div>';
            str += '<input  type="hidden" id="pic'+k+'" name="pic"/>';
            str += '</td>';
            str += '<td class="right">';
            str += '<a onclick="over('+k+')" class="easyui-linkbutton" data-options="iconCls:\'icon-tip\',plain:true">预览</a>';
            str += '&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del(this)" class="easyui-linkbutton" data-options="iconCls:\'icon-remove\',plain:true">删除</a>';
            str += '</td>';
            str += '</tr>';
            $(".table2").append(str);
            //$.parser.parse($(".table2"));
            var localImagId = document.getElementById("localImag" + k);
            var imgObjPreview = document.getElementById("preview" + k);
	        for (var i in array) {                
	            if (fileContentType.toLowerCase() == array[i].toLowerCase()) {                    
	                //图片格式正确之后，根据浏览器的不同设置图片的大小                    
	                if (obj.files && obj.files[0]) {                        
	                    //火狐下，直接设img属性 
	                    imgObjPreview.style.display = 'block';                        
	                    imgObjPreview.style.width = '300px';                        
	                    imgObjPreview.style.height = '150px';                        
	                    //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
	                    imgObjPreview.src = window.URL.createObjectURL(obj.files[0]);
	                    k = k+1;      
	                } else {                        
	                    //IE下，使用滤镜                         
	                    obj.select();                        
	                    var imgSrc = document.selection.createRange().text;
	                    //必须设置初始大小                        
	                     localImagId.style.width = "300px";                        
	                     localImagId.style.height = "150px";                        
	                     //图片异常的捕捉，防止用户修改后缀来伪造图片                         
	                     try {                            
	                         localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";                            
	                         localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;   
	                       var img = document.createElement("img");
							img.src = imgSrc;
							fileSize = img.fileSize;   
			         
  	                     } catch (e) {                            
	                    	 $.messager.alert("系统消息","您上传的图片格式不正确，请重新选择!");                            
	                         return false;                        
	                     }                        
	                     imgObjPreview.style.display = 'none';                        
	                     document.selection.empty();  
	                     k = k+1;      
	                }
	                ajaxFileUpload(k-1);    
	                isExists = true;  
	                return true;                
	            }            
	       }            
	       if (isExists == false) {                
	    	   $.messager.alert("系统消息","上传图片类型不正确!");   
	    	   $(".table2 tr:last").remove();
	    	   var fileObj = document.getElementById('idFile') ; 
	    	   fileObj.outerHTML = fileObj.outerHTML; 
	           return false;            
	       }            
	       return false;        
       }    
    }

    function del(thisObj){
        if(confirm("确认删除此图片吗?")){
            $(thisObj).closest("tr").remove();
        }
    }

	 //显示图片  
    function over(key) {
        //大图显示的最大尺寸  4比3的大小  400 300  
        maxwidth = 400;
        maxheight = 300;
        obj = document.getElementById("divImage");
        imgbig = document.getElementById("imgbig");
        //显示  
         var localImagId=document.getElementById("localImag" + key);
         var localImagIe=document.getElementById("localImagIe");
         localImagIe.style.width = maxwidth+"px";                        
	     localImagIe.style.height = maxheight+"px"; 
         if(localImagId.filters){//ie下显示
           localImagIe.style.display = "";
           localImagIe.style.filter=localImagId.style.filter;
           localImagIe.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src;
           return;
         }
        
        obj.style.display = "";
        imgbig.src = document.getElementById("preview"+key).src;
        
        
        //1、宽和高都超过了，看谁超过的多，谁超的多就将谁设置为最大值，其余策略按照2、3  
        //2、如果宽超过了并且高没有超，设置宽为最大值  
        //3、如果宽没超过并且高超过了，设置高为最大值  

        if (img.width > maxwidth && img.height > maxheight) {
            pare = (img.width - maxwidth) - (img.height - maxheight);
            if (pare >= 0)
                img.width = maxwidth;
            else
                img.height = maxheight;
        }
        else if (img.width > maxwidth && img.height <= maxheight) {
            img.width = maxwidth;
        }
        else if (img.width <= maxwidth && img.height > maxheight) {
            img.height = maxheight;
        }
    }

    //隐藏图片 
    function out() {
         document.getElementById('divImage').style.display = "none";
    }
    function ieOut(){
          document.getElementById('localImagIe').style.display = "none";
    }

    function ajaxFileUpload(key)  
    {  
<%--        $("#loading").ajaxStart(function(){  --%>
<%--            $(this).show();  --%>
<%--        })//开始上传文件时显示一个图片  --%>
<%--         .ajaxComplete(function(){  --%>
<%--             $(this).hide();  --%>
<%--         });//文件上传完成将图片隐藏起来  --%>
        $.ajaxFileUpload({
            url:'/jtrc/typeInfo/fileUpload',               //需要链接到服务器地址
            secureuri:false,
            fileElementId:'idFile',                         //文件选择框的id属性
            dataType: 'text',                                     //服务器返回的格式，可以是json
            success: function (data, status)             //相当于java中try语句块的用法
            {   
                data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
					data = data.replace("</PRE>", '');
					data = data.replace("<pre>", '');
					data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
					//if(data.substring(0, 1) == 0){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
						var list = data.split("\\");
	                    var i = list.length-1;
                        $("#pic" + key).attr("value",list[i]);
						//$("img[id='pic']").attr("src", data.substring(2));
						//$('#result').html("图片上传成功<br/>");
					//}else{
						//$('#result').html('图片上传失败，请重试！！');
					//}
                //$('#result').html('上传图片成功!请复制图片地址<br/>'+data.src);

            },
            error: function (data, status, e)             //相当于java中catch语句块的用法
            {
                $('#result').html('上传图片失败');
                var fileObj = document.getElementById('idFile') ; 
 	    	    fileObj.outerHTML = fileObj.outerHTML;
            }
          }
        );
     }  
        
          

    function viewPic(picName){
        $("#imgbig").attr("src","/jtrc/typeInfo/getPicByPath?path=" + encodeURIComponent(picName));
        $("#divImage").css("display","");
    }
	</script>
</body>
</html>

