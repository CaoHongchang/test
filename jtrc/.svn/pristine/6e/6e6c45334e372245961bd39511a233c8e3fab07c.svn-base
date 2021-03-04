<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>开设班级</title>
<script type="text/javascript">

//添加附件
function fjFuc(){
	
	var k = $('#fileTable').find("tr").length;
	
	if ($("#idFile").val() == '') {           
		 alert("请选择选择要上传的附件!");            
	     return false;        
    }
	$.ajaxFileUpload({
    	url:'<%=request.getContextPath()%>/classTrol/fileUpload', 
        secureuri:false,
        fileElementId:'idFile',                         //文件选择框的id属性
        dataType: 'text',                                     //服务器返回的格式，可以是json
        success: function (data, status)             //相当于java中try语句块的用法
        {   
            debugger;
            //console.log(data);
            if(status == "success"){
            	$("#fileTable tr").eq(1).remove();
                data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
    			data = data.replace("</PRE>", '');
    			data = data.replace("<pre style=\"word-wrap: break-word; white-space: pre-wrap;\">", '');
    			data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
                    var list = data.split("\\");
                    var i = list.length-1;
                    if(data=='请选择文件后上传!'||data=='附件大小超过范围!'||data=='文件上传失败，请重试！'||data=='上传附件失败,请稍后再试!'){
                    alert(data);
					return ;
                    }
                    var str = '<tr id="tr1">'
                    str +='<td>' + list[i];
                    str +='<input type="hidden" name="pic" id="pic1" value="'+list[i]+'">';
                    str +='</td>';
                    str +='<td><a href="javascript:delPic();" class="btn-lightblue">删除</a></td>';
                    str +='</tr>';
                    $("#fileTable").append(str);
    			 
            }
        },
        error: function (data, status, e)             //相当于java中catch语句块的用法
        {
           alert("网络故障，请重试！");
        }
      }
    );
}
function delPic(){
	if(confirm("确认删除该附件吗？")){
		$("#tr1").remove();
	}
}
//加载班级编码 
$(function(){
	$.ajax({
		url:'<%=request.getContextPath()%>/classTrol/qrySeqNo',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    type: "POST",   //请求方式
	    success: function(data) {
            if(data.flag == true){
            	 $("#bjbm").val('');
            	 $("#bjbm").val(data.seqNo);
	        }else{
	        	 $.messager.alert('系统提示','获取班级编码失败：'+data.cause);
		    }
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
});
</script>
<body>

	<form id="bjAddFm" method="post">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">班级编码</td>
	      <td class="right"><input id="bjbm" name="bjbm" class="easyui-textbox" readonly="readonly" size="30"  style="height:22px"></td>
     	  <td class="left"></td>
	      <td class="right"></td>
      </tr>
      <tr>
	      <td class="left">班级名称</td>
	      <td class="right"><input id="bjmc" name="bjmc" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
		  <td class="left">主办单位</td>
	      <td class="right"><input id ="zbdw" name="zbdw" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">承办单位</td>
	      <td class="right"><input id ="cbdw" name="cbdw"  class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
		  <td class="left">培训内容</td>
	      <td class="right"><input id ="pxnr" name="pxnr" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">培训对象</td>
	      <td class="right"><input id ="pxdx" name="pxdx" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
		  <td class="left">培训类别</td>
	      <td class="right"><input id ="pxlb" name="pxlb" class="easyui-textbox" min="0" size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">培训期限</td>
	      <td class="right"><input id ="pxqx" name="pxqx" class="easyui-numberbox" min="1"  size="20" data-options="required:true" style="height:22px"></td>
		  <td class="left">本期人数</td>
	      <td class="right"><input id ="bqrs" name="bqrs" class="easyui-numberbox" min="1" size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">开班时间</td>
	      <td class="right">
	      	<input class="easyui-datebox" id="kbsj" name="kbsj" size="20" data-options="required:true"  style="height:22px">
	      </td>
	      <td class="left">结束时间</td>
	      <td class="right">
	      	<input class="easyui-datebox" id="jssj" name="jssj" size="20" data-options="required:true"  style="height:22px">
	      </td>
      </tr><%--
       <tr>
	      <td class="left">附件</td>
	      <td class="right">
	      	<input type="file" onchange="setImagePreview()" id="idFile" name="idFile" >
	      </td>
	      <td class="left"></td>
	      <td class="right"></td>
      </tr>
     <tr>
	     <td colspan="4" >
	      
	     </td>
      </tr>--%>
      </table>  
 </div>
       
        <form id="fjForm" method="post">
       <table class="table3">
       <tr>
      <td class="left">附件</td>
      <td class="right"  >
     
       <a href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:false">
       <input  onchange="fjFuc()" id="idFile" name= "idFile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;font-size: 100px;right: 0;top: 5px;opacity: 0;">选择文件</a>
       <label style="color: red">*附件大小不超过2M</label>
      </td>
      </tr>  
       </table>  
      
      </form> 
        
        <div id="aa" class="easyui-accordion" >   
       <div align="center" title="" >    
        <table class="table2" id="fileTable">
	          <tr style="background: #ccc;border: 2px;">
	              <td>文件名</td>
	              <td>操作</td>
	          </tr>
	          
	         </table>
	      </div>
	      </div>
    </form> 

</body>

</html>
