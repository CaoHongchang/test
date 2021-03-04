<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/uploadify/css/uploadify.css">
<title>职称评审论文管理</title>

<script type="text/javascript">

Date.prototype.format = function(format) {
       var date = {
              "M+": this.getMonth() + 1,
              "d+": this.getDate(),
              "h+": this.getHours(),
              "m+": this.getMinutes(),
              "s+": this.getSeconds(),
              "q+": Math.floor((this.getMonth() + 3) / 3),
              "S+": this.getMilliseconds()
       };
       if (/(y+)/i.test(format)) {
              format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
       }
       for (var k in date) {
              if (new RegExp("(" + k + ")").test(format)) {
                     format = format.replace(RegExp.$1, RegExp.$1.length == 1
                            ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
              }
       }
       return format;
};
function dataF(timestamp3){
	var newDate = new Date();
	newDate.setTime(timestamp3);
	return newDate.format('yyyy-MM-dd');
}

$(function(){
    $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	  
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==229){
				$("#a").show();
			}else if(value==230){
				$("#b").show();
			}else if(value==231){
				$("#c").show();
			}
	});
    },"json");
   
   $('#pshdGrid').datagrid({    
   	url:basePath+"zcps/queryShLeftPageList", 
 	border:true,
 	pageSize:10,
 	pageList:[10,20,30,40],
 	striped: true,
 	singleSelect: true,
 	collapsible:true,
 	fitColumns:true,
	height: '100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	pagination : true,
	remoteSort: false,    
	columns:[[    
    	{field:'id',title:'选择',align:'center',hidden:true},
    	{field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
    	{field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'}   
	]],
	onClickRow:function(rowIndex, rowData){
		setListDate("",rowData.id);
	}  
	});  
	var pager = $('#pshdGrid').datagrid('getPager');
			pager.pagination({
					beforePageText : '第',// 页数文本框前显示的汉字
					afterPageText : '/ {pages} 页',
					displayMsg : '',
					buttons : [ {
						iconCls : 'icon-excel',
						handler : function() {
						}
					} ]
				});
	//setListDate("","");
});

var activityId;
function setListDate(param,id){
activityId = id;
$('#zcpshdGrid').datagrid({    
    url:'../zcps/queryZCPSBaseInfo?activityId='+activityId, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	pagination : true,
	height: '90%',
	width:'100%',
	toolbar: '#zcpslwglTool',
	singleSelect:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'name',title:'姓名',width : fixWidth(0.2),align:'center'},    
        {field:'sex',title:'性别',width : fixWidth(0.2),align:'center'},    
        //{field:'pnum',title:'身份证号',width: $(this).width() * 0.05,align:'center'},
         {field:'workName',title:'工作单位',width: fixWidth(0.2),align:'center'},
         {field:'workTime2',title:'参加工作时间',width: fixWidth(0.2),align:'center',formatter: function (value, row, index) { return dataF(value); }},
         //{field:'form_place',title:'单位所属地区',width: $(this).width() * 0.05,align:'center'},
         {field:'dPoint',title:'单位属性',width: fixWidth(0.2),align:'center'},
         {field:'adr',title:'通讯地址',width: fixWidth(0.3),align:'center'},
         {field:'technical',title:'专业技术职务',width: fixWidth(0.3),align:'center'},
          {field:'tel',title:'手机',width: fixWidth(0.2),align:'center'},
         /* {field:'g_tel',title:'固定电话',width: $(this).width() * 0.05,align:'center'},
          */{title:'操作',field:'1',width:fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
 				      return "<a  style=\"color: green;\" onclick=\"addFuc("+index+")\" >修改</a> <a  style=\"color: blue;\"  onclick=\"delFuc("+index+")\">删除</a>";
				}   
				}
         
         
  
    ]]    
});  
	var pager = $('#zcpshdGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
	
	
}






var userId;



