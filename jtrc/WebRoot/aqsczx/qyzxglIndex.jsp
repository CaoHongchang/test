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
                    {field:'orgName',title:'企业名称',width : $(this).width() * 0.1,align:'center'},
                    {field:'queryOrg',title:'咨询对象',width : $(this).width() * 0.1,align:'center'},
                    {field:'queryTime',title:'咨询时间',width : $(this).width() * 0.2,align:'center'},
                    {field:'status',title:'业务办理阶段',width : $(this).width() * 0.2,align:'center'},
                    {field:'topic',title:'主题',width : $(this).width() * 0.1,align:'center'},
                    {field:'queryContent',title:'咨询内容',width : $(this).width() * 0.2,align:'center'},
                    {field:'replyContent',title:'回复内容',width : $(this).width() * 0.2,align:'center'}

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

        function reply(){
            $('#reply').dialog({
                title: '回复',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: '../aqsczxywbl/qyzxglReply.jsp',
                modal: true,
                buttons:[{
                    text:'回复',
                    iconCls:'icon-ok',
                    handler:function(){

                        var result = $("#fm").form("validate");
                        if(result){
                            $("#fm").form("submit");
                        }
                    }
                }],
                iconCls: 'icon-save'

            });

        }

    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a  onclick="reply()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">回复</a>


</div>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'企业咨询管理',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>


    </div>
    <div data-options="region:'center',title:'企业咨询管理',border:false" style="">
        <table id="scbmGrid"></table>
    </div>
</div>



<div id="reply"></div>

</body>
</html>
