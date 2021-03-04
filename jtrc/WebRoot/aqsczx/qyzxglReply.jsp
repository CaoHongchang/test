<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>

    <title>回复</title>

<body>

<div>
<form id="fm1" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >企业名称</td>
                <td class="right"><input id ="orgName" name="orgName"   class="easyui-textbox" size="20"   ></td>
                <td class="left">咨询时间</td>
                <td class="right"><input id ="queryTime" name="queryTime"   class="easyui-textbox" size="20"  ></td>
            </tr>
            <tr>
                <td class="left" >咨询对象</td>
                <td class="right"><input id ="queryOrg" name="queryOrg"  class="easyui-textbox" size="20"   ></td>
                <td class="left">业务办理阶段</td>
                <td class="right"><input id ="status" name="projectName"  class="easyui-textbox" size="20"  ></td>
            </tr>
            <tr>
                <td class="left" >主题</td>
                <td class="right"><input id ="title" name="title"  class="easyui-textbox" size="20"   ></td>
            </tr>
            <tr>
                <td class="left" >咨询内容</td>
                <td class="right"><input id ="queryContent" name="queryContent" data-options="multiline:true"  class="easyui-textbox" style="height: 80px;width: 150px"   ></td>
            </tr>
        </table>
    </div>
</form>
</div>
<hr style="height:2px;border:none;border-top:1px solid #555555;" />
<div>
    <form id="fm" method="post">

        <div>
            <table class="table2">
                <tr>
                    <td class="left" >回复内容</td>
                    <td class="right"><input id ="replyContent" name="replyContent" data-options="multiline:true,required:true"  class="easyui-textbox" style="height: 60px;width: 300px"   ></td>
                </tr>
                <tr>
                    <td class="left">附件</td>
                    <td class="right"><input id ="file" data-options="required:true" class="easyui-filebox" size="20" value=""  style="height:22px"></td>
                </tr>
            </table>
        </div>
    </form>
</div>

</body>

</html>