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
                    {field:'account',title:'安全员帐号',width : $(this).width() * 0.1,align:'center'},
                    {field:'queryOrg',title:'咨询对象',width : $(this).width() * 0.1,align:'center',formatter:changeStatus}

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

        function updateStatus(){

        }

        function changeStatus(value,row,index){
            return "<div>" +
                    "<a href='javascript:void(0)'  rowid='"+row.id+"'   >打开</a>"+
                    "</div>";
        }

    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a  onclick="updateStatus()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">切换咨询开关</a>


</div>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'安全咨询开关',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>


    </div>
    <div data-options="region:'center',title:'安全咨询开关管理',border:false" style="">
        <table id="scbmGrid"></table>
    </div>
</div>



<div id="reply"></div>

</body>
</html>
