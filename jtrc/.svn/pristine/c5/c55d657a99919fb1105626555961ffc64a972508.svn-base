<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>个人材料新增</title>

<body>
<script type="text/javascript">
    function previewImg(){
		
		$('#fm').form('submit',{
			url:'../clgl/uploadMaterial',
			type:'post',
			onSubmit:function(){
				return true;
			},
			success:function(data){
				if(data!=0){
				var img=document.getElementById('preview');
		        img.src=data;
				}
			}
		});
		
	}
    $(function(){
    	$('#usernum').textbox({
			onChange:function(newValue,oldValue){
				$.ajax({
					url:'../clgl/getNameByIdCard',
					type:'post',
					data:{
						pnum:newValue
					},success:function(data){
						data=$.parseJSON(data);
						if(data.flag){
							$("#username").textbox('setValue',data.msg);
						}else{
							$.messager.alert('系统提示',data.msg,'info');
						}
					}
				});
			}
		});
    });
</script>
	<form id="fm" method="post" enctype="multipart/form-data">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">身份证号</td>
	      <td class="right"><input id ="usernum" name="usernum" class="easyui-textbox" size="30"  data-options="required:true,validType:['idcard[]']" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">姓名</td>
	      <td class="right"><input id ="username" name="username" class="easyui-textbox"  size="30" data-options="editable:false" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料编号</td>
	      <td class="right"><input id ="pno" name="pno" class="easyui-textbox"  size="30" data-options="editable:false" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料类型</td>
	      <td class="right"><input id ="ptype" name="ptype" class="easyui-textbox"  size="30" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料名称</td>
	      <td class="right"><input id ="pname" name="pname" class="easyui-textbox"  size="30" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">发证机关</td>
	      <td class="right"><input id="sname" name="sname" class="easyui-textbox"  size="30"  style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">发证时间</td>
	      <td class="right"><input id="sdate" name="sdate" class="easyui-datebox"  size="30" data-options="required:true"  style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">有效期</td>
	      <td class="right"><input id="validDate" name="validDate" class="easyui-datebox"  size="30"   style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">上传图片</td>
	      <td class="right">
	        <input id ="file" name="file" data-options="required:true" accept="image/png,image/jpeg,img/jpg" class="easyui-filebox" size="30" value=""  style="height:22px">
	      </td>
      </tr>
	    <tr>
	      <td class="left">备注</td>
	      <td class="right"><input id="remark" name="remark" class="easyui-textbox"  size="30"   style="height:22px"></td>
       </tr>
      <tr>
	      <td colspan="2" >
	            <img id="preview" alt="图片预览" src="../images/001.jpg" width="100px" height="100px">
	      </td>
	   </tr>
	   <tr>
	      <td>
	            <a onclick="previewImg()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" >预览</a>
	      </td>
	       <td></td>
	   </tr>
      </table>  
    </div>
    </form> 

</body>
   
</html>
