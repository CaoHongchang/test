<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>专场招聘会查看</title>
</head>
<body>
	<form id="fm" method="post">
         <table class="table2">
		      <tr>
			      <td class="left">招聘会名称</td>
			      <td ><input id ="name1" name="name" class="easyui-textbox" data-options="required:true,
			      	validType:['length[0,20]'],readonly:true
			      " size="30" style="height:22px"></td>
			  </tr>
			  <tr>
			      <td class="left">举办时间</td>
			      <td ><input id ="hold_time" name="hold_time" class="easyui-datebox" data-options="required:true,readonly:true" 
			       size="30" style="height:22px"></td>
		      </tr>
		      <tr>
			      <td class="left">举办地点</td>
			      <td ><input class="easyui-textbox" data-options="required:true,validType:['length[0,50]'],readonly:true" 
			      id ="hold_place" name="hold_place"  size="30" style="height:22px"></td>
			  </tr>
			  <tr>
		      	  <td class="left">性质</td>
		      	  <td >
		      	  	<input type="radio" class="easyui-validatebox" disabled="disabled" data-options="validType:['requireRadio[\'type\']'],readonly:true" name="type" value="1"/>普通专场招聘会
                    <input type="radio" class="easyui-validatebox" disabled="disabled" data-options="validType:['requireRadio[\'type\']'],readonly:true"  name="type" value="2"/>毕业生专场招聘会
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
	function exhibitionAddFun(){return;
		var data = $('#fairareaid').datagrid('getData');
		var areano = data.total + 1;
		$('#addPostDialog2').dialog({
            title: '展会区域新增',
            width: 400,
            height: 250,
            closed: false,
            cache: false,
            href: './fairAreaAdd.jsp?areano='+areano,
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){

                    var result = $("#fm2").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fm2"));
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
            iconCls: 'icon-save'
        });
	}
	// 展会删除
	function exhibitionDelFun(){return;
		var rows = $('#fairareaid').datagrid("getSelected");      
		if(rows == null){
			$.messager.show({
				title:'提示',
				msg:'请选中要删除的行。'
			});

			return;
		}
		$.messager.confirm('Confirm', '是否删除选中数据?', function(r) {  
    		
			if(r){
				var rows = $('#fairareaid').datagrid("getSelected");      
	    		$('#fairareaid').datagrid('deleteRow', rows.areano-1);  
			}
	       	
		});  
	}
	
	</script>
</body>
</html>
