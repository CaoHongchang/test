<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>更改序列</title>

<body>

<form id="fm" method="post">

    <div>
        <table class="table2">
            <tr hidden="true">
                <td class="left">id</td>
                <td class="right"><input id ="id" name="id" type="text" class="easyui-textbox" size="20" value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">序列</td>
                <td class="right"><input id ="orderNo" name="orderNo" type="text"  data-options="required:true" class="easyui-numberbox" value="1" data-options="min:1"  style="height:22px"></td>
            </tr>
        </table>
    </div>

</form>

</body>

</html>