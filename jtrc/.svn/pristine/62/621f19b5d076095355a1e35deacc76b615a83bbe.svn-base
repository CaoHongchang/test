<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>




<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>工资管理</title>

<script type="text/javascript">
var sc=false;
var xg = false;
	$(function(){
	
		$("#sygzxz").hide();
    $("#qygzxz").hide();
    $("#dcgz").hide();
    $("#cx").hide();
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==177){
				$("#sygzxz").show();
			}else if(value==178){
				$("#qygzxz").show();
			}else if(value==179){
				$("#dcgz").show();
			}else if(value==180){
				$("#cx").show();
			}else if(value==181){
				xg=true;
			}else if(value==182){
				sc=true;
			}
	});
    },"json");
      queryGzgl(null);
  

	
	
	});

function queryGzgl(param){
 $('#gzglGrid').datagrid({    
    url:basePath+"gzgl/gzView",
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	pagination: true, 
	fitColumns:true,
	height: wholeHeight,
	width:'100%',
	//singleSelect:true,
	//toolbar: '#ywflglTool',
	queryParams: {
		param: param
		
	},  
	//fit:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'gzffsj',title:'工资发放时间',width : fixWidth(0.2),align:'center'},    
        {field:'zzjgdm',title:'组织机构代码',width : fixWidth(0.2),align:'center'},    
        {field:'qymc',title:'企业名称',width: fixWidth(0.2),align:'center'},
         {field:'qyxz',title:'企业性质',width: fixWidth(0.2),align:'center'},
         {field:'sfz',title:'身份证',width: fixWidth(0.3),align:'center'},
         {field:'xm',title:'姓名',width: fixWidth(0.2),align:'center'},
         {field:'gzze',title:'工资总额',width: fixWidth(0.2),align:'center'},
           {field:'uid',title:'工资用户id',width: fixWidth(0.2),align:'center',hidden:true},
          {field:'qyid',title:'企业id',width: fixWidth(0.2),align:'center',hidden:true},
         {field:'gzlxId',title:'事业工资/企业工资',width:fixWidth(0.2),align:'center',formatter: function(value,row,index){
         if(value==1){
         return '企业工资';
         }else{
         return '事业工资';
         }
         
         }},
         
         {title:'操作',field:'id',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
		    		  if(sc&&xg)
 				      return '<a id="xg" href="#" style="color: green;"  onclick="addgzxgFuc(\''+row.id+'\',\''+row.gzlxId+'\')">修改</a> <a id="sc" href="#" style="color: blue;"  onclick="delgzFuc(\''+row.id+'\',\''+row.gzlxId+'\')">删除</a>';
				      else if(!sc&&xg)
				        return '<a id="xg" href="#" style="color: green;"  onclick="addgzxgFuc(\''+row.id+'\',\''+row.gzlxId+'\')">修改</a> ';
				      else if(sc&&!xg)
				       return '<a id="sc" href="#" style="color: blue;"  onclick="delgzFuc(\''+row.id+'\',\''+row.gzlxId+'\')">删除</a>';
				}   
				}
  
    ]]    
});  
	var pager = $('#gzglGrid').datagrid('getPager');
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
//工资修改
function addgzxgFuc(id,gzlxId){
    if(id==null||id==''){
    $.messager.alert('提示','选择的数据有误！');
    return;
    }
    var url='';
    var title='';
    if(gzlxId=='1'){//企业修改
       url=basePath+"hygsgl/gzglqyAdd.jsp";
       title='企业工资修改';
    
    }else{//事业修改
       url=basePath+"hygsgl/gzglsyadd.jsp";
       title='事业工资修改';
    }
    
    
	$('#gzglInfo').dialog({
    title: title,
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: url,
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				  saveEditgz();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gzglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
        //修改页面加载
        getGzMsg(id,gzlxId);
    
    $('#qymc').combobox({    
    valueField:'qyid',    
    textField:'qymc',
    url:basePath+'yggl/ygList',    
        onSelect:function(values){
             $('#enterpriseId').val(values.qyid);
             $('#qyxz').combobox('setValue', values.qyxz);
              var url = basePath+'yggl/ygList?qyid='+values.qyid;
              $('#sfz').combobox('reload', url); 
        } 
        });
        
        $('#sfz').combobox({    
        valueField:'sfz',    
        textField:'sfz',
        onSelect:function(values){
             $('#xm').textbox('setValue', values.xm);
             $('#xb').textbox('setValue', values.xb);
           
             $('#uid').val(values.uid);
        } 
        });
        
    } //loadEnd
    

});

}

