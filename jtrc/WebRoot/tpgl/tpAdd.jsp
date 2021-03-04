<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>分类新增</title>

<body>

<form id="fm" method="post" enctype="multipart/form-data">

    <div>
        <table class="table2">
            <tr>
                <td class="left">图片编码</td>
                <td class="right"><input id ="code" name="code" data-options="editable:false" class="easyui-textbox" size="20" value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">排序编号</td>
                <td class="right"><input id ="orderNo" name="orderNo" data-options="required:true,min:1" class="easyui-numberbox"  value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">图片名称</td>
                <td class="right">
                    <input id ="picTitle" name="picTitle" class="easyui-textbox" value="" data-options="required:true"  value="" style="height:22px">
                </td>
            </tr>
            <tr>
                <td class="left">图片分类</td>
                <td class="right">
                    <select id="typeId"  class="easyui-combotree" url="../tpgl/listAdverTypeInfoTree" name="typeId" data-options="required:true" style="width: 200px"/>
                </td>
            </tr>
            <tr>
                <td class="left">图片类型</td>
                <td class="right">
                    <select id="imageType" class="easyui-combobox" name="imageType" data-options="editable:false,readonly:true" style="width: 150px" >
                        <option value="1">轮播图</option>
                        <option value="2">图片链接</option>
                        <option value="3">普通图片</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="left">URL</td>
                <td class="right"><input id ="url" name="url" data-options="required:true" class="easyui-textbox" size="20" value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">上架时间</td>
                <td class="right"><input id ="useTime" name="useTime" data-options="required:true,editable:false" class="easyui-datetimebox" size="20" value=""  style="height:22px"></td>
            </tr>
			<tr>
                <td class="left">创建时间</td>
                <td class="right"><input id ="createTime" name="createTime" disabled="disable" class="easyui-datetimebox" size="20" value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">下架时间</td>
                <td class="right"><input id ="disableTime" name="disableTime" data-options="required:true,editable:false" class="easyui-datetimebox" size="20" value=""  style="height:22px"></td>
            </tr>
            <tr>
                <td class="left">图片</td>
                <td class="right"><input id ="file" name="file" data-options="required:true" accept="image/png,image/jpeg,image/tiff" class="easyui-filebox" size="20" value=""  style="height:22px"><label style="color:red">*格式为png,jpg,jpeg,tiff的图片</label></td>
            </tr>
        </table>
    </div>

</form>
<script type="text/javascript"> 
    $(document).ready(function(){
		$('#typeId').combotree({
			onSelect:function(node){
			   if(node!=null){
				$('#imageType').combobox('setValue',node.imageType);
				if(node.imageType==3){
					$('#url').textbox({
						required:false,
						editable:false
					});
				}else{
					$('#url').textbox({
						required:true,
						editable:true
					});
				}
				$.parser.parse($('#url'));
				}
			}
		});
	});
</script>
</body>

</html>