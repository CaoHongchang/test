<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>学员查看</title>

<body>
<script type="text/javascript">
	
	      

 $("#updateusername").val(sessionRealName);
//性别
var url = basePath+'xljy/getDataItemValueByName?attName=sex';  
            $.ajax({  
		    type:'post',  
		    url:url,  
		    dataType: 'json', 
		    success:function(data) {debugger;
			//转成Json对象
			var result = eval(data);
			
			$('#sex').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
            
//民族
var url2 = basePath+'xljy/getDataItemValueByName?attName=minorities_type';  
            $.ajax({  
		    type:'post',  
		    url:url2,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);
			
			$('#mz').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
            


//修改保存
function saveEditXy(){
    var r = $("#xyckForm2").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#xyckForm2").serializeArray();
 param=JSON.stringify(param); 
  $.ajax({
                url: "../xljy/editXy",
                type: "POST",
                dataType:"json",
                data: {
                'param': param
            },
                async: true,
                success: function(data){
                
                if(data.flag ==true){
                     //$('#xybmGrid').datagrid('reload');
                    
                      successMsg();
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                   errorMsg();

                }
            });


}

function viewFunc2(ids){
   var id='';
   if(ids!=''){
   id=ids;
   }else{
    if(!isCheckOne("#xyckForm2")){
    return;
    }
   var selections = $('#xybmGrid').datagrid('getSelections');
       id=selections[0].id;
      $("#id").val(id);
   }
   //页面表单数据加载
     $.ajax({
                url: basePath+"xljy/xybmMsg?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
               	    $("#xyckForm2").form('load', data.rows);//赋值给表单
               	      $("#remark").val(data.rows[0].remark);
               	    
    
				}else{
					  $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });
}
</script>
	<form id="xyckForm2" method="post">
  <input type="hidden" id="id" name="id">
    <div id="aa" class="easyui-accordion" style="height:600px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
                            <table class="table2">
      <tr>
      <td class="left">教育编号</td>
      <td class="right">
      <select  class="easyui-combobox" data-options="" id="educationNum" name="educationNum" style="width:135px;">   
	   </select>
	</td>
      <td class="left">信息来源</td>
      <td class="right"><input id ="sourceType" name ="sourceType"  class="easyui-textbox"  size="20" data-options="validType:['length[0,10]']" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right">
      <input  class="easyui-textbox" id="name" name="name" data-options="required:true,validType:['length[0,50]']" style="width:135px;"></td>
       <td class="left">性别</td>
      <td class="right">
      <select  class="easyui-combobox" id="sex" name="sex"  data-options="required:true,valueField:'value',textField:'name',editable:false" style="width:135px;">   
	   </select>
     </td>
      </tr>
      <tr>
      <td class="left">有效证件类型</td>
      <td class="right">
       <select  class="easyui-combobox" id="yxzhlx" name="yxzhlx"  data-options="required:true,editable:false" style="width:135px;">   
	    <option value="身份证">身份证</option>
	   </select>
      <!-- <input class="easyui-textbox" id="yxzhlx" name="yxzhlx" value="身份证" size="20" data-options=""  style="height:22px"> --></td>
       <td class="left">证件号</td>
      <td class="right"><input class="easyui-textbox" id="pnum" name="pnum" size="20" data-options="readonly:true,validType:['length[0,30]']"  style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">出生日期</td>
      <td class="right">
      <input class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM',})" id="birthDate" name="birthDate"   value=""size="20" style="width:138px"> 
   
      </td>
      <td class="left">身份证地址</td>
      <td class="right"><input class="easyui-textbox" id="address" name="address"   size="20" data-options="validType:['length[0,250]']" style="height:22px"></td>
      </tr>
       <tr>
      <td class="left">政治面貌</td>
      <td class="right"><input class="easyui-textbox"  id="zzmm" name="zzmm" size="20" data-options="validType:['length[0,20]']" style="height:22px"></td>
      <td class="left">现居住地</td>
      <td class="right">
	      <input class="easyui-textbox" name="placeResidence" id="placeResidence"  size="20" data-options="validType:['length[0,250]']" style="height:22px">
      </td>
      </tr>
      
        <tr>
      <td class="left"> 民族</td>
      <td class="right">
     
   <select  class="easyui-combobox" id="mz" name="mz"  data-options="required:true,valueField:'value',textField:'name',editable:false" style="width:135px;">   
	   </select>
      </td>
      <td class="left">微信</td>
      <td class="right">
	      <input class="easyui-textbox" name="wx" id="wx"  size="20" data-options="validType:['length[0,50]']" style="height:22px">
      </td>
      </tr>
      
     
      
      <tr>
      <td class="left">职业类别</td>
      <td class="right">
	   	   <input class="easyui-textbox" name="zylb" id="zylb"  size="20" data-options="validType:['length[0,250]']" style="height:22px">
      </td>
      <td class="left">招生类别</td>
      <td class="right">
	   <input class="easyui-textbox" name=zslb id="zslb"  size="20" data-options="validType:['length[0,50]']" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">报考科类</td>
      <td class="right">
	   	   <input class="easyui-textbox" name="bkkm" id="bkkm"  size="20" data-options="validType:['length[0,200]']" style="height:22px">
      </td>
       <td class="left">身份证地址邮编</td>
      <td class="right"><input class="easyui-textbox" name="pnumCode" id="pnumCode"  size="20" data-options="validType:['length[0,20]']" style="height:22px">
      </td>

      </tr>
      
      
       <tr>
      <td class="left">最高学历</td>
      <td class="right"><input class="easyui-textbox" name="highestDegree" id="highestDegree"  size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox"  name="school" id="school"  size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">毕业证号</td>
      <td class="right"><input class="easyui-textbox"  name="graduationNum" id="graduationNum"  size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      <td class="left">毕业时间</td>
      <td class="right">
       <input class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',})" id="graduationTime" name="graduationTime"   value=""size="20" style="width:138px"> 
      
      </td>
      </tr>
      
       <tr>
      <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox" name="email" id="email" size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      <td class="left">手机号码</td>
      <td class="right"><input class="easyui-textbox"  name="tel" id="tel" size="20" data-options="validType:['length[0,11]']" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">固定电话</td>
      <td class="right"><input class="easyui-textbox"  name="gTel" id="gTel"  size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox"  name="adr" id="adr" size="20" data-options="validType:['length[0,150]']" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">邮编</td>
      <td class="right"><input class="easyui-textbox"  name="zipCode" id="zipCode"  size="20" data-options="validType:['length[0,20]']" style="height:22px"></td>
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-textbox"   name="qq" id="qq" size="20" data-options="validType:['length[0,20]']" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">工作时间</td>
      <td class="right">
       <input class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',})" id="workTime" name="workTime"   value=""size="20" style="width:138px"> 
     </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
         <tr>
      
        <tr>
      <td class="left">现有岗位或职业资格证</td>
      <td class="right">
      <select  class="easyui-combobox" name="xyzsNum" id="xyzsNum" data-options="editable:false" style="width:135px;"> 
       <option value="有">有</option>
       <option value="无">无</option>
	   </select>
      </td>
      <td class="left">岗位或职业资格证说明</td>
      <td class="right">
	   <input class="easyui-textbox"   name="gwzsNum" id="gwzsNum" size="20" data-options="validType:['length[0,90]']" style="height:22px">
      </td>
      </tr>
      
       <tr>
      <td class="left">考生籍贯</td>
      <td class="right"><input class="easyui-textbox"  id="jgName" name="jgName" size="20" data-options="validType:['length[0,20]']" style="height:22px"></td>
      <td class="left">考生特征</td>
      <td class="right">
	      <input class="easyui-textbox" name="ksTz" id="ksTz"  size="20" data-options="validType:['length[0,150]']" style="height:22px">
      </td>
      </tr>
      
      
     <tr>
      <td class="left">备注</td>
      <td class="right" colspan="3">
      <input class="easyui-textbox" id="remark" name="remark" size="60" data-options="multiline:true,validType:['length[0,150]']"  style="height:52px">
	</td>
	</tr>
	
      </table>
      </div>   
   
       </div>

       <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="报考信息" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
        <table class="table2">
      <tr>
      <td class="left">报考层次</td>
      <td class="right"> 
      <select  class="easyui-combobox" id="registerLevel" name="registerLevel" data-options="readonly:true"  style="width:135px;">   
       </select> </td>
      <td class="left">学习形式</td>
      <td class="right">
      <select  class="easyui-combobox" id="LearnType" name="LearnType" data-options="readonly:true"  style="width:135px;">   
	  </select></td>
      </tr>
      <tr>
      <td class="left">拟报院校</td>
      <td class="right"><input class="easyui-textbox"  name="educationSchool" id="educationSchool"  size="20" data-options="readonly:true" style="height:22px"></td>
      <td class="left">拟报专业</td>
      <td class="right"><input class="easyui-textbox"   name="educationMajor" id="educationMajor" size="20" data-options="readonly:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">考区名称</td>
      <td class="right"><input class="easyui-textbox"  name="ckkqAddress" id="ckkqAddress"  size="20" data-options="readonly:false,validType:['length[0,150]']" style="height:22px"></td>
      <td class="left">考场确认点</td>
      <td class="right"><input class="easyui-textbox"   name="kqAddress" id="kqAddress" size="20" data-options="readonly:false,validType:['length[0,150]']" style="height:22px"></td>
      </tr> 
      </table>
      </div>
       </div>

       <table class="table2">
      <tr>
      <td class="left">录入人</td><!-- JTYYHYRCGL-941录入人获取当前操作人姓名，录入时间默认当前系统时间 -->
      <td class="right"><input class="easyui-textbox"   name="updateusername" id="updateusername" size="20" data-options="readonly:true" style="height:22px;"></td>

	  <td class="left">录入时间</td>
      <td class="right"><input class="easyui-textbox"   name="updateDate" id="updateDate" size="20" data-options="readonly:true" style="height:22px"></td>

	</tr>
	
	<!-- <tr>
      <td class="left">审核意见</td>
      <td class="right">
      <input class="easyui-textbox"  size="60" data-options="multiline:true,"  style="height:52px">
	</td>
	</tr> -->
	
	</table>    
    </form> 

</body>

</html>
