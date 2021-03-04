<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>企业材料新增</title>

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
</script>
	<form id="fm" method="post" enctype="multipart/form-data">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">组织机构代码</td>
	      <td class="right"><input id ="enterpriseCode" name="enterpriseCode" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">企业名称</td>
	      <td class="right"><input id ="enterpriseName"  name="enterpriseName" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料编号</td>
	      <td class="right"><input id ="materialCode" name="materialCode" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料类型</td>
	      <td class="right"><input id ="materialType" name="materialType" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料名称</td>
	      <td class="right"><input id ="materialName" name="materialName" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">发证机关</td>
	      <td class="right"><input id="publishOrg" name="publishOrg" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">发证时间</td>
	      <td class="right"><input id="publishTime" name="publishTime" class="easyui-datebox"  size="20" data-options="required:true"  style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">有效期</td>
	      <td class="right"><input id="validDate" name="validDate" class="easyui-datebox"  size="20"   style="height:22px"></td>
      </tr>
	  <tr>
	      <td class="left">备注</td>
	      <td class="right"><input id="remark" name="remark" class="easyui-textbox"  size="30"  style="height:22px"></td>
       </tr>
        <tr>
	      <td class="left">上传图片</td>
	      <td class="right">
	        <input id ="file" name="file" data-options="required:true" accept="image/png,image/jpeg,img/jpg" class="easyui-filebox" size="30" value=""  style="height:22px">
	      </td>
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
