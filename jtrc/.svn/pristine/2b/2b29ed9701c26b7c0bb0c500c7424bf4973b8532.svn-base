<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>专家新增</title>

<body>

   <script type="text/javascript">
   		function searchExport(){
   			$('#zjAddGrid').datagrid('load',{
   				expertName:$("#expertName").textbox('getValue'),
   				proType:$("#proType").textbox('getValue'),
   				zgLevel:$("#zgLevel").textbox('getValue')
   			});
   		}
   </script>
	<form id="fm" method="post" style="padding:2px 2px;">

        &nbsp;&nbsp;
       <input class="easyui-textbox" id="expertName" data-options="prompt:'专家姓名'" style="width:200px" name="expertName"> 
        &nbsp;&nbsp;
       <input  class="easyui-textbox" id="proType" style="width:200px;" data-options="prompt:'专业类别'" name="proType" />   
    
        &nbsp; &nbsp;  
      <input  class="easyui-textbox" id="zgLevel" data-options="prompt:'资格级别'" name="zgLevel" style="width:200px;" />   
      
      <a onclick="searchExport()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" >搜索</a>  
       
              <table id="zjAddGrid"></table>           
    </form> 

</body>

</html>
