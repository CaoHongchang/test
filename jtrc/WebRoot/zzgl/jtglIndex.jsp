<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){

            $('#zxflGrid').tree({
                url:'',
                checkbox:false,

                onClick:function(node){
                    var id = node["id"];
                    $('#zxGrid').datagrid('load',{
                        pid:id
                    });
                }
            });


            $('#zxGrid').datagrid({
                url:'',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
                collapsible:true,
                fitColumns:true,
                height: '100%',
                toolbar: '',
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'id1',title:'选择',checkbox:true,align:'center'},
                    {field:'code',title:'集团代码',width : $(this).width() * 0.1,align:'center'},
                    {field:'orgName',title:'单位名称',width : $(this).width() * 0.1,align:'center'},
                    {field:'available',title:'有效性',width : $(this).width() * 0.2,align:'center'},
                    {field:'source',title:'信息来源',width : $(this).width() * 0.2,align:'center'},
                    {field:'creator',title:'录入人',width : $(this).width() * 0.1,align:'center'},
                    {field:'createTime',title:'录入时间',width : $(this).width() * 0.2,align:'center'}

                ]]
            });
            var pager = $('#zxGrid').datagrid('getPager');
            pager.pagination({
                beforePageText : '第',// 页数文本框前显示的汉字
                afterPageText : '/ {pages} 页',
                displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
                buttons : [ {
                    iconCls : 'icon-excel',
                    handler : function() {
                    }
                } ]
            });

        });

        function addType(){
            $('#addMsgDialog').dialog({
                title: '集团新增',
                width: 500,
                height: 600,
                closed: false,
                cache: false,
                href: '../zzgl/jtAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){

                        var result = $("#fm").form("validate");
                        if(result){
                            $("#fm").form("submit");
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addMsgDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save'

            });
        }


    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-edit'">失效</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>


</div>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'集团列表',split:true,border:false" style="width:300px;">
        <table id="zxflGrid"></table>


    </div>
    <div data-options="region:'center',title:'集团管理',border:false" style="">
        <table id="zxGrid"></table>
    </div>
</div>



<div id="addMsgDialog"></div>
<div id="updateNo"></div>

</body>
</html>
