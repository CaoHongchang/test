<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>

    <title>新增</title>

<body>

<form id="fm"  method="post" enctype="multipart/form-data">

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
                <td class="right"><input id ="contractName" name="contractName"   class="easyui-textbox" size="20"  style="height:22px" ></td>
                <td class="left">创建时间</td>
                <td class="right"><input id ="addDate" name="addDate"   class="easyui-textbox" size="20" style="height:22px"  ></td>
            </tr>
            <tr>
                <td class="left" >合同文件</td>
                <td class="right" colspan="3"><input id ="file" name="file" data-options="buttonText:'&nbsp;选&nbsp;择&nbsp;',required:true" class="easyui-filebox" size="40" value=""  style="height:22px">  
                </td>
            </tr>
            <tr>
                <td colspan="4" style="color:red;text-align:left">*合同文件只允许是doc或docx格式</td>
            </tr>
        </table>
    </div>

</form>
<script type="text/javascript">
		var myDate = getNowFormatDate();
		$("#fm input[name='addDate']").attr("value",myDate);
	</script>
</body>
</html>