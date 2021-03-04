<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>分类新增</title>

<body>

<form id="fm" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left">上级分类</td>
                <td class="right"><input id ="pName" data-options="editable:false" class="easyui-textbox" size="20" value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">序列</td>
                <td class="right"><input id ="orderNo"  data-options="editable:false" class="easyui-numberbox" value="" data-options="min:1"  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">本级分类编码</td>
                <td class="right"><input id ="typeCode" data-options="editable:false" class="easyui-textbox" size="20"  value="" style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">分类名称</td>
                <td class="right"><input id="typeName" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
            </tr>
        </table>
    </div>

</form>

</body>

</html>