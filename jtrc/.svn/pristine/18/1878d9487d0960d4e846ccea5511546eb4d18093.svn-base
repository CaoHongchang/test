<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>专场招聘会查看</title>
</head>
<body>
	<form id="fm" method="post">
   		<input type="hidden" name="id" id="id"/>
         <table class="table2">
		      <tr>
			      <td class="left">招聘会名称</td>
			      <td ><input id ="name1" name="name" class="easyui-textbox" data-options="required:true,
			      	validType:['length[0,20]']
			      " size="30" style="height:22px"></td>
			  </tr>
			  <tr>
			      <td class="left">举办时间</td>
			      <td ><input id ="hold_time" name="hold_time" class="easyui-datebox" data-options="required:true"  size="30" style="height:22px"></td>
		      </tr>
		      <tr>
			      <td class="left">举办地点</td>
			      <td ><input class="easyui-textbox" data-options="required:true,validType:['length[0,50]']" id ="hold_place" name="hold_place"  size="30" style="height:22px"></td>
			  </tr>
			  <tr>
		      	  <td class="left">性质</td>
		      	  <td >
		      	  	<input type="radio" class="easyui-validatebox" data-options="validType:['requireRadio[\'type\']']" name="type" value="1"/>普通专场招聘会
                    <input type="radio" class="easyui-validatebox" data-options="validType:['requireRadio[\'type\']']"  name="type" value="2"/>毕业生专场招聘会
		      	  </td>
		      </tr>
		      <tr>
		      	  <td class="left" colspan="2" style="text-align:left;padding-left:20px;">招聘会内容</td>
		      </tr>
		      <tr>
		      	  <td colspan="2">
		      	  	<textarea name="content" cols="" rows="10" id="content" class="span1-2" style="width:90%;"></textarea>
		      	  </td>
		      </tr>
		       <tr>
		      	  <td class="left" colspan="2" style="text-align:left;padding-left:20px;">展位说明</td>
		      </tr>
		      <tr>
		      	  <td colspan="2">
		      	  	<textarea name="explainContent" cols="" rows="10" id="explainContent" class="span1-2" style="width:90%;"></textarea>
		      	  </td>
		      </tr>
      	</table>  

   <div id="aa" class="easyui-accordion" style="height:200px;">  
      <div title="展会区域" data-options="fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <div id="zcxxTool"  style="background-color:#FFFFFF;">
	            <a onclick="exhibitionAddFun()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
	             <a onclick="exhibitionEditFun()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
	            <a onclick="exhibitionDelFun()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		  </div>
		  <div>
	          <table id="fairareaid" class="easyui-datagrid" >
			  </table>
		  </div>
       </div>
    </div>
    </form> 
    <script type="text/javascript">
	$(function(){
		
		var dg = $('#fairareaid').datagrid({
			singleSelect:true,
			columns:[[    
	            {field:'areano',name:'areano',title:'区数',width:60},    
	            {field:'positioncount',name:'positioncount',title:'展位数',width:60},
	            {field:'description',name:'description',title:'描述',width:200}
	        ]]
		});
	});
	
	// 展会新增
	function exhibitionAddFun(){
		var data = $('#fairareaid').datagrid('getData');
		$('#addPostDialog2').dialog({
            title: '展会区域新增',
            width: 400,
            height: 250,
            closed: false,
            cache: false,
            href: './fairAreaAdd.jsp',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fm2").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fm2"));
                    	var data = $('#fairareaid').datagrid('getData');
            			var str = "";
            			for(var i=0;i<data.rows.length;i++){
            				var it = data.rows[i];
            				if(it.areano == obj.areano){
            					$.alert("此分区名称已经存在,请重新输入");
            					return;
            					break;
            				}
            			}
                    	$('#fairareaid').datagrid('appendRow', obj);
						$('#addPostDialog2').dialog('close');
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#addPostDialog2').dialog('close');
                }
            }],
            onLoad : function(){
            	
            },
            iconCls: 'icon-save'
        });
	}
	
	function exhibitionEditFun(){
		var rows = $('#fairareaid').datagrid("getSelected");      
		if(rows == null){
			$.messager.show({
				title:'提示',
				msg:'请选中要修改的展会区域。'
			});
			return;
		}
		$('#addPostDialog2').dialog({
            title: '展会区域修改',
            width: 400,
            height: 250,
            closed: false,
            cache: false,
            href: './fairAreaEdit.jsp',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fm2").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fm2"));
                    	var data = $('#fairareaid').datagrid('getData');
            			var str = "";
            			for(var i=0;i<data.rows.length;i++){
            				var it = data.rows[i];
            				if(it.areano == obj.areano && obj.areano != rows.areano){
            					$.alert("此分区名称已经存在,请重新输入");
            					return;
            					break;
            				}
            			}
            			var opt = {
            				index : $('#fairareaid').datagrid("getRowIndex", rows),
            				row : obj
            			}
                    	$('#fairareaid').datagrid('updateRow', opt);
						$('#addPostDialog2').dialog('close');
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#addPostDialog2').dialog('close');
                }
            }],
            iconCls: 'icon-save',
            onLoad : function(){
            	$("#fm2").form("load",{
            		id : rows.id,
            		areano : rows.areano,
           			description : rows.description,
        			positioncount: rows.positioncount
            	});
            }
        });
	}
	
	// 展会删除
	function exhibitionDelFun(){
		var rows = $('#fairareaid').datagrid("getSelected");
		if(rows == null){
			$.messager.show({
				title:'提示',
				msg:'请选中要删除的行。'
			});
			return;
		}
		$.messager.confirm('系统提示', '是否删除选中数据?', function(r) {  
			var index = $('#fairareaid').datagrid("getRowIndex", rows);
			if(r){
				$.ajax({
             		url: eve.path + '/jobFair/delArea',
             		context:this,
             		data : {id : rows.id},
             		type:'POST',
             		success:function(data){
             			
					}
             	})
	    		$('#fairareaid').datagrid('deleteRow', index);  
			}
		});
	}
	</script>
</body>
</html>