function delgzFuc(id,gzlxId){
$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
  if (r){         
	if(id=='' || id==null){
	$.messager.alert('错误','id为空，操作失败！','error');
	return;
}
$.ajax({
                url: basePath+"gzgl/delGzFuc?id="+id+"&gzlxId="+gzlxId,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                 async: true,
                success: function(data){
                if(data.flag ==true){
                     //$('#gzglGrid').datagrid('reload');
                      	  queryGzgl(null);
                      	$.messager.alert('提示信息','操作成功！','info');

                    
					}else{
					   $.messager.alert('错误','操作失败！','error');

					}	
                },
                error: function(data){
                  
                   $.messager.alert('错误','操作失败！','error');

                }
            });
       
    }    
});

}


//事业工资新增
function addgzglFuc(){
	$('#gzglInfo').dialog({
    title: '事业工资新增',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/gzglsyadd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				saveSygzxz();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gzglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   //企业名称
   $('#qymc').combobox({    
    valueField:'qyid',    
    textField:'qymc',
    url:basePath+'yggl/ygList',    
        onSelect:function(values){
             $('#enterpriseId').val( values.qyid);

             $('#qyxz').combobox('setValue', values.qyxz);
              var url = basePath+'yggl/ygList?qyid='+values.qyid;
              $('#sfz').combobox('reload', url); 
        } 
        });
        //身份证选中
        $('#sfz').combobox({    
        valueField:'sfz',    
        textField:'sfz',
        onSelect:function(values){
             $('#xm').textbox('setValue', values.xm);
             $('#xb').textbox('setValue', values.xb);
             $('#uid').val(values.uid);
             //工资状态
              $.ajax({
                url: basePath+"gzgl/queryGz?gzlxId=2&isGzzk=true&pnum="+values.sfz,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                     if(data.rows!=null){
                     var r=eval(data.rows);
                     $('#pos').textbox('setValue', r.pos);
                     $('#salary').textbox('setValue', r.salary);
                     $('#allowance').textbox('setValue', r.allowance);
                     $('#subsistence').textbox('setValue', r.subsistence);
                     $('#basic').textbox('setValue', r.basic);
                     $('#higher').textbox('setValue', r.higher);
                     $('#keepSalary').textbox('setValue', r.keepSalary);
                     $('#otherWages').textbox('setValue', r.otherWages);
                     $('#subsidy').textbox('setValue', r.subsidy);
                     $('#other').textbox('setValue', r.other);
                     $('#allSalary').textbox('setValue', r.allSalary);
                     }else{
                     // $('#pos').textbox('setValue', '0');
                     $('#salary').textbox('setValue', '0');
                     $('#allowance').textbox('setValue', '0');
                     $('#subsistence').textbox('setValue', '0');
                     $('#basic').textbox('setValue', '0');
                     $('#higher').textbox('setValue', '0');
                     $('#keepSalary').textbox('setValue', '0');
                     $('#otherWages').textbox('setValue', '0');
                     $('#subsidy').textbox('setValue', '0');
                     $('#other').textbox('setValue', '0');
                     $('#allSalary').textbox('setValue', '0');
                     
                     }
					}
                },
                error: function(data){
                  
                   //$.messager.alert('错误','操作失败！','error');

                }
            });
        } 
        });
    
    //事业工资新增，如果选中了列表一条数据点击新增则绑定最近列表数据
     var gzRows = $('#gzglGrid').datagrid('getSelections');
  
     if(gzRows.length==1){
     // $('#qymc').textbox('setValue', gzRows[0].qymc);
     //$('#sfz').combobox('setValue', gzRows[0].sfz);
     //工资状态
              $.ajax({
                url: basePath+"gzgl/queryGz?gzlxId="+gzRows[0].gzlxId+"&isGzzk=true&id="+gzRows[0].id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                     if(data.rows!=null){
                     var r=eval(data.rows);
                     debugger;
                     
                     $('#salaryDate').datebox('setValue', r.salaryDate);
                     $('#enterpriseId').val(gzRows[0].qyid);
                     $('#uid').val(gzRows[0].uid);//工资用户id
                     $('#qymc').combobox('setValue', r.qymc);
                     $('#qyxz').combobox('setValue', r.qyxz);
                     $('#sfz').combobox('setValue', r.sfz);
                     $('#xm').textbox('setValue', r.xm);
                     $('#xb').combobox('setValue', r.xb);
                     
                      
                     $('#pos').textbox('setValue', r.pos);
                     $('#salary').textbox('setValue', r.salary);
                     $('#allowance').textbox('setValue', r.allowance);
                     $('#subsistence').textbox('setValue', r.subsistence);
                     $('#basic').textbox('setValue', r.basic);
                     $('#higher').textbox('setValue', r.higher);
                     $('#keepSalary').textbox('setValue', r.keepSalary);
                     $('#otherWages').textbox('setValue', r.otherWages);
                     if( r.subsidy!=null&&typeof( r.subsidy)!= "undefined"&& r.subsidy!='')
                     $('#subsidy').textbox('setValue', r.subsidy);
                     else
                       $('#subsidy').textbox('setValue', 0);
                     $('#other').textbox('setValue', r.other);
                     $('#allSalary').textbox('setValue', r.allSalary);
                     
                     
                     }
                     }
               },
                error: function(data){
                  
                   //$.messager.alert('错误','操作失败！','error');

                }
            });
     
      } 
      if(gzRows.length>1){
      $.messager.alert('提示','只能同时勾选一条记录关联新增！','info');
      return;
      }
    } //loadEnd
    

});

}


