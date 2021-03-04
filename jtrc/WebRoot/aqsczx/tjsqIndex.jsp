<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>

    <script type="text/javascript">
        $(function () {

            $('#sclxGrid').tree({
                url: '',
                checkbox: false,

                onClick: function (node) {
                    var id = node["id"];
                    $('#scbmGrid').datagrid('load', {
                        pid: id
                    });
                }
            });

        });

        function addColumn() {
            var childOrgs = $("#fm").find(".childOrg");
            var size = childOrgs.length;
            var currentNo = size + 1;
            var html = "<tr class='childOrg'> " +
                    "<td class='left'>子属企业" + currentNo + "</td> " +
                    "<td class='right'> " +
                    "<input id='childOrg" + currentNo + "' class='easyui-textbox textbox-f' size='20' style='height: 22px; display: none;' textboxname='childOrg" + currentNo + "'> " +
                    "<span class='textbox' style='width: 144px; height: 20px;'>  " +
                    " <input type='text' class='textbox-text validatebox-text textbox-prompt' autocomplete='off' placeholder='' style='margin-left: 0px; margin-right: 0px; padding-top: 0px; padding-bottom: 0px; height: 20px; line-height: 20px; width: 136px;'>  " +
                    "<input type='hidden' class='textbox-value' name='childOrg" + currentNo + "' value=''> " +
                    "</span>  " +
                    "</td>   " +
                    "</tr>  ";
            $(childOrgs[size - 1]).after(html);
        }

    </script>


<body style="margin: 1px;">
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'企业咨询管理',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>


    </div>
    <div data-options="region:'center',title:'企业咨询管理',border:false" style="">
        <form id="fm" method="post">

            <div>
                <table class="table2">
                    <tr>
                        <td class="left">企业名称</td>
                        <td class="right"><input id="orgName" name="orgName" class="easyui-textbox" size="20"
                                                 style="height:22px"></td>
                    </tr>
                    <tr class="childOrg">
                        <td class="left">子属企业1</td>
                        <td class="right"><input id="childOrg1" name="childOrg1" class="easyui-textbox" size="20"
                                                 style="height:22px"></td>
                    </tr>
                    <tr class="childOrg">
                        <td class="left">子属企业2</td>
                        <td class="right"><input id="childOrg2" name="childOrg2" class="easyui-textbox" size="20"
                                                 style="height:22px"></td>
                    </tr>
                    <tr>
                        <td class="left"></td>
                        <td class="right"><a href="javascript:void(0)" onclick="addColumn()">+添加</a></td>
                    </tr>
                    <tr>
                        <td class="left">申请项目</td>
                        <td class="right">
                            <select class="easyui-combobox" name="applyProject" data-options="required:true"
                                    style="width: 150px">

                            </select>
                        </td>
                    </tr>
                </table>
            </div>

        </form>

        <div style="margin-left: 80px;padding-left: 5px;">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="">取消</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="">提交</a>
        </div>

    </div>
</div>
</body>
</html>
