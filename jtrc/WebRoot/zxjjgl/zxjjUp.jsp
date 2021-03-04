<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>内容修改</title>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<body>
<script>
   $(function(){
	   CKEDITOR.replace("content");
   });
</script>
<form id="fm" method="post" enctype="multipart/form-data">

    <div>
        <table class="table2">
             <tr>
                <td class="left">编码</td>
                <td class="right"><input id ="id" name="id" data-options="editable:false" class="easyui-textbox" size="20" value=""  style="height:22px" ></td>
            </tr>
            <tr>
                <td class="left">目录</td>
                <td class="right"><input id ="name" name="name" data-options="required:true,min:1" class="easyui-textbox"  value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">Url</td>
                <td class="right"><input id ="url" name="url" data-options="editable:false" class="easyui-textbox"  value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">标题</td>
                <td class="right"><input id ="title" name="title" class="easyui-textbox"  value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">内容</td>
                <!--<td class="right"><textarea id ="content" name="content" data-options="required:true,min:1,multiline:true" class="easyui-textbox"   value=""  style="height:100px;width: 350px;"></textarea></td>-->
            	<td class="right" colspan="3"><textarea id="content" name="content" cols="10" rows="5" class="ckeditor" disalbed="enable"></textarea></td>
            
            </tr>
        </table>
    </div>

</form>

</body>

</html>