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
    	url:'<%=request.getContextPath()%>/examProjectInfo/fileUpload', 
        secureuri:false,
        fileElementId:'idFile',                         //文件选择框的id属性
        dataType: 'text',                                     //服务器返回的格式，可以是json
        success: function (data, status)             //相当于java中try语句块的用法
        {   
            debugger;
            if(status == "success"){
            	$("#fileTable tr").eq(1).remove();
                data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
    			data = data.replace("</PRE>", '');
    			data = data.replace("<pre style=\"word-wrap: break-word; white-space: pre-wrap;\">", '');
    			data = data.replace("<pre>", '');
    			data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
                var list = data.split("#");
   				if(list[0]==0){
                    var str = '<tr id="tr1">'
                    str +='<td>' + list[2];
                    str +='<input type="hidden" name="file_url" id="file_url" value="'+list[2]+'">';
                    str +='</td>';
                    str +='<td><a href="javascript:delPic();" class="btn-lightblue">删除</a></td>';
                    str +='</tr>';
                    $("#fileTable").append(str);
   				}else{
   					alert(list[1]);
   				}
            }else{
            	 alert("添加附件失败");
				 return false; 
			}
        },
        error: function (data, status, e)             //相当于java中catch语句块的用法
        {
            $('#result').html('上传附件');
        }
      }
    );
}

function delPic(){
	if(confirm("确认删除该附件吗？")){
		$("#tr1").remove();
	}
}

</script>
<body>

	<form id="editFm" method="post">
		<div>
			<table class="table2">
				<tr>
					<td class="left">项目编号</td>
					<td class="right"><input id="id" name="id" type="hidden"><input id="projectNum" name="projectNum" size="25"
						class="easyui-textbox" readonly="readonly" 
						style="height:22px">
					</td>
					<td class="left">项目名称</td>
					<td class="right"><input id="projectName" name="projectName"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">培训类型</td>
					<td class="right"><select id="examType" name="examType"
						class="easyui-combobox" size="20"
						data-options="required:true">
							<option value="1">安全三类人员新取证考试</option>
							<option value="2">安全三类人员继续教育考试</option>
							<option value="3">安全考评员新取证考试</option>
							<option value="4">安全考评员继续教育考试</option>
							<option value="5">专业技术人员继续教育考试</option>
					</select></td>
					<td class="left">培训地点</td>
					<td class="right"><input id="projectAddress" name="projectAddress"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">培训对象</td>
					<td class="right"><input id="examObject" name="examObject"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
					<td class="left">主办单位</td>
					<td class="right"><input id="hostUnit" name="hostUnit"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">培训内容</td>
					<td class="right" colspan="3"><input id="examContent" name="examContent"
						class="easyui-textbox" size="79" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">发证单位</td>
					<td class="right"><input id="issueUnit" name="issueUnit"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
					<td class="left">培训期限</td>
					<td class="right"><input id="examTerm" name="examTerm"
						class="easyui-textbox" min="0" size="25"
						data-options="required:true" style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">开始时间</td>
					<td class="right"><input class="easyui-datebox" id="beginTime"
						name="beginTime" size="25" data-options="required:true" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}',maxDate:'#F{$dp.$D(\'end_time\')}'})"
						style="height:22px"></td>
					<td class="left">结束时间</td>
					<td class="right"><input class="easyui-datebox" id="endTime"
						name="endTime" size="25" data-options="required:true" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}'||'#F{$dp.$D(\'begin_time\')}'})"
						style="height:22px"></td>
				</tr>
			</table>
		</div>
		<form id="fjForm" method="post">
			<table class="table3">
				<tr>
					<td class="left">附件</td>
					<td class="right"><a href="javascript:;"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-print',plain:false"> <input
							onchange="fjFuc()" id="idFile" name="idFile" type="file"
							style="cursor:pointer;filter: alpha(opacity=0);position: absolute;font-size: 100px;right: 0;top: 5px;opacity: 0;">更换文件</a>
						<label style="color: red">*文件格式允许为DOC、DOCX、ZIP、RAR，且大小不超过2M</label>
					</td>
				</tr>
			</table>
		</form>
		<div id="aa" class="easyui-accordion">
			<div align="center" title="">
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
