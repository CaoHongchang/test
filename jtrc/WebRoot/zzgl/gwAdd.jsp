<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>岗位新增</title>

<body>

<form id="fm" method="post">
	<input type="hidden" id="id" name="id">
    <div>
        <table class="table2">
        	<tr>  
			   <td class="left">活动名称</td>
			   <td class="right">
			   <select id="activityCode" name="activityCode" data-options="editable:false" style="width: 240px"></select></td>
			</tr>
		    <tr>  
			   <td class="left">岗位代码</td>
			   <td class="right"><input id="postCode" name="postCode" data-options="editable:false" class="easyui-textbox" size="35"></td>
			</tr>
            <tr>
                <td class="left">岗位名称</td>
                <td class="right"><input id ="postName" name="postName" data-options="required:true" class="easyui-textbox" size="35"   ></td>
            </tr>
            <tr>
                <td class="left">备注</td>
                <td class="right"><input id ="remark" name="remark"  data-options="validType:'length[1,100]'" class="easyui-textbox" size="35"  ></td>
            </tr>
        </table>
    </div>



</form>

</body>

</html>