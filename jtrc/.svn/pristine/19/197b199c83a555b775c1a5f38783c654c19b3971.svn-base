<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
</head>
<body>
	<form id="fmchangeArea" method="post">
		<input type="hidden" id="id1" name="id"/>
		<input type="hidden" id="fairid1" name="fairid"/>
		<input id="areaid" name="areaid" type="hidden">
         <table class="table2">
		      <tr>
			      <td class="left">企业名称</td>
			      <td><input id="name1" class="easyui-textbox" name="name" data-options="required:true,readonly:true" 
			           size="30" style="height:22px"></td>
			  </tr>
			  <tr>
			      <td class="left">区数</td>
			      <td>
			      
			      	<!-- <input id="areano" name="areano" class="easyui-textbox" data-options="required:true,validType:['length[0,20]']" 
			      		size="30" style="height:22px"> -->
			      		
			      	<select id="areano" name="areano" class="easyui-combobox" data-options="editable:false,panelHeight:null" style="width:180px" />
					</select>		
	      		  </td>
		      </tr>
		      <tr>
			      <td class="left">展位号</td>
			      <td ><input type="text" class="easyui-numberbox" data-options="required:true,min:0,max:499,validType:['length[0,3]']" 
			      id ="positionno" name="positionno"  size="30" style="height:22px">
			  </tr>
			  
      	</table>  
    </form> 
    <script type="text/javascript">
	$(function(){
		
		var fairid= eve.obj.fair_id
		$.ajax({
			url: eve.path + '/netJobFairApply/getFairAreaByFairid',
			context:this,
			type:'post',
			data:{fairid:fairid},
			success:function(r){
				var data = $.parseJSON(r);
				var list = data.list;
				
				$('#areano').combobox({
					data : list,
				    valueField:'id',    
				    textField:'areano',
				    value:eve.obj.area_no,
				    onSelect:function(r){
				    	$("#areaid").val(r.id);
						//$("#areano").textbox('setValue',rowData.area_no);
				    }
				});

			}
		})
		
		
	});
	</script>
</body>
</html>
