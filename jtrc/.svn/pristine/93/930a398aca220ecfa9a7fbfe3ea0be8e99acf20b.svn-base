<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>

    <title>修改</title>

<body>

<form id="fmEdit" method="post"  enctype="multipart/form-data">
    <input type="hidden" id="id" name="id"/>
    <div>
        <table class="table2">
            <tr>
                <td class="left" >合同编码</td>
                <td class="right"><input id ="mid" name="mid" readonly="readonly" class="easyui-textbox" size="20"  style="height:22px" ></td>
                <td class="left" ></td>
                <td class="left" ></td>
            </tr>
            <tr>
                <td class="left" >合同名称</td>
                <td class="right"><input id ="name" name="name"   class="easyui-textbox" size="20"  style="height:22px" ></td>
                <td class="left">创建时间</td>
                <td class="right"><input id ="addDate" name="addDate"  readonly="readonly"  class="easyui-textbox" size="20" style="height:22px"  ></td>
            </tr>
            <tr>
                <td class="left" >合同文件</td>
                <td class="right" colspan="3"><input id ="path" name="path" data-options="buttonText:'&nbsp;选&nbsp;择&nbsp;',required:true" class="easyui-filebox" size="40" value=""  style="height:22px">  
                </td>
            </tr>
            <tr>
                <td colspan="4" style="color:red;text-align:left">*合同文件只允许是doc或docx格式</td>
            </tr>
        </table>
    </div>

</form>
<script type="text/javascript">

		function ajaxFileUpload(obj)  
	    {  
			var array = new Array('doc', 'docx'); //可以上传的文件类型
			if (obj.value == '') {           
				$.messager.alert("系统消息","请选择选择要上传的合同!");            
			     return false;        
		    }else {
		    	var reg = /^(.*)(\.)(.{1,8})$/;
		        var fileContentType = obj.value.match(reg)[3];//这个文件类型正则很有用             ////布尔型变量 
		        var isExists = false;            //循环判断图片的格式是否正确             
		        for (var i in array) {                
		            if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
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
								var list = data.split("\\");
			                    var i = list.length-1;
			                    var oldElement = jQuery('#jUploadFile' +id ,form);
			                    var newElement =  jQuery('#'+s.fileElementId );
			                    jQuery(newElement).replaceWith(oldElement);
			                    jQuery(oldElement).attr('id', s.fileElementId ); 
				            },
				            error: function (data, status, e)             //相当于java中catch语句块的用法
				            {
				                $('#result').html('上传失败');
				                var fileObj = document.getElementById('idFile') ; 
				 	    	    fileObj.outerHTML = fileObj.outerHTML;
				            }
				          }
				        );
		            	isExists = true;  
		            }
		        }
		        if (isExists == false) {                
		    	   $.messager.alert("系统消息","上传类型不正确!");   
		        }            
		    }
	     }  
	</script>
</body>
</html>