function initxxjl()
{
	 //学习经历
    $('#xxjlGrid').datagrid({    
    url:'../zcps/queryStudyList?uid='+userId+"&activityId="+activityId, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	singleSelect:true,
	fitColumns:true,
	height: 150,
	width:'100%',
	toolbar: '#xxjltb',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
        {field:'school_name',title:'毕业院校',width:100},    
        {field:'graduation_date',title:'毕业时间',width:150},
        {field:'sxzy',title:'所学专业',width:150},    
        {field:'xz',title:'学制',width:150},    
        {field:'qdfs',title:'取得方式',width:150},    
        {field:'education',title:'学历',width:150},  
        {field:'degree',title:'学位',width:150}      
    
    ]]    
     });  
	var pager = $('#xxjlGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	 
}
	
	
function initgzjl()
{
	 //工作经历
	$('#gzjlGrid').datagrid({    
    url:'../zcps/queryWorkList?uid='+userId+"&activityId="+activityId, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect:true,
	height: 150,
	width:'100%',
	toolbar: '#gzjltb',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
        {field:'work_adr',title:'工作地点',width:100},    
        {field:'enterprise_id',title:'工作单位',width:150},
        {field:'work_name',title:'从事工作',width:150},    
        {field:'place_id',title:'职务',width:150},    
        {field:'start_date',title:'开始时间',width:150},    
        {field:'end_date',title:'结束时间',width:150},        
    
    ]]    
     });  
	var pager = $('#gzjlGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
     
}

function initjxjy()
{ 	//继续教育   
	$('#xxjyGrid').datagrid({    
    url:'../zcps/queryCEList?uid='+userId+"&activityId="+activityId,  
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect:true,
	height: 150,
	width:'100%',
	toolbar: '#jxjltb',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
        {field:'study_content',title:'学习内容',width:100},    
        {field:'study_time',title:'学时',width:150},
        {field:'study_method',title:'学习形式',width:150},    
      
        {field:'train_date',title:'开始时间',width:150},    
        {field:'out_date',title:'结束时间',width:150}
          
    
    ]]    
     });  
	var pager = $('#xxjyGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
     
	
}
	
	
	
function initlwzz(){	
//申报论文         
$('#sblwGrid').datagrid({    
    url:'../zcps/queryPaperList?uid='+userId+"&activityId="+activityId, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 150,
	width:'100%',
	toolbar: '#sblwtb',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
        {field:'dissetation_name',title:'论文题目',width:100},    
        {field:'j_date',title:'刊出交流时间',width:100},
        {field:'j_msg',title:'刊出交流情况（刊物及会议名称、刊号等）',width:250},    
      
        {field:'is_send',title:'是否送审代表作',width:100,
        	formatter: function(value,row,index){
            if (value == '1') {
          	    return "是";
			}else {
          	    return "否";
		    }
	     }},    
        {field:'remark',title:'备注',width:200}
          
    
    ]]    
     });  
	var pager = $('#sblwGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});

}

function delFuc(index){
	var row;
    if(index==''){
      row=$('#zcpshdGrid').datagrid('getSelected');
    }
    if(row==null){
      row=$('#zcpshdGrid').datagrid('getRows')[index];
    }
    if(row==null||row==undefined){
      $.messager.alert('系统提示','请选择您要修改的基本信息！','info');
      return;
    }
	if(confirm("是否删除?")){
	    var url = "../zcps/zcsbdel";
		$.post( url, {
			delid :row.id + ""			
		}, function(data) {

			if (data.flag == 1) {

				alert("删除成功");
				$('#zcpshdGrid').datagrid('reload');
				initlwzz();
			} else {

				alert("删除失败!");

			}
		}, "json");
	}

}


