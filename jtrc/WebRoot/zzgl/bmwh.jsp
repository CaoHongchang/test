<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>

    <title>部门新增</title>

<body>

<form id="fm" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >组织机构代码</td>
                <td class="right"><input id ="orgCode" name="orgCode"  data-options="editable:false" class="easyui-textbox" size="20"   ></td>
                <td class="left">单位名称</td>
                <td class="right"><input id ="orgName" name="orgName"  data-options="editable:false" class="easyui-textbox" size="20"  ></td>
            </tr>
        </table>
    </div>

    <table id="deptGrid"></table>

</form>

</body>

</html>