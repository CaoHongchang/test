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
                    {field:'orderNo',title:'编号',width : $(this).width() * 0.1,align:'center'},
                    {field:'applyTime',title:'申请时间',width : $(this).width() * 0.1,align:'center'},
                    {field:'applyOrg',title:'申请企业',width : $(this).width() * 0.2,align:'center'},
                    {field:'applyProject',title:'申请项目',width : $(this).width() * 0.2,align:'center'},
                    {field:'status',title:'受理状态',width : $(this).width() * 0.1,align:'center'},
                    {field:'_operate',title:'操作',width : $(this).width() * 0.2,align:'center',formatter:formatOper}

                ]] ,
                queryParams: form2Json("searchform"),
                data:[
                    {orderNo:1,applyTime:"2016-04-05",applyOrg:"XXXX",applyProject:"QQQQQQ",status:"Q"}
                ]
            });
            $("#submit_search").linkbutton({ iconCls: 'icon-search', plain: true })
                    .click(function () {
                        $('#scbmGrid').datagrid({ queryParams: form2Json("searchform") });   //点击搜索
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

        function view(){
            $('#view').dialog({
                title: '进度明细',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: '../aqsczxywbl/jdmxIndex.jsp',
                modal: true,
                buttons:[{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){

                        var result = $("#fm").form("validate");
                        if(result){
                            $("#fm").form("submit");
                        }
                    }
                },{
                    text:'打印',
                    iconCls:'icon-print',
                    handler:function(){
                        $('#view').dialog('close');
                    }
                }],
                iconCls: 'icon-save'

            });

        }

        function formatOper(value,row,index)
        {
            return "<div>" +
                    "<a href='/aqsczxywbl/jdmxIndex.jsp?id="+row.orderNo+"'  rowid='"+row.id+"'  target='_self'>查看</a>&nbsp;&nbsp;" +
                    "<a href='javascript:void(0)' rowid='"+row.id+"' >重新申请</a>" +
                    "</div>";
        }

        //将表单数据转为json
        function form2Json(id) {

            var arr = $("#" + id).serializeArray();
            var jsonStr = "";

            jsonStr += '{';
            for (var i = 0; i < arr.length; i++) {
                jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
            }
            jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
            jsonStr += '}';

            var json = JSON.parse(jsonStr);
            return json
        }

    </script>


<body style="margin: 1px;">

<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'安全生产咨询',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>


    </div>
    <div data-options="region:'center',title:'安全生产咨询列表',border:false" style="">
        <form name="searchform" method="post" action="" id ="searchform">
            <td height="30">
                <input type="text" name="keyword" size=20 placeholder="申请企业" >
                <select name="search_type" id="search_type" >
                    <option value="-1">申请项目</option>
                </select>
                <select name="search_dept" id="search_dept">
                    <option value="-1">受理状态</option>
                </select>
                <a id="submit_search">查询</a>
            </td>
          </form>
        <table id="scbmGrid"></table>
    </div>
</div>



<div id="view"></div>

</body>
</html>
