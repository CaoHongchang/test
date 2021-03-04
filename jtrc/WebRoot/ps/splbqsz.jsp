<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>商品轮播区设置</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-form.js"></script>
    <script>
    $(function() {

	//alert("dd");
	//$('#addNotice1').hide();
	//$('#addNotice2').hide();
	//$('#addNotice3').hide();
	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){

	var url = "../game.php?doAction=act_popri";
	$.post(url,null,function(data){
		if(data.flag7==10){
			
			$('#addNotice1').show();
			
			
		}
		if(data.flag8==11){
			$('#addNotice2').show();
			
			
		}
		if(data.flag9==12){
			$('#addNotice3').show();
		}
	},"json");
var url = "../advertInfo/list?type=2&name="+$('#name1').val();
$('#noticeRs').datagrid({
	fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	sortName: 'tc,zgq,jhb,jscore,tgjj,ztnum,zwnum,xfje',
	sortOrder: 'desc',
	remoteSort: false,
	pagination:true,
	url:url,
	columns:[[
	            {title:'编号',field:'id',width:60,align:'center'},
	            {title:'商家名称',field:'name',width:60,align:'center'},
				{title:'排序',field:'seq',width:100,align:'center'},
				{title:'缩略图',field:'img_url',width:100,align:'center'},
				{title:'链接',field:'link_url',width:100,align:'center'},
				{title:'时间',field:'add_date',width:100,align:'center'},
				{title:'操作人',field:'uname',width:100,align:'center'}
				
			]]

});
	
}
function closeProduct(){
$('#w2').window('close');
init();
}
function publicNotice(){
	$('#w2').window('open');
	$('#sssid').val(0);
	$('#link_url').val("");
	$('#seq').val("");
	$('#name').val("");

}
function mdNotice(){
	
	  
	    
	$('#w2').window('open');
	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		$('#link_url').val(row.link_url);
	    $('#seq').val(row.seq);
	    $('#name').val(row.name);
	    $('#sssid').val(row.id);

	}
}
function delNotice(){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		var index = $('#noticeRs').datagrid('getRowIndex', row);
		$('#noticeRs').datagrid('deleteRow', index);
		
		//alert(row.id);
		
		var url = "../advertInfo/delAdvertShop?id="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
			}else{
				alert("发布失败！");
			}
		},"json");
	}
	
}

  function subimtBtn() {  
       // var form = $("form[name=fileForm]"); 
        var options  = {    
            url:'../advertInfo/upload.do',    
            type:'post',    
            success:function(data)    
            {    
                var jsondata = eval("("+data+")");
                
                if(jsondata.flag==1){
                   alert("提交成功!");
                   init();
                 }else if(jsondata.flag==0){
                   alert("商家不存在!");
                 }else{
                  alert("提交失败!");
                 }
                /*
                if(jsondata.error == "0"){  
                    var url = jsondata.url;  
                    alert(url)  
                    $("#img").attr("src",url);  
                }else{  
                    var message = jsondata.message;  
                    alert(message);  
                }  */
            }    
        };    
        $("#form").ajaxSubmit(options);  
        //$("#fileForm").submit();  
  }

    
    </script>
    
</head>
<body class="easyui-layout">

   <div region="center" border="false" split="false" style="overflow:hidden;">
			<table class="table-edit" width="100%" >	
			<tr>
			
			<td align="right" nowrap="nowrap"><b>商家:</b></td>
 			    <td><input type="text" id="name1" name="name1"/></td>
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		    <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="init()">查询 </a> 
 			<a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="publicNotice()">新增 </a> 
 			<a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="mdNotice()">修改 </a> 
 			<a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="delNotice()">删除 </a> 

		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
   <div id="w2"  class="easyui-window"  closed="true" title="商家轮播信息" iconCls="icon-save" style="width:350px;height:300px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:300px;height:200px;padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="form" action="../advertInfo/upload.do" method="post" enctype="multipart/form-data">
				<input type="hidden" id="sssid" name="sssid"/>
				<table cellpadding=5>
			            
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">图片：</div>
				            </td>
				            <td>
				                  
									 <input type="file" name="file" /> 
									
				            </td>
				            </tr>
				            <tr>
				            <td nowrap>
				            	 <div align="right">图片链接：</div>
				            </td>
				            <td>
				            	<input id="link_url" name="link_url"  style="width:150px;"></input>
				            </td>
				            </tr>
				       
				             <td nowrap>
				            	 <div align="right">顺序：</div>
				            </td>
				            <td>
				            	<input id="seq" name="seq"  style="width:150px;"></input>
				            </td>
			            </tr>
			   
			     
				            			                 <tr>
				            			            <td nowrap>
				            	 <div align="right">商家：</div>
				            </td>
				            <td>
				            	<input id="name" name="name"  style="width:150px;"></input>
				            </td>
				            			            </tr>
			             			        </table>
			</div>
			<div region="south" border="false" style="text-align:right;line-height:30px;">
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:subimtBtn()" >确定</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeProduct()" >取消</a>
			</div>
		</form>  
	</div>
</body>
</html>