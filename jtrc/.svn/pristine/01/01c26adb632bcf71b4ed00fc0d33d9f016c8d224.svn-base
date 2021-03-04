<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>评审活动新增</title>

<body>
<script type="text/javascript">

</script>
<form id="zcpshdForm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="id" name="id"/>
	<input type="hidden" id="zname" name="zname">
	<input type="hidden" id="zurl" name="zurl">
	<input type="hidden" id="state" name="state" value="有效">
   <div>
    <table class="table2">
      <tr>
      	<!-- <td class="left">活动编码</td>
      	<td class="right"><input id ="businessId" name="businessId" class="easyui-textbox " hidden="true" readonly="readonly" size="20" style="height:22px"></td> -->
      	<td class="left">活动名称</td>
      	<td class="right"><input id ="name" name="name" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
        <td class="left">活动结束时间</td>
      	<td class="right"><input class="easyui-datetimebox" id="hdjssj" name="hdjssj" size="20" data-options="required:true,validType:'dateValid[\'#psjssj\',\'#hdjssj\',\'活动结束时间不能早于评审结束时间\']'" style="height:22px"></td>
      </tr>
      <tr>
      	<td class="left">申报开始时间</td>
      	<td class="right"><input class="easyui-datetimebox" id="sbkssj" name="sbkssj" size="20" data-options="required:true" style="height:22px"></td>
       	<td class="left">申报结束时间</td>
      	<td class="right"><input class="easyui-datetimebox" id="sbjssj" name="sbjssj"  size="20" data-options="required:true,validType:'dateValid[\'#sbkssj\',\'#sbjssj\',\'申报结束时间不能早于申报开始时间\']'" style="height:22px"></td>
      </tr>
      <tr>
      	<td class="left">评审开始时间</td>
      	<td class="right"><input class="easyui-datetimebox" id="pskssj" name="pskssj" size="20" data-options="required:true,validType:'dateValid[\'#sbjssj\',\'#pskssj\',\'评审开始时间不能早于申报结束时间\']'"  style="height:22px"></td>
       	<td class="left">评审结束时间</td>
      	<td class="right"><input class="easyui-datetimebox" id="psjssj" name="psjssj" size="20" data-options="required:true,validType:'dateValid[\'#pskssj\',\'#psjssj\',\'评审结束时间不能早于申报开始时间\']'"  style="height:22px"></td>
      </tr>
    
      <tr>
      	<td class="left">专家操作指南</td>
      	<td class="right"><input class="easyui-filebox" id="imgFile" name="imgFile" size="20" data-options="buttonText:'选择文件'" style="height:22px"></td>
      	<td ><font color="red">* 上传附件不能超过2M</td>
      	<td class="right"></td>
      </tr>
     <tr>
      	<td class="left">评审须知</td>
      	<td class="right" colspan="3" style="height: 150px;">
      		 <textarea name="remark" cols="" rows="10" id="remark" class="span1-2" style="width:90%;" maxlength="150">
		      </textarea> 
      		<!-- <script type="text/javascript">CKEDITOR.replace('remark');</script> -->
      	</td>
      </tr>
     </table>  
   </div>
</form>
<script>
		$.extend($.fn.validatebox.defaults.rules,{  
			dateValid : {  
				validator : function(value,param) { //参数value为当前文本框的值，也就是endDate  
				var startTime = $(param[0]).datetimebox('getValue');//获取起始时间的值  
				var endTime = $(param[1]).datetimebox('getValue');
		//		var start = $.fn.datebox.defaults.parser(startTime).getTime();  
		//		var end = $.fn.datebox.defaults.parser(endTime).getTime(); 
				var start = new Date(startTime).getTime();  
				var end = new Date(endTime).getTime(); 
				//console.log("endTime:"+endTime+"--->>>startTime"+startTime);
				//console.log("start:"+start+"--->>>end"+end);
				varify = end > start;  
				return varify;  
			},  
			message : '{2}'
		}  
	});
</script>
</body>

</html>