var rowid ;
function addFuc(index){
    var row;

    if(index===''){
      row=$('#zcpshdGrid').datagrid('getSelected');
    }else{
      row=$('#zcpshdGrid').datagrid('getRows')[index];
    }
    if(row==null||row==undefined){
      $.messager.alert('系统提示','请选择您要修改的基本信息！','info');
      return;
    }
	$('#zcpsjbxxAddInfo').dialog({
    title: '申报信息修改',
    width: 750,
    height: 500,
    resizable:true,
    closed: false,
    cache: false,
    href: '../zcsbgl/zcpsjbxxglAdd.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){				
					post_save();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zcpsjbxxAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		
		userId = row.uid;
		//$('#fm').form('load',row);
		rowid = row.id;
        $('#activityId').val(activityId);
		$('#wRemark').textbox('setValue',row.wRemark);
		$('#rowid').val(rowid);
		$('#name').textbox('setValue',row.name);
		
		if(row.sex=="1")
		
		$('#sex').textbox('setValue',"男");
		else if(row.sex=="0")
		
		$('#sex').textbox('setValue',"女");
		else
		$('#sex').textbox('setValue',row.sex);
		$('#workName').textbox('setValue',row.workName);
		$('#workTime2Str').textbox('setValue', dataF(row.workTime2));
		$('#dPoint').textbox('setValue',row.dPoint);
		$('#curPos').textbox('setValue',row.curPos);
		$('#adr').textbox('setValue',row.adr);
		$('#technical').textbox('setValue',row.technical);
		$('#email').textbox('setValue',row.email);
		$('#zNo').textbox('setValue',row.zNo);
		$('#tel').textbox('setValue',row.tel);
		$('#pnum').textbox('setValue',row.pnum);
		$('#birthDate').textbox('setValue',row.birthDate);
		$('#sPro').textbox('setValue',row.sPro);
		$('#prDate').textbox('setValue',dataF(row.prDate));
	
		if(row.zType=="非交通专业"){
		 
		
		       $("#xp_pro + .combo").hide();
			    $("#d").show();
			   $("#xp_pro").removeAttr("name");
			   $("#xp_pro1").attr("name","xpPro");
			   $('#xp_pro1').textbox('setValue',row.xpPro);
		}else{
		
		 	 $("#xp_pro + .combo").show();
		     $("#d").hide();
		     $("#xp_pro1").removeAttr("name");
		     $("#xp_pro").attr("name","xpPro");
		     $('#xp_pro').combobox('setValue',row.xpPro);
		}

			 if(row.point!="福建省交通人才服务中心"){
			       $("#point_2").show();
			       $('#point').combobox('setValue',"其他");
			       $('#point_a').textbox('setValue',row.point);
			  }else{
			  	  $("#point_2").hide();
			  	   $('#point').combobox('setValue',row.point);
			  	     $('#point_a').textbox('setValue',"");
			  }
		$('#zType').combobox('setValue',row.zType);
		
		$('#pTime').textbox('setValue',row.pTime);
		
		if(row.isOther=="是"){
			$('#isOther').attr('checked',true);
		}else{
			$('#isOther').attr('checked', false);
		}
		$('#workNow').textbox('setValue',row.workNow);
		$('#workTime').textbox('setValue',row.workTime);
		
		$('#sLevel').combobox('setValue',row.sLevel);
		$('#sType').combobox('setValue',row.sType);
		$('#sName').textbox('setValue',row.sName);
		$('#jscore').textbox('setValue',row.jscore);
		
		if(row.sId=="正常晋升"){
		$('#sId1').attr('checked',true);
		$('#sId2').attr('checked',false);
		}
			
		else{
		$('#sId1').attr('checked',false);
		$('#sId2').attr('checked',true);
		}
		
	   $('#mz').combobox('setValue',row.mz);
	   $('#formPlace').textbox('setValue',row.formPlace);
	   $('#getTime').textbox('setValue',row.getTime);
	   $('#zipCode').textbox('setValue',row.zipCode);
	   $('#gTel').textbox('setValue',row.gTel);
	   $('#qq').textbox('setValue',row.qq);
	
		$('#xzPos').textbox('setValue',row.xzPos);
		$('#yearK').textbox('setValue',row.yearK);
		$('#url').textbox('setValue',row.url);
	
		
		initxxjl();
		initgzjl();
		initjxjy();
		initlwzz();
    } //loadEnd
    

});


}//addFuc End


function addLwzzFuc(){
	$('#zcpslwxgAddInfo').dialog({
    title: '论文专著操作',
    width: 900,
    height: 500,
   
    closed: false,
    cache: false,
    href: '../zcsbgl/zcpsjbxxgllwzzAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zcpslwxgAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    var  editor = CKEDITOR.replace('aboutusDescription');
     
    }  
     
    
});


}


//查询
function query(){
     $('#zcpshdGrid').datagrid('load',{});

}
</script>


<body style="margin: 1px;">
 

<div id="tb">

 
	
	
	<div id="zcpslwglTool"  style="background-color:#FFFFFF;">

		<a id="a" onclick="addFuc('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a  id="b" onclick="delFuc('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="c" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		
	</div>

</div>
 <div id="cc" class="easyui-layout" data-options="fit:true,border:false">   

		<div data-options="region:'west',title:'评审活动列表',split:true,border:false" style="width:300px;">
			<table id="pshdGrid"></table>  

		</div>   
		<div data-options="region:'center',title:'用户申报列表',border:false" style="">
			<table id="zcpshdGrid"></table>    
		</div>   
	</div>  
<div id="zcpsjbxxAddInfo"></div>
<div id="zcpslwxgAddInfo"></div>

</body>
</html>
