<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  %>
<html>
<head>
<title>专家导入</title>

<body>
<script type="text/javascript">


  $(document).ready(function(){
               queryPro_type();
               $("#pro_type1").combobox({
               onChange: function (n,o) {
                var pro_type = $("#pro_type1").combobox('getValue')
                pro_type=encodeURI(pro_type);
                //pro_type =  URLEncoder.UrlEncode(pro_type,"UTF-8");
               		$('#markGrid').datagrid('reload','/jtrc/userExpertInfoTrol/queryExpertUserListOrder?pro_type='+pro_type);  
					}
               });
  })
  function queryPro_type(){
//活动编号
				$('#pro_type1').combobox({
					valueField : 'pro_type',
					textField : 'pro_type',
					url : basePath + 'userExpertInfoTrol/hdbhList',
				});

  }
  
function searchName(){
		$('#markGrid').datagrid('load',{
			s_username_no:$("#expertName").textbox('getValue'),
			pro_type:$("#pro_type1").combobox('getValue')
		});
	}  
	
function mark(){
	 var data = $('#markGrid').datagrid("getSelections");//所有的全部数据
	 if(data.length>0){
	      var ids=''; 
	      for(var i = 0; i < data.length; i++){
	           if(i==0)
	               ids=data[i].id;
	           else    
	               ids+=','+data[i].id;
	      } debugger;
       		//window.location.href=basePath+"zcsb/markExpert?zpnos="+zpnos;
       			$.ajax({  
					type: "post",  
					cache: false,  
					url: "../zcsb/markExpert?ids="+ids,  
					//data: "zpnos=" + $("#zpnos").val() ,  
					success: function (result) {  
						$('#markGrid').datagrid('reload');
						$.messager.alert('提示',"操作成功",'info');
					}  
				}); 
		
       		
       			 
   	}else{
       $.messager.alert('提示',"请选择后再操作",'info');
	 }
	 
}
function cacelMark(){
	 var data = $('#markGrid').datagrid("getSelections");//所有的全部数据
	 if(data.length>0){
	      var zpnos=''; 
	      for(var i = 0; i < data.length; i++){
	           if(i==0)
	               zpnos=data[i].id;
	           else    
	               zpnos+=','+data[i].id;
	      } debugger;
       		$.ajax({  
					type: "post",  
					cache: false,  
					url: "../zcsb/cancelMark?zpnos="+zpnos,  
					success: function (result) {  
						$('#markGrid').datagrid('reload');
       					$.messager.alert('提示',"操作成功",'info');
					}  
				}); 

   	}else{
       $.messager.alert('提示',"请选择后再操作",'info');
	 }
}

function queryzj(param){

   //专家
    $('#markGrid').datagrid({    
     url:'/jtrc/userExpertInfoTrol/queryExpertUserListMore',  
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	fitColumns:true,
	//	collapsible:true,
	height: 300,
	//fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	pagination : true,
	queryParams: {
		param: param
	},  
	onLoadSuccess: function (data) {debugger;
    },
    columns:[[    
        	
       	{field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'zpno',align:'center',title:'编码',width: $(this).width() *0.15},
        {field:'name',title:'专家姓名',align:'center',width: $(this).width() *0.15},
        {field:'pro_type',title:'专业组名',align:'center',width: $(this).width() *0.30},
        {field:'sex',title:'性别',align:'center',width: $(this).width() *0.20,
            	    		formatter: function(value,row,index){
  	    		        if(value == 1){
  	  	    		        return '男';
  	  	    		    }else if(value == 0){
  	  	    		        return '女';
  	  	  	    		}else{
  	  	  	    		   return value;
  	  	  	    		}
	   				}   },
        {field:'effected',title:'上一届评审委员',align:'center',width: $(this).width() *0.20}
        
        ]]    
     });  
	var pager = $('#markGrid').datagrid('getPager');
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
	

    } //loadEnd



</script>
<form id="searchZjForm" method="post"> 
   
            <table class="tableSearch">
             <tr>
             <td class="left">专业组类型:</td>
		      <td class="right"> 
        		<input id="pro_type1" name="pro_type1" class="easyui-combobox" style="height:22px" >
			  </td>
			  <td class="left">专家姓名:</td>
		      <td class="right"> 
        		<input id="expertName" name="expertName" class="easyui-textbox" style="height:22px" >
			  </td>
			  <td class="right"></td>
		      <td class="left">
				<a onclick="searchName();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">搜索</a>
		      </td>
		       <td class="right"></td>
		      <td class="left">
				<a onclick="mark();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">标记</a>
		      </td>
		      <td class="right"></td>
		      <td class="left">
		     	<a onclick="cacelMark();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">取消标记</a>
		      </td>
		      </tr>
		      
            </table>
            </form>
      <table id="markGrid" > </table> 
	

</body>

</html>
