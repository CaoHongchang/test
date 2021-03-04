<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
 <%@ include file="/system/common.jsp" %>
<html>
<head>
<title>人员材料修改</title>
<script type="text/javascript" src="<%=basePath%>js/staticData.js"></script>
<body>
<script type="text/javascript">


$(document).ready(function(){
    
    fill_select("da_mz",mz_arr)
    
    fill_select("da_marital_status",hyzk_arr)
    
    fill_select("da_zzmm",zzmm_arr)
    
    fill_select("da_degree",whcd_arr)

    fill_select("max_degree",whcd_arr)  
});
</script>

<form id="ryxxEditFm" method="post">
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:420px;">   
    <div title="基本信息" value="1" style="">   
        <div id="" class="easyui-accordion" style="height:960px;">   
        <table class="table2">
       <tr>
      <td class="left">档案类别</td>
      <td class="right">
      <input type="hidden" id="da_dtype" name="da_dtype" size="20"  style="height:22px">
       <select id="da_dtype_name" class="easyui-combobox" name="da_dtype_name" style="width:135px;" readonly="readonly">   
		   <option value="B">档案保管</option>   
		   <option value="L">临时档案</option>  
		   <option value="D">代理档案</option>
		   <option value="C">单纯档案</option>  
		   <option value="T">退休</option>
		   <option value="W">待就业</option>
		   <option value="Y">意向档案</option>  
	   </select>
	  </td>
      <td class="left">档案编号</td>
      <td class="right">
      <input type="hidden" id="da_dpno2" name="da_dpno2">
      <input class="easyui-textbox" name="da_dpno" readonly="readonly" id="da_dpno"  size="20" data-options=" " style="height:22px"></td>
      <td class="left" colspan="2" rowspan="6" id="picTd">
      <input type='hidden' name='img_url' id="img_url"/>
      <img width='250px' height='150px' id='showPic' src=""/>
      </td>
      </tr>
       <tr>
      <td class="left">系统编码</td>
      <td class="right">
       <input class="easyui-textbox" id="da_pno" readonly="readonly" name="da_pno" size="20"  style="height:22px"></td>
       <td class="left">人事外包</td>
      <td class="right" colspan="3" nowrap>
            <input type="radio" name="human_out"  value="on" disabled />是
            <input type="radio" name="human_out"   value="off" checked="checked" disabled/>否
            <div id="point" style="display: none" >
           <input class="easyui-textbox" id="human_out1" readonly="readonly" name="human_out1" data-options=" "  size="20"  style="height:22px"/>
		    <label style="color:red">*填写外包单位名称</label>
		   </div>
           
           
      
      </td>
      </tr>
       <tr>
      <td class="left">姓名</td>
      <td class="right">
       <input class="easyui-textbox" readonly="readonly" id="da_name" name="da_name" size="20"  style="height:22px"></td>
       <td class="left">曾用名</td>
      <td class="right" colspan="3" ><input class="easyui-textbox" readonly="readonly" id="da_old_name" name="da_old_name" size="20" style="height:22px"></td>
      
      </tr>
     
      <tr>
      <td class="left">性别</td>
      <td class="right"><input type="radio" disabled="disabled"  name="da_sex" value="1" checked="checked" />男
                        <input type="radio" disabled="disabled" name="da_sex" value="0" />女</td>
     <td class="left">民族</td>
     <td class="right" colspan="3">
      <select id="da_mz" class="easyui-combobox" readonly="readonly"  name="da_mz" style="width:135px;">   
	    <option value="1">-汉-</option>  
	   </select>
      </td>
      </tr>
     
      <tr>
      <td class="left">身份证号</td>
      <td class="right"><input class="easyui-textbox" id="da_pnum" name="da_pnum" size="20"  style="height:22px" readonly="readonly"></td>
     <td class="left">出生日期</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" readonly="readonly" id="da_birthday" name="da_birthday" size="20" style="height:22px">
      </td>
      </tr>
       
      <tr>
      <td class="left">籍贯</td>
      <td class="right"><input class="easyui-textbox" readonly="readonly" id="da_jg_name" name="da_jg_name"  size="20" style="height:22px"></td>
     <td class="left">出生地</td>
     <td class="right" colspan="3">
      <input class="easyui-textbox" readonly="readonly" id="da_domicile"  name="da_domicile" size="20" style="height:22px">
      </td>
      </tr>
       
        <tr>
      <td class="left">户口所在地</td>
      <td class="right"><input class="easyui-textbox" readonly="readonly" id="da_domicile_place" name="da_domicile_place" size="20" style="height:22px"></td>
     <td class="left">政治面貌</td>
     <td class="right" colspan="3">
      <select id="da_zzmm" class="easyui-combobox" readonly="readonly" name="da_zzmm" style="width:200px;">   
	    <option value="0" selected="selected">-群众-</option> 
	    <option value="1">-中国共产党-</option>   
	   </select>
      </td>
      </tr>
      
      <tr>
      <td class="left">婚姻状况</td>
      <td class="right"> <select id="da_marital_status" readonly="readonly" class="easyui-combobox" name="da_marital_status" style="width:135px;">   
	   <option value="已婚">已婚</option>   
	   <option value="未婚">未婚</option>   
	   </select></td>
     <td class="left">第一学历</td>
     <td class="right" colspan="3">
      <select id="da_degree" class="easyui-combobox" readonly="readonly" data-options=" " name="da_degree" style="width:135px;">   
	   <option value="1">本科</option>   
	   </select>
      </td>
      
      </tr>
      <tr>
      <td class="left">选择照片文件</td>
      <td class="right" colspan="5"><input id="idFile" readonly="readonly" type="file" size="45" onchange="javascript:setImagePreview(this);" name="idFile" class="input" />
      </td>
      </tr>
     
      <tr>
      <td class="left">是否派遣</td>
      <td class="right" nowrap>
      
      <input type="radio" name="da_is_s" value="on" disabled />是
                        <input type="radio" name="da_is_s" disabled value="off" checked="checked"/>否
                         <div id="point1" style="display: none" >
                          <input class="easyui-textbox" readonly="readonly" id="da_is_s1" name="da_is_s1"   size="20"  style="height:22px"/>
							<label style="color:red">*填写派遣单位名称</label>
					   </div></td>
     <td class="left">单位代理</td>
      <td class="right" nowrap>
    
      <input type="radio" name="da_is_dl" value="on" disabled />是
                        <input type="radio" name="da_is_dl" value="off" checked="checked" disabled/>否
                           <div id="point2" style="display: none" >
                         <input class="easyui-textbox" id="da_is_dl1" readonly="readonly" name="da_is_dl1"   size="20"  style="height:22px"/>
                         <label style="color:red">*填写代理单位名称</label>
						</div></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
       
      <tr>
      <td class="left">第一学历毕业院校</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly" id="da_school" name="da_school"  size="20" style="height:22px;width:500px;"></td>
      </td>
     <tr>
     <td class="left">第一学历毕业时间</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_graduation_time" readonly="readonly" name="da_graduation_time" size="20" style="height:22px">
      </td>
      
      </tr>
      <tr>
      <td class="left">第一学历所学专业</td>
      <td class="right" ><input class="easyui-textbox" readonly="readonly"  id="da_major" name="da_major" size="20" style="height:22px"></td>
       <td class="left">第一学历毕业证号</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly" id="da_bpno" name="da_bpno"  size="20" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">最高学历</td>
     <td class="right">
      <select id="max_degree" class="easyui-combobox"  readonly="readonly"  data-options="required:true" name="max_degree" style="width:135px;">   
	   <option value="1">本科</option>   
	   </select>
      </td>
       <td class="left">最高学历毕业院校</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly"  id="max_school" name="max_school"  size="20" style="height:22px"></td>
     </tr>
     <tr>
     <td class="left">最高学历毕业时间</td>
     <td class="right" >
      <input class="easyui-textbox" readonly="readonly"  id="max_graduation_time" name="max_graduation_time" size="20" style="height:22px">
      </td>
      <td class="left">最高学历所学专业</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly"  id="max_major" name="max_major" size="20" style="height:22px"></td>
      
      </tr>
      
      
       <tr>
     
      <td class="left">报到单位</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="da_bd_unit" readonly="readonly" name="da_bd_unit" size="20" style="height:22px;width:500px;"></td>
      
      </tr>
      <tr>
      <td class="left">审批时间</td>
      <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_sp_date"  name="da_sp_date" readonly="readonly" size="20" style="height:22px">
      </td>
      </tr>
     
       <tr>
      <td class="left">工作单位</td>
      <td class="right" colspan="3" ><input class="easyui-textbox" name="da_work_name" readonly="readonly" id="da_work_name" size="20" style="height:22px;width:500px;"></td>
    </tr>
    <tr>
     <td class="left">工作年限</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_work_time" name="da_work_time" readonly="readonly" size="20" style="height:22px">
      </td>
      </tr>
      <tr>
      <td class="left">单位地址</td>
      <td class="right"><input class="easyui-textbox" id="da_unit_adr" readonly="readonly" name="da_unit_adr"  size="20" style="height:22px"></td>
      <td class="left" >职务职称级别</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="da_ctype" readonly="readonly" name="da_ctype" size="20" style="height:22px"></td>
      </tr>
       
      <tr>
      <td class="left">职业资格证</td>
      <td class="right"><input class="easyui-textbox"  id="da_license" readonly="readonly" name="da_license" size="20" style="height:22px"></td>
       <td class="left">家庭电话</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly" name="da_home_tel" id="da_home_tel" size="20" style="height:22px"></td>
      </tr>
      
       <tr>
     
      <td class="left">家庭地址</td>
      <td class="right"><input class="easyui-textbox" name="da_home_adr" readonly="readonly" id="da_home_adr" size="20" style="height:22px"></td>
       <td class="left">家庭地址邮编</td>
      <td class="right"><input class="easyui-textbox" name="da_home_post" readonly="readonly" id="da_home_post"  size="20" style="height:22px"></td>
      </tr>
      
    
       <tr>
      <td class="left">本人联系电话1</td>
      <td class="right"><input class="easyui-textbox" name="da_tel" readonly="readonly" id="da_tel"  size="20" style="height:22px"></td>
      <td class="left">本人联系电话2</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly" name="da_my_tel" id="da_my_tel"  size="20" style="height:22px"></td>
    
      </tr>
      <tr>
       <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox" name="da_my_adr" readonly="readonly" id="da_my_adr"  size="20" style="height:22px"></td>
       <td class="left">邮政编码</td>
      <td class="right" colspan="3"><input class="easyui-textbox" readonly="readonly" name="da_my_post" id="da_my_post"  size="20" style="height:22px"></td>
      </tr>
        
       <tr>
     
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-textbox" name="da_qq" readonly="readonly" id="da_qq" size="20" style="height:22px"></td>
       <td class="left">电子邮箱</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_email" id="da_email"  size="20" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">应急联系人</td>
      <td class="right"><input class="easyui-textbox" name="da_wife_name" readonly="readonly" id="da_wife_name" size="20" style="height:22px"></td>
      <td class="left">应急联系人电话</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_wife_tel" readonly="readonly" id="da_wife_tel"  size="20" style="height:22px"></td>
      
      </tr>
      
         <tr>
      <td class="left">建档时间</td>
      <td class="right">  <input class="easyui-datebox" name="da_create_date" readonly="readonly" id="da_create_date" size="20"  style="height:22px"></td>
      <td class="left">退休时间</td>
      <td class="right" colspan="3">  <input class="easyui-datebox" name="da_out_date" readonly="readonly" id="da_out_date" size="20" style="height:22px"></td>
       
      </tr>
      
      
       <tr>
      <td class="left">录入人</td>
      <td class="right"> 
      <input type="hidden" name="da_pid" id="da_pid" value="<%= sessionUserId %>">
      <input class="easyui-textbox"  size="20" name="da_pname" id="da_pname" readonly="readonly" style="height:22px"></td>
      <td class="left">录入日</td>
      <td class="right">  <input class="easyui-datebox"  name="da_add_date" readonly="readonly" id="da_add_date" size="20"    style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td class="right" colspan="4"> <input class="easyui-textbox" readonly="readonly"  name="da_remark" id="da_remark"  size="20" data-options="multiline:true" style="height:60px;width: 430px"></td>
  
      </tr>
      
      </table>  
   
       </div>
          
    </div>   
     <div title="工作简历" data-options="" onclick="qryWorkInfo()" style="">   
		    <div id="gzjlTool"  style="background-color:#FFFFFF;">
				
				 <table id="gzjlTableGrid"></table> 
			</div>
			<div id="gzjlAddInfo"></div>
			<div id="gzjlEidtInfo"></div>
          
    </div>
    <div title="教育培训" data-options="" style="">   
             <div id="jypxTool"  style="background-color:#FFFFFF;">
				 <table id="jypxTableGrid"></table> 
			</div>
			<div id="jypxAddInfo"></div>
			<div id="jypxEditInfo"></div>
    </div>
    <div title="职业培训" data-options="" style="">   
               <div id="zypxTool"  style="background-color:#FFFFFF;">
				 <table id="zypxTableGrid"></table> 
			</div>
			<div id="zypxAddInfo"></div>
			<div id="zypxEditInfo"></div>
    </div> 
    <div title="职务职称" data-options="" style="">   
             <div id="zwzcTool"  style="background-color:#FFFFFF;">
				 <table id="zwzcTableGrid"></table> 
			</div>
			<div id="zwzcAddInfo"></div>
       		<div id="zwzcEditInfo"></div>
            
    </div> 
    <div title="奖励情况" data-options="" style="">   
             <div id="jlqkTool"  style="background-color:#FFFFFF;">
				 <table id="jlqkTableGrid"></table> 
			</div>
			<div id="jlqkAddInfo"></div>
			<div id="jlqkEditInfo"></div>
    </div>   
</div>  
</form>		
</body>

</html>