//企业工资新增
function addgzglFuc2(){
	$('#gzglInfo').dialog({
    title: '企业工资新增',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/gzglqyAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				saveSygzxz();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gzglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
  $('#qymc').combobox({    
    valueField:'qyid',    
    textField:'qymc',
    url:basePath+'yggl/ygList',    
        onSelect:function(values){
             $('#enterpriseId').val( values.qyid);

             $('#qyxz').combobox('setValue', values.qyxz);
              var url = basePath+'yggl/ygList?qyid='+values.qyid;
              $('#sfz').combobox('reload', url); 
        } 
        });
        
        $('#sfz').combobox({    
        valueField:'sfz',    
        textField:'sfz',
        onSelect:function(values){
             $('#xm').textbox('setValue', values.xm);
             $('#xb').textbox('setValue', values.xb);
             $('#uid').val(values.uid);
             
                  //工资状态
              $.ajax({
                url: basePath+"gzgl/queryGz?gzlxId=1&isGzzk=true&pnum="+values.sfz,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                     if(data.rows!=null){
                     var r=eval(data.rows);
                     $('#pos').textbox('setValue', r.pos);
                     $('#salaryBase').textbox('setValue', r.salaryBase);
                     $('#salary').textbox('setValue', r.salary);
                     $('#allowance').textbox('setValue', r.allowance);
                     $('#subsistence').textbox('setValue', r.subsistence);
                     $('#basic').textbox('setValue', r.basic);
                     $('#higher').textbox('setValue', r.higher);
                     $('#keepSalary').textbox('setValue', r.keepSalary);
                     $('#otherWages').textbox('setValue', r.otherWages);
                     $('#other').textbox('setValue', r.other);
                     $('#allSalary').textbox('setValue', r.allSalary);
                     }else{
                      //$('#pos').textbox('setValue', '0');
                     $('#salaryBase').textbox('setValue', '0');
                     $('#salary').textbox('setValue', '0');
                     $('#allowance').textbox('setValue', '0');
                     $('#subsistence').textbox('setValue', '0');
                     $('#basic').textbox('setValue', '0');
                     $('#higher').textbox('setValue', '0');
                     $('#keepSalary').textbox('setValue', '0');
                     $('#otherWages').textbox('setValue', '0');
                     $('#other').textbox('setValue', '0');
                     $('#allSalary').textbox('setValue', '0');
                     
                     }
					}
                },
                error: function(data){
                  
                   //$.messager.alert('错误','操作失败！','error');

                }
            });
             
        } 
        });
    
            
    //事业工资新增，如果选中了列表一条数据点击新增则绑定最近列表数据
     var gzRows = $('#gzglGrid').datagrid('getSelections');

     if(gzRows.length==1){
     // $('#qymc').textbox('setValue', gzRows[0].qymc);
     //$('#sfz').combobox('setValue', gzRows[0].sfz);
     //工资状态
              $.ajax({
                url: basePath+"gzgl/queryGz?gzlxId="+gzRows[0].gzlxId+"&isGzzk=true&id="+gzRows[0].id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                     if(data.rows!=null){
                     var r=eval(data.rows);
                     
                     $('#enterpriseId').val(gzRows[0].qyid);
                     $('#uid').val(gzRows[0].uid);//工资用户id
                     $('#salaryDate').datebox('setValue', r.salaryDate);
                     $('#qymc').combobox('setValue', r.qymc);
                     $('#qyxz').combobox('setValue', r.qyxz);
                     $('#sfz').combobox('setValue', r.sfz);
                     $('#xm').textbox('setValue', r.xm);
                     $('#xb').combobox('setValue', r.xb);
                     
                      
                     $('#pos').textbox('setValue', r.pos);
                     if( r.salaryBase!=null&&typeof( r.salaryBase)!= "undefined"&& r.salaryBase!='')
                     $('#salaryBase').textbox('setValue', r.salaryBase);
                     else
                     $('#salaryBase').textbox('setValue', 0);
                     
                     $('#salary').textbox('setValue', r.salary);
                     $('#allowance').textbox('setValue', r.allowance);
                     $('#subsistence').textbox('setValue', r.subsistence);
                     $('#basic').textbox('setValue', r.basic);
                     $('#higher').textbox('setValue', r.higher);
                     $('#keepSalary').textbox('setValue', r.keepSalary);
                     $('#otherWages').textbox('setValue', r.otherWages);
                     $('#other').textbox('setValue', r.other);
                     $('#allSalary').textbox('setValue', r.allSalary);
                     }
                     }
               },
                error: function(data){
                  
                   //$.messager.alert('错误','操作失败！','error');

                }
            });
     
      } 
      
      if(gzRows.length>1){
      $.messager.alert('提示','只能同时勾选一条记录关联新增！','info');
      return;
      }
    
    
    
    } //loadEnd
    

});

}
//工资导出
 function exportgzglFuc(){
    
    window.location.href=basePath+"gzgl/gzExport";

} 


