<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>业务查看</title>

<body>
<script type="text/javascript">
var xgbmList='';
function loadYwData(id){
//页面表单数据加载
/*      $.ajax({
                url: basePath+"ywslsh/ywView?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                  $("#ywForm").form('load', data.rows);//赋值给表单
                  xgbmList=data.rows.xgbmList;
				}else{
					 $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            }); */
//debugger;
//$("#ywForm").form('load', '${rows}');//赋值给表单
}


function xgbmShow(){
$('#xgbmInfo').dialog({
    title: '相关部门审核查看',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/xgbmWin.jsp',
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xgbmInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   
   $('#xgbmShGrid').datagrid({    
    url:'',
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 350,
	

	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'zdUserName',title:'指定相关部门审核人',width : $(this).width() * 0.2,align:'center'},    
        {field:'userName',title:'相关部门审核人',width : $(this).width() * 0.2,align:'center'},    
        {field:'zt',title:'审核状态',width: $(this).width() * 0.2,align:'center'},
         {field:'sb_date',title:'审核时间',width: $(this).width() * 0.2,align:'center'},
         {field:'s_msg',title:'审核意见',width: $(this).width() * 0.2,align:'center'}
  
    ]]    
});  

   
   var rows='${rows.xgbmList}';
  
  if(rows!=null&&rows!=''){
    rows=eval(rows);
  }
   $('#xgbmShGrid').datagrid('loadData',rows);
    } //loadEnd
    

});

}
</script>
	<form id="ywForm" method="post">
   
    <table class="table3">
      <tr>
      <td class="left">业务类型</td>
      <td class="right"><input id ="ywlx" name="ywlx" value="${rows.ywlx}" class="easyui-textbox" size="100" style="width:500px;"  data-options="readonly:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">业务内容</td>
      <td class="right" style=""><input id ="ywlr" name="ywlr" value="${rows.ywlr}" class="easyui-textbox" size="100" style="width:500px;"  data-options="readonly:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">申请人</td>
      <td class="right"><input id ="sqr" name="sqr" value="${rows.sqr}" class="easyui-textbox" size="100" style="width:500px;"  data-options="readonly:true" style="height:22px"> 
      </td>
      </tr> 
       <tr>
      <td class="left">申请时间</td>
      <td class="right"  ><input id ="sqsj" name="sqsj"  value="${rows.sqsj}"  class="easyui-textbox" size="100" style="width:500px;"  data-options="readonly:true" style="height:22px">  </td>
      </tr>
      <tr>
       <td class="left">问题描述</td>
      <td class="right"><input id ="wtms" name="wtms" value="${rows.wtms}"  class="easyui-textbox"  data-options="readonly:true,multiline:true" style="height:62px;width: 500px"></td>
      </tr>
 <c:forEach var="item" items="${fjList}"  varStatus="item_index">
 
       <tr>
      <td class="left">附件</td>
      <td class="right"  >
  <a class="example-image-link" href="${item.fjUrl}" data-lightbox="example-1">
 <img class="example-image" src="${item.fjUrl}" alt="" width="100" height="100"/>
 </a>  
      </td>
      </tr>   
         </c:forEach>
      </table>  
    
      

    <div id="aa" class="easyui-accordion" style="height:750px;">   
       <div title="审核状态" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">受理人</td>
      <td class="right"><input id ="slr"  name="slr" value="${rows.slr}" class="easyui-textbox" size="20"  data-options="readonly:true" style="height:22px"></td>
      <td class="left">受理时间</td>
      <td class="right"><input id ="slsj" name="slsj" value="${rows.slsj}" class="easyui-textbox"  size="20" data-options="readonly:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">受理状态</td>
           <td class="right"><input id ="slzt" name="slzt" value="${rows.slzt}" class="easyui-textbox"  size="20" data-options="readonly:true" style="height:22px"></td>
      
      </tr>
      <tr>
       <td class="left">受理人审核意见</td>
      <td class="right" colspan="3"><input id ="slrshyj" name="slrshyj" value="${rows.slrshyj}"  class="easyui-textbox"  data-options="readonly:true,multiline:true" style="height:62px;width: 480px"></td>
      </tr>
      <tr>
      <td class="left">指定关联业务经办人</td>
      <td class="right"><input  id ="zdglywjbr" name="zdglywjbr"  value="${rows.zdglywjbr}"  class="easyui-textbox"  size="20" data-options="readonly:true"  style="height:22px"></td>
       <td class="left">关联业务经办人</td>
      <td class="right"><input id ="glywjbr" name="glywjbr" value="${rows.glywjbr}" class="easyui-textbox"  size="20" data-options="readonly:true"  style="height:22px"></td>
      
      </tr>
      
      <tr>
       <td class="left">关联业务经办人审核状态</td>
      <td class="right"><input id="glywjbrshzt" name="glywjbrshzt" value="${rows.glywjbrshzt}" class="easyui-textbox" size="20" data-options="readonly:true" style="height:22px">
         </td>
      <td class="left">业务经办人审核时间</td>
      <td class="right"><input id="glywjbrshsj" name="glywjbrshsj" value="${rows.glywjbrshsj}" class="easyui-textbox"  size="20" data-options="readonly:true" style="height:22px"></td>
      
      </tr>
       <tr>
      <td class="left">业务经办人审核意见</td>
      <td class="right" colspan="3"><input id="glywjbrshyj" name="glywjbrshyj"  value="${rows.glywjbrshyj}"  class="easyui-textbox"  data-options="readonly:true,multiline:true" style="height:62px;width: 480px"></td>
      
      </tr>
      <tr>
     <td class="left">指定宏业公司审核人</td>
      <td class="right"><input class="easyui-textbox" id="zdhygsshr" name="zdhygsshr" value="${rows.zdhygsshr}" size="20" data-options="readonly:true"  style="height:22px"></td>
       <td class="left">宏业公司审核人</td>
      <td class="right"><input class="easyui-textbox" id="hygsshr" name="hygsshr" value="${rows.hygsshr}" size="20" data-options="readonly:true"  style="height:22px"></td>
      
      </tr>
      
      <tr>
        <td class="left">宏业公司审核状态</td>
      <td class="right"><input class="easyui-textbox" id="hygsshzt" name="hygsshzt" value="${rows.hygsshzt}"  size="20" data-options="readonly:true"  style="height:22px"></td>
      <td class="left">宏业公司审核时间</td>
      <td class="right"><input class="easyui-textbox" id="hygsshsj" name="hygsshsj" value="${rows.hygsshsj}" size="20" data-options="readonly:true"  style="height:22px"></td>
      
      </tr>
      
       <tr>
      <td class="left">宏业公司审核意见</td>
      <td class="right" colspan="3"><input id="hygsshyj" name="hygsshyj" value="${rows.hygsshyj}"  class="easyui-textbox"  data-options="readonly:true,multiline:true" style="height:62px;width: 480px"></td>
      </tr>
       
        <tr>
       <td class="left"><a onclick="xgbmShow();" class="easyui-linkbutton" data-options="iconCls:'',plain:false" style="color: red">查看全部相关部门</a>
       </td>
      <td class="right"></td>
      <td class="left"></td>
      <td class="right"></td>
      
      </tr>
        <tr>
       <td class="left">指定相关部门审核人</td>
      <td class="right"><input class="easyui-textbox" id="zdxgbmshr" name="zdxgbmshr" value="${rows.zdxgbmshr}"  size="20" data-options="readonly:true"  style="height:22px"></td>
       <td class="left">相关部门审核人</td>
      <td class="right"><input class="easyui-textbox" id="xgbmshr" name="xgbmshr"  value="${rows.xgbmshr}"  size="20" data-options="readonly:true"  style="height:22px"></td>
      
      </tr>
     
      <tr>
       <td class="left">相关部门审核状态</td>
      <td class="right"><input class="easyui-textbox" id="xgbmshzt" name="xgbmshzt" value="${rows.xgbmshzt}"  size="20" data-options="readonly:true"  style="height:22px"></td>
      <td class="left">相关部门负责人审核时间</td>
      <td class="right"><input class="easyui-textbox"  id="xgbmfzrshsj" name="xgbmfzrshsj" value="${rows.xgbmfzrshsj}" size="20" data-options="readonly:true" style="height:22px"></td>
      
      </tr>
      
       <tr>
      <td class="left">相关部门审核意见</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="xgbmshyj" name="xgbmshyj" value="${rows.xgbmshyj}"  data-options="readonly:true,multiline:true" style="height:62px;width: 480px"></td>
      </tr>
      
       <tr>
       <td class="left">指定领导</td>
      <td class="right"><input class="easyui-textbox"  id="zdld" name="zdld" value="${rows.zdld}" size="20" data-options="readonly:true" style="height:22px"></td>
      <td class="left">领导</td>
      <td class="right"><input class="easyui-textbox"   id="ld" name="ld" value="${rows.ld}"  size="20" data-options="readonly:true" style="height:22px"></td>
      
      </tr>
      <tr>
      <td class="left">领导审核状态</td>
      <td class="right"><input class="easyui-textbox"   id="ldshzt" name="ldshzt" value="${rows.ldshzt}"  size="20" data-options="readonly:true" style="height:22px"></td>
         
      <td class="left">领导审核时间</td>
      <td class="right"><input class="easyui-textbox"   id="ldshsj" name="ldshsj"  value="${rows.ldshsj}" size="20" data-options="readonly:true" style="height:22px"></td>
      </tr>
        <tr>
      <td class="left">领导审核意见</td>
      <td class="right" colspan="3"><input  id="ldshyj" name="ldshyj" value="${rows.ldshyj}" class="easyui-textbox"  data-options="readonly:true,multiline:true" style="height:62px;width: 480px"></td>
      </tr>
      </table>  
      </div>   
   
       </div>

    </form> 
</body>

</html>
