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
                    {field:'orgCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
                    {field:'orgName',title:'企业名称',width : $(this).width() * 0.2,align:'center'},
                    {field:'cardType',title:'证件类型',width : $(this).width() * 0.2,align:'center'},
                    {field:'imagePreview',title:'图片预览',width : $(this).width() * 0.1,align:'center',formatter:imagePreview},
                    {field:'imageDownload',title:'图片下载',width : $(this).width() * 0.1,align:'center',formatter:imageDownload}

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

        function imagePreview(value,row,index){
            return "<div>" +
                    "<a href='javascript:void(0)'  rowid='"+row.id+"' >预览</a>"+
                    "</div>";
        }

        function imageDownload(value,row,index){
            return "<div>" +
                    "<a href='javascript:void(0)'  rowid='"+row.id+"' >下载</a>" +
                    "</div>";
        }



    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a  class="easyui-linkbutton" data-options="iconCls:'icon-add'">增加</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
    <a  class="easyui-linkbutton" data-options="iconCls:'icon-search'">下载</a>


</div>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'安全生产证件管理',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>

    </div>
    <div data-options="region:'center',title:'安全生产证件管理',border:false" style="">
        <table id="scbmGrid"></table>
    </div>
</div>



<div id="addMsgDialog"></div>
<div id="updateNo"></div>

</body>
</html>