function searchGzglDiv(){
   
    $('#gzglSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/hygsgl/gzglSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gzglSearchInfo').dialog('close');
				}
			}]   
}); 
    
}


 //导入文件
 function importFuc(type){
	$("#addGzFileForm").ajaxSubmit({
		dataType:"html",
		url : "../gzgl/gzUpload?type="+type,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $('#addGzFileForm')[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag==false){
			    $.messager.alert('错误',result.cause,'error');
			    return;
			    
			}
			var dateFlag1=result.dateFlag1;
			 var dateFlag2=result.dateFlag2;
			    //展示数据
				 addgzdrFuc(result.rows1,result.rows2,dateFlag1,dateFlag2);
				
			
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 


function addgzdrFuc(datas1,datas2,dateFlag1,dateFlag2){debugger;
	$('#gzdrInfo').dialog({
    title: '工资导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/gzdrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   if(dateFlag1=='true'&&dateFlag2=='true'){
				    $.messager.alert('错误','事业工资，企业工资中导入存在错误提示请核查！','error');
			         return;
				   }
				   if(dateFlag2=='true'){
				    $.messager.alert('错误','企业工资导入存在错误提示请核查！','error');
			         return;
				   }
				   if(dateFlag1=='true'){
				    $.messager.alert('错误','事业工资导入存在错误提示请核查！','error');
			         return;
				   }
				   savaGz(datas1,datas2);
				   $('#gzdrInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gzdrInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#gzdrSyGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        
        {field:'id',title:'序列',width: $(this).width() *0.15},
        {field:'gzffsj',title:'工资发放时间',width: $(this).width() *0.15},
        /* {field:'qymc',title:'企业名称',width: $(this).width() *0.15},
        {field:'qyxz',title:'企业性质',width: $(this).width() *0.15}, */
        {field:'zzjgbm',title:'组织机构代码',width: $(this).width() *0.15},
        {field:'sfz',title:'身份证',width: $(this).width() *0.15},
        /* {field:'xm',title:'姓名',width: $(this).width() *0.15},*/
        {field:'zwgw',title:'职务岗位',width: $(this).width() *0.15}, 
        {field:'gzxd',title:'工资薪档',width: $(this).width() *0.15},
        {field:'gwjt',title:'岗位津贴',width: $(this).width() *0.15},
        {field:'shbt',title:'生活补贴',width: $(this).width() *0.15},
        {field:'jcjx',title:'基础绩效',width: $(this).width() *0.15},
        {field:'gcjx',title:'高出绩效',width: $(this).width() *0.15},
        {field:'blgz',title:'保留工资',width: $(this).width() *0.15},
        {field:'qtgz',title:'其它工资',width: $(this).width() *0.15},
        {field:'tzbt',title:'提租补贴',width: $(this).width() *0.15},
        {field:'qt',title:'其它',width: $(this).width() *0.15},
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#gzdrSyGrid').datagrid('getPager');
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
	
	  
    $('#gzdrQyGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        
        {field:'id',title:'序列',width: $(this).width() *0.15},
        {field:'gzffsj',title:'工资发放时间',width: $(this).width() *0.15},
        /* {field:'qymc',title:'企业名称',width: $(this).width() *0.15},
        {field:'qyxz',title:'企业性质',width: $(this).width() *0.15}, */
        {field:'zzjgbm',title:'组织机构编码',width: $(this).width() *0.15},
        {field:'sfz',title:'身份证',width: $(this).width() *0.15},
        /* {field:'xm',title:'姓名',width: $(this).width() *0.15},
        {field:'xb',title:'性别',width: $(this).width() *0.15}, */
         {field:'zwgw',title:'职务岗位',width: $(this).width() *0.15}, 
        {field:'qt',title:'其它',width: $(this).width() *0.15},
        {field:'gzze',title:'工资总额',width: $(this).width() *0.15},
        {field:'jbgz',title:'基本工资',width: $(this).width() *0.15},
        {field:'glgz',title:'工龄工资',width: $(this).width() *0.15},
        {field:'jtbt',title:'津贴补贴',width: $(this).width() *0.15},
        {field:'yjj',title:'月奖金',width: $(this).width() *0.15},
        {field:'jbgz2',title:'加班工资',width: $(this).width() *0.15},
        {field:'jxgz',title:'绩效工资',width: $(this).width() *0.15},
        {field:'qtgz1',title:'其它工资1',width: $(this).width() *0.15},
        {field:'qtgz2',title:'其它工资2',width: $(this).width() *0.15},
         {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#gzdrQyGrid').datagrid('getPager');
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
	
	
	if(datas1!=null&&typeof(datas1)!= "undefined"&&datas1!=''){
	$('#gzdrSyGrid').datagrid('loadData',datas1);
	$('#gztt').tabs('close', 1);
	}
	if(datas2!=null&&typeof(datas2)!= "undefined"&&datas2!=''){
	
	$('#gzdrQyGrid').datagrid('loadData',datas2);
	$('#gztt').tabs('close', 0);
	}

    
    } //loadEnd
    

});

}


function savaGz(datas1,datas2){
datas1=JSON.stringify(datas1);
datas2=JSON.stringify(datas2);

  $.blockUI();
    $.ajax({
                url: "../gzgl/addGzList",
                type: "POST",
                dataType:"json",
                data:{"syData":datas1,"qyData":datas2,"sessionUserId":sessionUserId},  
                async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     $('#gzglGrid').datagrid('reload');
                     
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                   $.unblockUI();
                   errorMsg();

                }
            });
}

 function exportgzFuc(type){
    window.location.href="../gzgl/gzDownload?type="+type;

} 

</script>


<body style="margin: 1px;">
 

<form id="addGzFileForm" method="post" action="../gzgl/gzUpload" enctype="multipart/form-data" >

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="addgzglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="sygzxz">事业工资新增</a>
		<a onclick="addgzglFuc2();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="qygzxz">企业工资新增</a>
		<a onclick="exportgzglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true" id="dcgz">导出工资</a>
		<a onclick="searchGzglDiv();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="cx">查询</a>
		  <a id="drwj0" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
		<input  onchange="importFuc('0')" id="ygfile0" name= "ygfile0" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入事业工资</a>
        <a id="drwj1" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="importFuc('1')" id="ygfile1" name= "ygfile1" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入企业工资</a>
        
        <a id="dcmb0" onclick="exportgzFuc('0');" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出事业工资模板</a>
        <a id="dcmb1" onclick="exportgzFuc('1');" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出企业工资模板</a>
	</div>

</div>
</form>
<div>
<table id="gzglGrid"></table>  
</div>
<div id="gzglInfo"></div>
<div id="gzglSearchInfo"></div>
<div id="gzdrInfo"></div>
</body>
</html>
