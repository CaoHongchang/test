<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
    <title>安全咨询合同管理</title>
    <script type="text/javascript">
        $(function(){

            $('#scbmGrid').datagrid({
                url:'../aqsczx/qryContractModel',
                border : true,
    			pageSize : 20,
    			pageList : [ 10, 20, 30, 40 ],
    			striped : true,
    			collapsible : true,
    			fitColumns : true,
    			height : wholeHeight,
    			toolbar : '#zcpshdTool',
    			pagination : true,
    			sortName : '',
    			sortOrder : 'desc',
    			remoteSort : false,
                columns:[[
                    {field:'mid',title:'合同编码',width : $(this).width() * 0.15,align:'center'},
                    {field:'addDate',title:'创建时间',width : $(this).width() * 0.2,align:'center'},
                    {field:'name',title:'合同名称',width : $(this).width() * 0.2,align:'center'},
                    {field:'isValid',title:'有效性',width : $(this).width() * 0.2,align:'center',
      	    		   formatter: function(value,row,index){
                           var delDate=row.delDate;
                           if(null != delDate){
                        	   return '否';
                           }else{
                        	   return '是';
                           }
  			           }   
			        },
                    {
     				   title:'操作',field:'uid',width:fixWidth(0.25),align:'center',
     	    		   formatter: function(value,row,index){
                           var id=row.id;
     			           return '<a href="javascript:upd(\''+id+'\')" style="color: blue;">修改</a> <a href="javascript:del(\''+id+'\')" style="color: blue;">删除</a> <a href="javascript:view(\''+id+'\')" style="color: blue;">查看</a>';
     			       }   
     			   }

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

        function add(){
            $('#reply').dialog({
                title: '合同新增',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: '../aqsczxywbl/aqzxhtAdd.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
	                	var result = $("#fm").form("validate");
	                	 var trainRemark=$("#contractName").textbox("getValue");
		    	            if(trainRemark==""){
								$.messager.alert("系统提示","合同名称不能为空");
								return false;
							}
							if(trainRemark.length>100){
								$.messager.alert("系统提示","合同名称长度不超过100位");
								return false;
							}
	                    if(result){
							if(judgeFile("file")){
								$('#fm').form('submit',{
									url:'../aqsczx/save?imgSize=10',
									success:function(data){
									  if(data==1){
										    alert("新增成功！");
		    								window.location.href = window.location.href;
									  }else{
										    $.messager.alert('系统提示',"数据异常");
									   }
									}
									
								});
							}
	                    }
                    }
                }, {
    				text : '关闭',
    				iconCls : 'icon-cancel',
    				handler : function() {
    					$('#reply').dialog('close');
    				}
    			}],
                iconCls: 'icon-save',
                onLoad : function() {
    				$.ajax({  
    					type: "post",  
    					cache: false,  
    					url: "../aqsczx/getNextMid",  
    					data: "",  
    					success: function (result) {  
    					   $('#fm #mid').textbox('setValue',result);
    					}  
    				});  
    			}
            });
        }

      //判断附件类型
    	function judgeFile(id){
    		var filename=$('#' + id).filebox('getValue');
      		if(filename!=""){
    	  		var suffix=filename.substring(filename.lastIndexOf("."),filename.length).toUpperCase();
    			
    			//判断文件类型* PNG ，JPEG ，TIFF，ZIP、RAR、DOC、DOCX、XLS、XLSX
    			var ftype=[".DOC",".DOCX"];
    			var flag=false;
    			for(var i=0;i<ftype.length;i++){
    				if(suffix==ftype[i]){
    					flag=true;
    					break;
    				}
    			}
    			if(!flag){
    				$.messager.alert('系统提示',"文件格式需为【DOC,DOCX】");
    			}else{
    <%--			    var filesize=files[0].size/1024/1024;--%>
    <%--				if(filesize>5){--%>
    <%--						$.messager.alert('系统提示',"文件大小不能大于5M");--%>
    <%--					    flag=false;--%>
    <%--				}--%>
    			}
    			return flag;
      		}else{
      		  return true;
      		 }
    		
         }

        function upd(id){
        	var rows = $("#scbmGrid").datagrid('getData').rows;
            var length = rows.length;
            var row;
            for (var i = 0; i < length; i++) {
                if (rows[i].id == id) {
                    row = rows[i];
                    break;
                }
            }
            $('#edit').dialog({
                title: '合同修改',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: '../aqsczxywbl/aqzxhtEdit.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
	                	var result = $("#fmEdit").form("validate");
	                	 var trainRemark=$("#name").textbox("getValue");
		    	            if(trainRemark==""){
								$.messager.alert("系统提示","合同名称不能为空");
								return false;
							}
							if(trainRemark.length>100){
								$.messager.alert("系统提示","合同名称长度不超过100位");
								return false;
							}
	                    if(result){
							if(judgeFile("path")){
								
								$('#fmEdit').form('submit',{
									url:'../aqsczx/update',
									success:function(data){
									  if(data==1){
										    alert("修改成功！");
		    								window.location.href = window.location.href;
									  }else{
										    $.messager.alert('系统提示',data);
									   }
									}
									
								});
							}
	                    }
                    }
                }, {
    				text : '关闭',
    				iconCls : 'icon-cancel',
    				handler : function() {
    					$('#edit').dialog('close');
    				}
    			}],
                iconCls: 'icon-save',
                onLoad : function() {
	            	$("#fmEdit").form("clear"); 
	    		    //$("#fmEdit").form("load",row);
	    		    $('#fmEdit #id').attr('value',row.id);
	    		    $('#fmEdit #mid').textbox('setValue',row.mid);
	    		    $('#fmEdit #name').textbox('setValue',row.name);
	    		    $('#fmEdit #addDate').textbox('setValue',row.addDate);
	    		    $('#fmEdit #path').textbox('setValue',row.path);
    			}
            });
        }

        function view(id){
        	var rows = $("#scbmGrid").datagrid('getData').rows;
            var length = rows.length;
            var row;
            for (var i = 0; i < length; i++) {
                if (rows[i].id == id) {
                    row = rows[i];
                    break;
                }
            }
            $('#view').dialog({
                title: '合同查看',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: '../aqsczxywbl/aqzxhtView.jsp',
                modal: true,
                buttons:[{
    				text : '关闭',
    				iconCls : 'icon-cancel',
    				handler : function() {
    					$('#view').dialog('close');
    				}
    			}],
                iconCls: 'icon-save',
                onLoad : function() {
	            	$("#fmView").form("clear"); 
	    		    //$("#fmView").form("load",row);
	    		    $('#fmView #mid').textbox('setValue',row.mid);
	    		    $('#fmView #name').textbox('setValue',row.name);
	    		    $('#fmView #addDate').textbox('setValue',row.addDate);
	    		    $('#fmView #path').textbox('setValue',row.path);
    			}
            });
        }


        function del(id){
        	if(confirm("确认删除此数据吗？")){
        		//if(confirm("二次确认是否删除此数据？")){
	               	$.ajax({  
	               		type: "post",  
	               		cache: false,  
	               		url: "../aqsczx/del?id=" + id,  
	               		data: '',  
	               		success: function (result) {  
	               		    if(result == 1){
	               			    alert("删除成功！");
	               				window.location.href = window.location.href;
	               			}else{
	               				$.messager.alert('系统提示',result);
	               			}
	               		}  
	               	});  
        		//}
             }
        }

        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var seperator2 = ":";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }
                

    </script>


<body style="margin: 1px;">
    <div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   
	    <div data-options="region:'center',border:false" style="">
	         <div id="zcpshdTool"  style="background-color:#FFFFFF;">
				<a id="a" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
			</div>
			<div>
			   <table id="scbmGrid"></table>  
			</div>
	    </div>   
	</div>
    <div id="reply"></div>
    <div id="edit"></div>
    <div id="view"></div>
</body>
</html>
