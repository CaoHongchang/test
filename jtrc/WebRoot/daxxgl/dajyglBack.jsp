<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>档案借阅归还</title>

<body>

		<form id="fmBack" method="post">
		<input type="hidden" id="id" name="id"/>
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">借阅档案编号</td>
      <td class="right">
      <input class="easyui-textbox"  id="d_no" name="d_no"  size="20" data-options="required:true" disabled="disabled" style="height:22px">
      </td>
        <td class="left">借阅材料内容</td>
      <td class="right">
      <input class="easyui-textbox" id="d_content" name="d_content"   size="20" disabled="disabled" style="height:22px">
      </td>
      
      </tr>
      <tr>
      <td class="left">借阅单位</td>
      <td class="right">
       <input class="easyui-textbox" id="d_point" name="d_point"  size="20" disabled="disabled" style="height:22px">
	  </td>
      <td class="left">借阅人</td>
      <td class="right">
       <input class="easyui-textbox" id="d_uid" name="d_uid"   size="20" disabled="disabled" style="height:22px">
      </td>
     <tr>
      <td class="left">被借阅人</td>
      <td class="right">
       <input class="easyui-textbox" id="out_uid" name="out_uid"   size="20" disabled="disabled" style="height:22px">
	   </td>
	    <td class="left"></td>
      <td class="right">
     
      </tr>
      <tr>
      <td class="left">备注</td>
      <td class="right"  colspan="3" > <input class="easyui-textbox"  id="remark" name="remark"  disabled="disabled"  size="60" data-options="multiline:true" style="height:60px;width: 475px"></td>
      </tr>
      <tr>
      <td class="left">借阅日期</td>
      <td class="right">
      <input class="easyui-datebox" id="d_date" name="d_date"  size="20" data-options="required:true"  disabled="disabled"style="height:22px">
	   </td>
        <td class="left">调档人</td>
      <td class="right">
      <input class="easyui-textbox" id="t_name" name="t_name"   size="20" data-options="required:true" disabled="disabled" style="height:22px">
      </td>
      </tr>
      <tr>
      <td class="left">归还日期</td>
      <td class="right">
      <input class="easyui-datebox" id="back_date" name="back_date"  size="20" data-options="required:true" style="height:22px">
	   </td>
        <td class="left">签收人</td>
      <td class="right">
      <input class="easyui-textbox" id="s_uid" name="s_uid"   size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      </table>  
      </div>   
       </div>
    </form> 
</body>

</html>
