<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){

            $('#sclxGrid').tree({
                url:'',
                checkbox:false,

                onClick:function(node){
                    var id = node["id"];
                    $('#scbmGrid').datagrid('load',{
                        pid:id
                    });
                }
            });



            $('#scbmGrid').datagrid({
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
                    {field:'createTime',title:'报名时间',width : $(this).width() * 0.1,align:'center'},
                    {field:'orgCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
                    {field:'orgName',title:'企业名称',width : $(this).width() * 0.2,align:'center'},
                    {field:'projectTitle',title:'申请项目',width : $(this).width() * 0.2,align:'center'},
                    {field:'checkStatus',title:'报名审核状态',width : $(this).width() * 0.1,align:'center'},
                    {field:'signStatus',title:'合同签订状态',width : $(this).width() * 0.2,align:'center'}

                ]]
            });
            var pager = $('#scbmGrid').datagrid('getPager');
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



    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a  class="easyui-linkbutton" data-options="iconCls:'icon-add'">报名审核</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-edit'">合同签订确认</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>


</div>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'安全生产类型',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>


    </div>
    <div data-options="region:'center',title:'安全生产报名审核',border:false" style="">
        <table id="scbmGrid"></table>
    </div>
</div>



<div id="addMsgDialog"></div>
<div id="updateNo"></div>

</body>
</html>
