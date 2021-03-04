<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>

    <title>查看</title>

<body>

<form id="fm" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >申请排查时间</td>
                <td class="right"><input id ="lastCheckDate" name="lastCheckDate"   class="easyui-textbox" size="20"   ></td>
                <td class="left">组织机构代码</td>
                <td class="right"><input id ="cCode" name="cCode"   class="easyui-textbox" size="20"  ></td>
            </tr>
            <tr>
                <td class="left" >企业名称</td>
                <td class="right"><input id ="name" name="name"  class="easyui-textbox" size="20"   ></td>
                <td class="left">申请项目</td>
                <td class="right"><input id ="projectName" name="projectName" class="easyui-textbox" size="20"  ></td>
            </tr>
        </table>
    </div>

    <table id="deptGrid"></table>

</form>

</body>

</html>