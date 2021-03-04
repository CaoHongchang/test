<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>选项新增</title>

<body>

		<form id="fm" method="post">

    <div id="aa" class="easyui-accordion" style="height:150px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">选项编码</td>
      <td class="right">
       <input id ="zhmc1" name="zhmc1" class="easyui-textbox"   size="60" data-options="required:true" style="height:22px">
	  </td>
      </tr>
      <tr>
      <td class="left">选项名称</td>
      <td class="right">
       <input id ="zhmc2" name="zhmc2" class="easyui-textbox"   size="60" data-options="required:true" style="height:22px">
      </td>
      </tr>

      <tr>
      <td class="left">备注</td>
      <td class="right"  > <input id ="zhmc3" name="zhmc3" class="easyui-textbox"   size="60" data-options="required:true,multiline:true" style="height:60px;"></td>
      </tr>
      </table>  
      </div>   
       </div>

     
       <div  class="easyui-accordion" style="height:270px;">   
       <div title="可选值" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
      <!--   <a onclick="xxnrAddFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">删除</a>
		--> 
        <table id="xxnrAddGrid"> </table>
       </div>
       </div>
      
       
      

             
    </form> 

</body>

</html>
