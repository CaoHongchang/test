<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>报考参数列表编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<body>
<script type="text/javascript">

/**
	$(function(){
		alert(pname);
    	$("#id").val(id);
        $("#pno").val(pno);
        $("#pname").val(pname);
        if(start_date != 'undefined') {
        	$("#startDate").val(start_date);
        }
        if(end_date != 'undefined') {
        	$("#endDate").val(end_date);
        }
        if(sh_date != 'undefined') {
        	$("#shDate").val(sh_date);
        }
        if(se_date != 'undefined') {
        	$("#seDate").val(se_date);
        }
        if(dy_date != 'undefined') {
        	$("#dyDate").val(dy_date);
        }
        if(de_date != 'undefined') {
        	$("#deDate").val(de_date);
        }
        if(ss_start_date != 'undefined') {
        	$("#ssStartDate").val(ss_start_date);
        }
        if(ss_end_date != 'undefined') {
        	 $("#ssEndDate").val(ss_end_date);
        }
        if(ck_start_date != 'undefined') {
        	 $("#ckStartDate").val(ck_start_date);
       	}
        if(ck_end_date != 'undefined') {
        	$("#ckEndDate").val(ck_end_date);
      	}
        if(m != 'undefined') {
        	$("#m").val(m);
      	}
        if(ks_start_date != 'undefined') {
        	$("#ksStartDate").val(ks_start_date);
      	}
        if(ks_end_date != 'undefined') {
        	$("#ksEndDate").val(ks_end_date);
      	}
        if(ms_start_date != 'undefined') {
        	$("#msStartDate").val(ms_start_date);
      	}
        if(ms_end_date != 'undefined') {
        	$("#msEndDate").val(ms_end_date);
      	}
        if(a_ks_users != 'undefined') {
        	$("#aKsUsers").val(a_ks_users);
      	}
        if(b_ks_users != 'undefined') {
        	$("#bKsUsers").val(b_ks_users);
      	}
        if(zkz_top != 'undefined') {
        	$("#zkzTop").val(zkz_top);
      	}
        if(activity_id != 'undefined') {
        	$("#activityId").val(activity_id);
      	}
        
	});
	
**/
</script>
		<form id="fm2" method="post">
	<!--  -->
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
        <table class="table2">
        <!-- -->
      <tr style="display:none">
      <td class="left">序号</td>
      <td class="right">
       <input class="easyui-textbox" id="id" name="id"  size="60" data-options="editable:false" style="height:22px">
	  </td>
      </tr>
      
      <tr>
      <td class="left">活动编号</td>
      <td class="right">
       <input class="easyui-textbox" id="activityId" name="activityId"  size="60" data-options="editable:false" style="height:22px">
	  </td>
      </tr>
      <tr>
      <td class="left">报考活动编码</td>
      <td class="right">
       <input class="easyui-textbox" id="pno" name="pno"  size="60" data-options="editable:false" style="height:22px">
	  </td>
      </tr>
      
      <tr>
      <td class="left">报考活动名称</td>
      <td class="right">
       <input class="easyui-textbox" id="pname" name="pname"  size="60" data-options="editable:false" style="height:22px">
	  </td>
      </tr>
         
      <tr>
      <td class="left">报名缴费开始时间</td>
      <td class="right">
       <input class="easyui-datetimebox" editable="false" id="startDate" name="startDate"  size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">报名缴费结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox"  editable="false" id="endDate" name="endDate" size="60" data-options="required:true,showSeconds:true,validType:'dateValid[\'#startDate\',\'#endDate\',\'报名缴费结束时间不能早于报名缴费开始时间\']'"  style="height:22px">
	   </td>
      </tr>
      <tr>
      <td class="left">审核开始时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="shDate" name="shDate" size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">审核结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="seDate" name="seDate" size="60" data-options="required:true,showSeconds:true,validType:'dateValid[\'#shDate\',\'#seDate\',\'审核结束时间不能早于审核开始时间\']'"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">打印准考证开始时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="dyDate" name="dyDate" size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">打印准考证结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="deDate" name="deDate" size="60" data-options="required:true,showSeconds:true,validType:'dateValid[\'#dyDate\',\'#deDate\',\'打印准考证结束时间不能早于打印准考证开始时间\']'"  style="height:22px">
	   </td>
      </tr>
      
       <tr>
      <td class="left">申诉开始时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="ssStartDate" name="ssStartDate" size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">申诉结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="ssEndDate" name="ssEndDate" size="60" data-options="required:true,showSeconds:true,validType:'dateValid[\'#ssStartDate\',\'#ssEndDate\',\'申诉结束时间不能早于申诉开始时间\']'"  style="height:22px">
	   </td>
      </tr>
      
       <tr>
      <td class="left">查看成绩开始时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="ckStartDate" name="ckStartDate" size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">查看成绩结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="ckEndDate" name="ckEndDate" size="60" data-options="required:true,showSeconds:true,validType:'dateValid[\'#ckStartDate\',\'#ckEndDate\',\'查看成绩结束时间不能早于查看成绩开始时间\']'"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">报名费</td>
      <td class="right">
      <input class="easyui-textbox" id="m" name="m" size="60" data-options="required:true,validType:'floatValid'"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">考试开始时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="ksStartDate" name="ksStartDate" size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">笔试结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="ksEndDate" name="ksEndDate" size="60" data-options="required:true,showSeconds:true,validType:'dateValid[\'#ksStartDate\',\'#ksEndDate\',\'笔试结束时间不能早于考试开始时间\']'"  style="height:22px">
	   </td>
      </tr>

	  <tr>
      <td class="left">面试开始时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="msStartDate" name="msStartDate" size="60" data-options="required:true,showSeconds:true"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">面试结束时间</td>
      <td class="right">
      <input class="easyui-datetimebox" editable="false" id="msEndDate" name="msEndDate" size="60" data-options="required:true,validType:'dateValid[\'#msStartDate\',\'#msEndDate\',\'面试结束时间不能早于面试开始时间\']'"  style="height:22px">
	   </td>
      </tr>
      
       <tr>
      <td class="left">A考卷教室人数</td>
      <td class="right">
      <input class="easyui-textbox" id="aKsUsers" name="aKsUsers" size="60" data-options="required:true,validType:'numValid'"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">B考卷教室人数</td>
      <td class="right">
      <input class="easyui-textbox" id="bKsUsers" name="bKsUsers" size="60" data-options="required:true,validType:'numValid'"  style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">准考证前缀</td>
      <td class="right">
      <input class="easyui-textbox" id="zkzTop" name="zkzTop" size="60" data-options="required:true"  style="height:22px">
	   </td>
      </tr>

      </table>  
      </div>   
   
       </div>

      

             
    </form> 
<script>
/****/
		$.extend($.fn.validatebox.defaults.rules,{  
			dateValid : {  
				validator : function(value,param) { //参数value为当前文本框的值，也就是endDate  
					var startTime = $(param[0]).datetimebox('getValue');//获取起始时间的值  
					var endTime = $(param[1]).datetimebox('getValue');
					var start = $.fn.datebox.defaults.parser(startTime); 
					var end = $.fn.datebox.defaults.parser(endTime); 
					varify = endTime > startTime;  
					return varify; 
					}, 
			message : '{2}'
		},
		numValid : {  
				validator : function(value,param) {
					return /^\d+$/.test(value); 
					}, 
			message : '请输入正整数或者0'
		},
		floatValid : {  
				validator : function(value,param) {
					return /^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,2})?$/.test(value); 
					}, 
			message : '请输入大于0的小数，小数位最大为2位'
		}  
	});
</script>
</body>

</html>
