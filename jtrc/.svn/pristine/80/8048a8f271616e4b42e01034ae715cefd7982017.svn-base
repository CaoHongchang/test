<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>党员修改</title>

<body>

	<form id="fmView" method="post">
    <div id="aa" class="easyui-accordion" style="height:300px;">   
       <div title="基本信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
		      <tr>
			      <td class="left">党员编码</td>
			      <td class="right"><input id ="pno" name ="pno" type="text"   readonly="readonly"></td>
			      <td class="left">是否在中心</td>
			      <td class="right">
				      <select id="is_in" class="easyui-combobox" name="is_in"  readonly="readonly">   
					      <option value="">---请选择---</option>
					      <option value="1">是</option>   
					      <option value="0">否</option>
					  </select>
				  </td>
		      </tr>
		      <tr>
			      <td class="left">党员姓名</td>
			      <td class="right"><input type="text" id="name" name="name"   readonly="readonly"></td>
		      	  <td class="left">身份证号码</td>
			      <td class="right"><input type="text"  id="pnum" name="pnum"   readonly="readonly"></td>
			  </tr>
		      <tr>
			      <td class="left">性别</td>
			      <td class="right">
				       <select id="sex" class="easyui-combobox" name="sex"  readonly="readonly">   
				            <option value="">---请选择---</option>
					   		<option value="1">男</option>   
					   		<option value="0">女</option> 
					   </select>
			      </td>
			      <td class="left">籍贯</td>
			      <td class="right"> 
			       	   <input type="text"  id="jg_name" name="jg_name"   readonly="readonly">
			      </td>
		      </tr>
		      <tr>
		          <td class="left">出生年月</td>
			      <td class="right"><input class="easyui-datebox"  id="birth_date" name="birth_date"  readonly="readonly"></td>
			      <td class="left">学历</td>
			      <td class="right">
				       <select id="cc" class="easyui-combobox" name="degree" readonly="readonly" style="width:120px">   
					   		<option value="本科">本科</option>   
					   </select>
			      </td>
		      </tr>
		      <tr>
			       <td class="left">工作地</td>
				      <td class="right"> 
				           <input class="easyui-datebox"  id="da_id" name="da_id"  readonly="readonly">
				      </td>
			      <td class="left">工作单位</td>
			      <td class="right"><input type="text" id="company" name="company"  readonly="readonly"></td>
		      </tr>
		      <tr>
			      <td class="left">预/正</td>
			      <td class="right">
					   <select id="is_state" class="easyui-combobox" name="is_state"  readonly="readonly">   
					   		<option value="">---请选择---</option>   
					   		<option value="0">预</option>
					   		<option value="1">正</option>
					   </select>
				  </td>
			      <td class="left">入党时间</td>
			      <td class="right"><input class="easyui-datebox"  data-options="required:true" id="party_date" name="party_date"  readonly="readonly"></td>
		      </tr>
		      <tr>
			      <td class="left">转正时间</td>
			      <td class="right"><input type="text"  id="full_date" name="full_date"  readonly="readonly"></td>
			      <td class="left">入党介绍人1</td>
			      <td class="right"><input type="text"  id="j_name1" name="j_name1" readonly="readonly"></td>
		      </tr>
		      
		       <tr>
		     	  <td class="left">入党介绍人2</td>
			      <td class="right"><input type="text"   id="j_name2" name="j_name2"  readonly="readonly"></td>
			      <td class="left">历史党费缴至</td>
			      <td class="right"><input class="easyui-datebox" id="his_date" name="his_date" size="20" style="height:22px;"></td>
		      </tr>
      </table>  
      </div>  
   </div>  
   <div id="aa" class="easyui-accordion" style="height:130px;">  
      <div title="联系方式" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
		      <tr>
			      <td class="left">手机号</td>
			      <td class="right"><input id ="tel" name="tel" type="text"  readonly="readonly"></td>
			      <td class="left">QQ号</td>
			      <td class="right"><input id ="qq" name="qq" type="text"   readonly="readonly"></td>
		      </tr>
		      <tr>
			      <td class="left">微信号</td>
			      <td class="right"><input type="text"  id ="wx" name="wx"   readonly="readonly"></td>
		      	  <td class="left"></td>
			      </tr>
		      <tr>
      	</table>  
      </div> 
   </div> 
   <div id="aa" class="easyui-accordion" style="height:150px;">  
   <div title="材料信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
		      <tr>
			      <td class="left">入党申请书</td>
			      <td class="right">
			     	   <select id="sq_status" class="easyui-combobox" name="sq_status"  readonly="readonly" style="width:120px">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>  
					   </select>
			      </td>
			      <td class="left">入党志愿书</td>
			      <td class="right">
			     	   <select id="rd_status" class="easyui-combobox" name="rd_status" readonly="readonly"  style="width:120px">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>     
					   </select>
			      </td>
		      </tr>
		      <tr>
			      <td class="left">政治审查材料</td>
			      <td class="right">
			     	   <select id="zz_mtr" class="easyui-combobox" name="zz_mtr" readonly="readonly"  style="width:120px">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>  
					   </select>
			      </td>
			      <td class="left">培养教育考察材料</td>
			      <td class="right">
			     	   <select id="py_mtr" class="easyui-combobox" name="py_mtr"  readonly="readonly" style="width:120px">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>
					   </select>
			      </td>
		      </tr>
		      <tr>
			      <td class="left">转正申请书</td>
			      <td class="right">
			     	   <select id="full_rq" name="full_rq"  class="easyui-combobox" name="full_rq"  readonly="readonly"  style="width:120px">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option> 
					   </select>
			      </td>
			      <td class="left"></td>
			      <td class="right"></td>
		      </tr>
      	</table>  
      </div> 
      </div> 
      
      <div id="aa" class="easyui-accordion" style="height:200px;">  
      <div title="转入信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
		  <div>
	          <table id="zrxxdgView" class="easyui-datagrid" >
			  </table>
		  </div>
      </div>
      </div>
      
      <div id="aa" class="easyui-accordion" style="height:200px;">  
      <div title="转出信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
		  <div>
	          <table id="zcxxdgView" class="easyui-datagrid" >
			  </table>
		  </div>
      </div>
      </div>
      
   
    </form> 

</body>

</html>
