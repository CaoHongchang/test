<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>业务分类新增</title>
</head>

<body>
	<form id="fm" method="post">
		<div>
			<table class="table2">
				<tr>
					<td class="left">
						业务编码
					</td>
					<td class="right">
						<input id="code" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
					<td class="left">
						业务名称
					</td>
					<td class="right">
						<input id="typeName" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
				</tr>
				<tr>
					<td class="left">
						业务分类
					</td>
					<td class="right">
						<input id="typeName" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
					<td class="left">
						材料递送方向
					</td>
					<td class="right">
					    <select id="cldsfx" class="easyui-combobox" style="width:150px;height: 22px">
							<option value="0">寄出</option>
							<option value="0">回收</option>
						</select>
					</td>
				</tr>
				<tr>
                    <td class="left">业务说明</td>
                    <td class="right" colspan="3"  style="padding-right: 30px">
                        <textarea name="aboutusDescription" cols="" rows="8" id="aboutusDescription" class="span1-2" style="width:90%;">
		                </textarea> 
                    </td>
                 </tr>
                 <tr>
                    <td class="left">选择图片:</td>
                    <td class="right">
                        <input id="idFile" class="easyui-filebox" data-options="onChange:setImagePreview,buttonText:'选择'" style="width: 224px" runat="server" name="pic"
						/>
                    </td>
                    <td class="left">图片不能超过2M</td>
                    <td class="right">
                    </td>
                 </tr>
			</table>
			<%--显示大图标的区域--%>  
	        <div id="divImage" style="display: none;left:40px;top:40px;position: absolute">  
	            <img id="imgbig" onclick="out();" src="" alt="大图" />  
	        </div>
		</div>
	</form> 
	<script type="text/javascript">
	var maxSize = 2 * 1024 * 1024;
	var k = 0;

	//检查图片的格式是否正确,同时实现预览   
	function setImagePreview() {    
		var obj = $("input[id='idFile']");
		var array = new Array('jpeg', 'png', 'jpg'); //可以上传的文件类型        
		if (obj.value == '') {           
			$.messager.alert("请选择要上传的图片!");            
		     return false;        
	    }else {
	    	var str = '<tr valign="bottom">';
            str += '<td class="left" colspan="3">';
            str += '<div id="localImag'+k+'">';
            str += '<img id="preview'+k+'" src="" style="width: 200px; height: 150px;hover{width:400px;height:300px;}"/>';
            str += '</div>';
            str += '</td>';
            str += '<td class="right">';
            str += '<a onclick="over('+k+')" class="easyui-linkbutton" data-options="iconCls:\'icon-tip\',plain:true">预览</a>';
            str += '<a onclick="del(this)" class="easyui-linkbutton" data-options="iconCls:\'icon-remove\',plain:true">删除</a>';
            str += '</td>';
            str += '</tr>';
            $(".table2").append(str);
            $.parser.parse($(".table2"));
            var localImagId = document.getElementById("localImag" + k);
            var imgObjPreview = document.getElementById("preview" + k);
		                
	    	var reg = /^(.*)(\.)(.{1,8})$/;
	        var fileContentType = obj.value.match(reg)[3];//这个文件类型正则很有用             ////布尔型变量            
	        var isExists = false;            //循环判断图片的格式是否正确            
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
	                         localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader=").src = imgSrc;   
	                     } catch (e) {                            
	                    	 $.messager.alert("您上传的图片格式不正确，请重新选择!");                            
	                         return false;                        
	                     }                        
	                     imgObjPreview.style.display = 'none';                        
	                     document.selection.empty();  
	                     k = k+1;      
	                }    
	                isExists = true;  
	                return true;                
	            }            
	       }            
	       if (isExists == false) {                
	    	   $.messager.alert("上传图片类型不正确!");   
	    	   $(".table2 tr:last").remove();
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
	</script>
</body>
</html>

