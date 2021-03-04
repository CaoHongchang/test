<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>


<html>
<head>
<title>党费缴交列表</title>
</head>

<script type="text/javascript">
	$(function(){
        loadList();
	});

	function view() {
		$('#viewInfo').dialog( {
			title : '党费查看',
			width : 600,
			height : 500,
			closed : false,
			cache : false,
			href : '../dfgl/dfView.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#viewInfo').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			   loadList();
			}
		});
	}


	function loadList(){
		$('#dfjjGrid').datagrid( {
			url : '../dfgl/queryPartyFeeMsgs',
			border : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			pagination:true,
			striped : true,
			collapsible : true,
			//fitColumns : true,
			width : '100%',
			height:400,
			toolbar : '#userAddTool',
			sortName : '',
			sortOrder : 'desc',
			remoteSort : false,
			columns : [ [ {
				field : 'id',
				title : '选择',
				checkbox : true,
				align : 'center'
			}, {
				field : 'pno',
				title : '党员编码',
				width : fixWidth(0.2),
				align : 'center'
			}, {
				field : 'pnum',
				title : '身份证号',
				width : fixWidth(0.2),
				align : 'center'
			}, {
				field : 'name',
				title : '姓名',
				width : fixWidth(0.1),
				align : 'center'
			}, {
				field : 'sex',
				title : '性别',
				width : fixWidth(0.1),
				align : 'center'
			}, {
				field : 'party_date',
				title : '入党时间',
				width : fixWidth(0.1),
				align : 'center'
			}, /*{
				field : 'm_his',
				title : '历史已缴金额',
				width : fixWidth(0.1),
				align : 'center'
			},*/ {
				field : 'his_date',
				title : '历史党费缴至',
				width : fixWidth(0.1),
				align : 'center'
			}/*, {
				field : 'add_m',
				title : '应缴总额',
				width : fixWidth(0.1),
				align : 'center'
			}, {
				field : 'm',
				title : '已缴金额',
				width : fixWidth(0.1),
				align : 'center'
			}, {
				field : 'need_m',
				title : '需缴纳金额',
				width : fixWidth(0.1),
				align : 'center'
			}*/

			] ]
		});
		var pager = $('#dfjjGrid').datagrid('getPager');
		pager.pagination( {
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
    //提交缴费基准
    function submitJfjz(params){
        	$.post('../dfgl/savePartyBaseInfos',params,function(result){
    	 	  		if(result.result==1){
    	 	  		$('#drjfjzInfo').dialog('close');
    	 	  		$.messager.alert('系统提示','数据保存成功','info');
    	 	  		}
    	 	},'json');
    }
    
	//导入缴费基准
    function drjfjz(){
    	$("#baseFormImport").dialog({
    		title:'缴费基准导入',
    		width:300,
    		heigth:100,
    		closed:false,
    		cache:false,
    		href:'../dfgl/baseFormImport.jsp',
    		modal:true,
    		buttons:[{
    	      text:'保存',
    	      iconCls:'icon-ok',
    	      handler:function(){
    	    	 var url="<%=request.getContextPath()%>/dfgl/importPartyBaseInfo?"; 
    	    	 uploadExcel(url, function(data){
    	    		 $('#drjfjzInfo').dialog( {
    	 	  			title : '缴费基准导入',
    	 	  			width : 600,
    	 	  			height : 400,
    	 	  			closed : false,
    	 	  			cache : false,
    	 	  			href : '../dfgl/dfjzdrAdd.jsp',
    	 	  			modal : true,
    	 	  			buttons : [ {
    	 	  				text : '保存',
    	 	  				iconCls : 'icon-ok',
    	 	  				handler : function() {
    	 	  					var result=$('#fm').form('validate');
    	 	  					var params=generateParams();
    	 	  					if(result){
    	 	  					if(judgeIsExistsErrmsg('dfjzGrid')){
    	 	  						$.messager.alert('系统提示','数据中包含错误信息！','info');
    	 	  					}
    	 	  					else if(params.pnum==''){
    	 	  					    $.messager.alert('系统提示','当前表格没有数据，不能保存！','info');
    	 	  					}
    	 	  					else{
    	 	  						$.post('../dfgl/checkIsPaidBaseExist',params,
    	 	  						 function(data){
    	 	  								if(data.result==1){//存在相同的缴费基准，提示是否覆盖
    	 	  									$.messager.confirm('以下的缴费基准已经存在，是否覆盖',data.msg,function(flag){
    	 	  										if(flag){//覆盖缴费基准
    	 	  										    submitJfjz(params)
    	 	  										}else{//不覆盖缴费基准
    	 	  										    params.pnum=params.pnum.split(",");
    	 	  										    params.pyear=params.pyear.split(",");
    	 	  										    params.baseM=params.baseM.split(",");
    	 	  										    var temp={pnum:[],pyear:[],baseM:[]};
    	 	  										    for(var i=0;i<params.pnum.length;i++){
    	 	  										       var flag1=false;
    	 	  										       var pnum=params.pnum[i],pyear=params.pyear[i],baseM=params.baseM[i];
    	 	  										       $.each(data.rows,function(index,value){
    	 	  										            if(value.pnum==params.pnum[i]&&value.pyear==params.pyear[i]){
    	 	  										               flag1=true;
    	 	  										               return true;
    	 	  										            }
    	 	  										       });
    	 	  										       if(!flag1){
    	 	  										          temp.pnum.push(pnum);
    	 	  										          temp.pyear.push(pyear);
    	 	  										          temp.baseM.push(baseM);
    	 	  										       }
    	 	  										    }
    	 	  										    temp.pnum=temp.pnum.join(',');
    	 	  										    temp.pyear=temp.pyear.join(',');
    	 	  										    temp.baseM=temp.baseM.join(',');
    	 	  										    if(temp.pnum!=''){
    	 	  											submitJfjz(temp);
    	 	  											}else{
    	 	  											   $.messager.alert('系统提示','当前的数据均已存在，若要修改请选择确定覆盖！','info');
    	 	  											}
    	 	  										}
    	 	  									});
    	 	  									
    	 	  								}else{//直接提交
    	 	  									submitJfjz(params);
    	 	  								}
    	 	  						
    	 	  						},'json');
    	 	  					}
    	 	  					}
    	 	  				}
    	 	  			}, {
    	 	  				text : '关闭',
    	 	  				iconCls : 'icon-cancel',
    	 	  				handler : function() {
    	 	  					$('#drjfjzInfo').dialog('close');
    	 	  				}
    	 	  			} ],
    	 	  			iconCls : 'icon-save',
    	 	  			onLoad : function() {
    	 	  			    $("#dfjzGrid").datagrid('loadData',data.rows);
    	 	  			}
    	 	  		});
    	    	 });
    	      }
    		}
    	    ],iconCls:'icon-save'
    	});
    	
    }
    
     //提交历史党费缴至
    function submitLsdfjz(params){
        	$.post('../dfgl/updateHistoryPartyFee',params,function(result){	
	    	 	$.messager.alert('系统提示',result.msg,'info');
	    	 	if(result.flag){
	    	 	  	$('#drlsdfjjInfo').dialog('close');
	    	 }
	    	},'json');
    }
    //导入历史党费缴至
    function drlsdfjj(){
    	$("#baseFormImport").dialog({
    		title:'历史党费缴至导入',
    		width:300,
    		heigth:100,
    		closed:false,
    		cache:false,
    		href:'../dfgl/baseFormImport.jsp',
    		modal:true,
    		buttons:[{
    	      text:'保存',
    	      iconCls:'icon-ok',
    	      handler:function(){
    	    	  	var url="<%=request.getContextPath()%>/dfgl/importHistoryPartyFee"; 
     	    	 	uploadExcel(url, function(data){
    					$('#drlsdfjjInfo').dialog( {
						title : '历史党费缴至导入',
						width : 600,
						height : 400,
						closed : false,
						cache : false,
						href : '../dfgl/lsdfjzAdd.jsp',
						modal : true,
						buttons : [ {
							text : '保存',
							iconCls : 'icon-ok',
							handler : function() {
								var result=$("#fm").form('validate');
								if(result){
								   var params=generateHisPartyFeeParams();
									if(judgeIsExistsErrmsg('lsdfjzGrid')){
	    	 	  						 $.messager.alert('系统提示','数据中包含错误信息，请修改后重新导入！','info');
	    	 	  					}else if(params.pnum==''){
	    	 	  					     $.messager.alert('系统提示','当前表格没有数据，不能保存','info');
	    	 	  					}
	    	 	  					else{
	    	 	  					     $.post('../dfgl/checkIsHistoryPartyFeeExist',params,
	    	 	  		                 function(result){
	    	 	  					    	 if(result.result==1){//存在相同的缴费基准，提示是否覆盖
	    	 	  								 $.messager.confirm('以下的身份证历史党费缴至已经存在，是否覆盖',result.msg,function(flag){
	    	 	  								 if(flag){//覆盖
	    	 	  									 submitLsdfjz(params);
	    	 	  								 }
	    	 	  								 else{//不覆盖
	    	 	  										params.pnum=params.pnum.split(",");
    	 	  										    params.hisDate=params.hisDate.split(",");
    	 	  										    var temp={pnum:[],hisDate:[]};
    	 	  										    for(var i=0;i<params.pnum.length;i++){
    	 	  										       var flag1=false;
    	 	  										       var pnum=params.pnum[i],hisDate=params.hisDate[i];
    	 	  										       $.each(data.rows,function(index,value){
    	 	  										            if(value.pnum==params.pnum[i]&&value.hisDate==params.hisDate[i]){
    	 	  										               flag1=true;
    	 	  										               return true;
    	 	  										            }
    	 	  										       });
    	 	  										       if(!flag1){
    	 	  										          temp.pnum.push(pnum);
    	 	  										          temp.hisDate.push(hisDate);
    	 	  										       }
    	 	  										    }
    	 	  										    temp.pnum=temp.pnum.join(',');
    	 	  										    temp.hisDate=temp.hisDate.join(',');
    	 	  										    if(temp.pnum!=''){
    	 	  											submitLsdfjz(temp);
    	 	  											}else{
    	 	  											   $.messager.alert('系统提示','当前的数据均已存在，若要修改请选择确定覆盖！','info');
    	 	  											}
	    	 	  								 }
	    	 	  								   });
	    	 	  								
	    	 	  								}else{//直接提交
	    	 	  									submitLsdfjz(params);
	    	 	  								}
	    	 	  					    	
	    	 	  					    },'json');
								}
	    	 	  					}
								}
							
						}, {
							text : '关闭',
							iconCls : 'icon-cancel',
							handler : function() {
							$('#drlsdfjjInfo').dialog('close');
						}
						} ],
						iconCls : 'icon-save',
						onLoad : function() {
			   				$('#lsdfjzGrid').datagrid('loadData',data.rows);
						}
					});
    			});
    	      }
    		}],iconCls:'icon-save'
    	});
    }

    function sdnjfjz(){
    	$('#sdnjfjzInfo').dialog( {
			title : '设定年缴费基准',
			width : 300,
			height : 200,
			closed : false,
			cache : false,
			href : '../dfgl/sdnjfjzAdd.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
					var result=$('#fm').form('validate');
					if(result){
						$.messager.confirm('确定覆盖','确定覆盖该年份的缴费基准吗？',function(flag){
							if(flag){
							    $('#sdnjfjzInfo').dialog('close');
							    $.blockUI();
								$('#fm').form('submit',{
									url:'../dfgl/setYearPaidBase',
									success:function(result){
										result=$.parseJSON(result);
										$.unblockUI();
										$('#dfjjGrid').datagrid('reload');	
										$.messager.alert('系统提示',result.msg,'info');
									    
									}
								});
							}
						});
						
					}
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#sdnjfjzInfo').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			   
			}
		});
    }

    function dcmb(){
    	$('#dcmbInfo').dialog( {
			title : '模板导出',
			width : 300,
			height : 200,
			closed : false,
			cache : false,
			href : '../dfgl/mbdc.jsp',
			modal : true,
			buttons : [ {
				text : '导出',
				iconCls : 'icon-ok',
				handler : function() {
					var result=$('#fm').form('validate');
					if(result){
					    $('#dcmbInfo').dialog('close');
						$('#fm').form('submit',{
						url:'../dfgl/exportModel',
						success:function(result){
							//$('#dcmbInfo').dialog('close');
						}
					    });
					}
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#dcmbInfo').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			  
			}
		});
    }

    function uploadExcel(url,func){     
        //得到上传文件的全路径  
        var fileName= $('#importFile').filebox('getValue');  
        if(fileName !=""){   
                //进行基本校验  
                if(fileName==""){     
                   $.messager.alert('提示','请选择上传文件！','info');   
                }else{  
                    //对文件格式进行校验  
                    var d1=/\.[^\.]+$/.exec(fileName);   
                    if(d1==".xlsx"){  
                         $("#questionTypesManage").form("submit", {
     			        	async: false,
     			            url: url,
     			            method: 'post',             
     			            onSubmit: function () {
     			                return $(this).form("validate");
     			            },
     			            success: function (data) {
     				            data=$.parseJSON(data);
     				            if(data.result!=2){
     				            	$.messager.alert('系统提示',data.msg);
     				            	 $('#importFile').filebox('setValue',''); 
     					        }else{
     					        	$("#baseFormImport").dialog('close');
     					        	func(data);
     						    }
     			            }
     			        });       
                   }else{  
                       $.messager.alert('提示','请选择xlsx格式文件！','info');   
                       $('#importFile').filebox('setValue','');   
                   }  
                }    
         }else{    
        	 $.messager.alert('提示','请选择上传文件！','info'); 
         }  

     }  
    function generateHisPartyFeeParams(){
    	var rows=$("#lsdfjzGrid").datagrid('getRows');
    	var result={pnum:[],hisDate:[]};
    	for(var i=0;i<rows.length;i++){
    		var editor=$('#lsdfjzGrid').datagrid('getEditor',{index:i,field:'pnum'});
    		var pnum,hisDate;
    		if(editor!=null&&editor!=undefined){
    			pnum=$(editor.target).textbox('getValue');
    			hisDate=$($('#dfjzGrid').datagrid('getEditor',{index:i,field:'hisDate'}).target).numberbox('getValue');
    		
    		}else{
    			pnum=rows[i].pnum;
    			hisDate=rows[i].hisDate;
    			
    		}
    	    result.pnum.push(pnum);
    	    result.hisDate.push(hisDate);
    	}
    	result.pnum=result.pnum.join(',');
    	result.hisDate=result.hisDate.join(',');
    	return result;
    }
    function generateParams(){
    	var rows=$("#dfjzGrid").datagrid('getRows');
    	var result={pnum:[],pyear:[],baseM:[]};
    	for(var i=0;i<rows.length;i++){
    		var editor=$('#dfjzGrid').datagrid('getEditor',{index:i,field:'pnum'});
    		var pnum,pyear,baseM;
    		if(editor!=null&&editor!=undefined){
    				pnum=$(editor.target).textbox('getValue');
    				pyear=$($('#dfjzGrid').datagrid('getEditor',{index:i,field:'pyear'}).target).numberbox('getValue');
    				baseM=$($('#dfjzGrid').datagrid('getEditor',{index:i,field:'baseM'}).target).numberbox('getValue');
    		}else{
    				pnum=rows[i].pnum;
    				pyear=rows[i].pyear;
    				baseM=rows[i].baseM;
    		}
    		result.pnum.push(pnum);
    		result.pyear.push(pyear);
    		result.baseM.push(baseM);
    	}
    	result.pnum=result.pnum.join(",");
    	result.pyear=result.pyear.join(",");
    	result.baseM=result.baseM.join(",");
    	return result;
    }
    
    function judgeIsExistsErrmsg(id){
    	var rows=$("#"+id).datagrid('getRows');
    	var flag=false;
    	if(rows!=null&&rows!=undefined){
    		for(var i=0;i<rows.length;i++){
    			var editors=$('#'+id).datagrid('getEditor',{index:i,field:'errM'});
    			if(editors!=null&&editors!=undefined){
    				flag= $(editors.target).textbox('getValue')!='';
    				if(flag)return flag;
    			}
    			else{
    				flag=rows[i].errM!='';
    				if(flag)return flag;
    			}
    		}
    	}
    	return flag;
    }
    function show(){
    var row =$('#dfjjGrid').datagrid('getSelected');
    var pnum = row.pnum;
	if(row!=null&&row!=undefined){
    	$('#viewInfo').dialog({
    		title:'党费查看',
    		closed:false,
    		cache:false,
    		modal:true,
    		width:600,
    		height:550,
    		href:'../dfgl/dfView.jsp',	
    		buttons:[{
    			text:'关闭',
    			iconCls:'icon-cancel',
    			handler:function(){
    				$('#viewInfo').dialog('close');
    			}
    		}],
    		iconCls:'icon-save',
    		onLoad: function () {
		      $('#fm').form('load',row);
		      if(row.his_date!=null){
                //若历史党费缴至时间不为null
                //设置党费缴至时间为历史党费缴至时间
                $('#dfjz_time').textbox('setValue',row.his_date);
              }else if(row.party_date!=null){
                //若历史党费缴至时间为null且入党时间不为null，设置党费缴至时间为入党时间
                $('#dfjz_time').textbox('setValue',row.party_date);
              }
              //获取缴费基准列表
    	      jfjzList(pnum);
                //在缴费记录中仍需重新设置党费缴至时间
    	      jfjlList(pnum);
            }
    	});


    	}else{
		$.messager.alert('系统提示','请选择您要查看的党费缴交信息！');
	}
    }
    
    	function jfjzList(pnum){
		$('#jfjzGrid').datagrid( {
			url : '../dfgl/SelectPartyBase?pnum='+pnum,
			border : true,
			striped : true,
			collapsible : true,
			fitColumns : true,
			width : '250px',
			sortName : '',
			sortOrder : 'desc',
			remoteSort : false,
				columns:[[    
	            {field:'pyear',title:'年份',width:100},    
	            {field:'base_m',title:'缴费基准',width:150} 
	        ]],
	        onLoadSuccess:function(data){
	        	if(data.data!=undefined&&data.data.length>0){
	        	 $('#fm').form('load',data.data[0]);
	        	}
            }
		});
    }

	function jfjlList(pnum){
		$('#jfjlGrid').datagrid( {
			url : '../dfgl/SelectPartyMoney?pnum='+pnum,
			border : true,
			striped : true,
			collapsible : true,
			fitColumns : true,
			sortName : '',
			sortOrder : 'desc',
			remoteSort : false,
			columns:[[    
	            {field:'order_id',title:'订单号',width:100},    
	            {field:'p_date',title:'付款时间',width:150},    
	            {field:'order_no',title:'付款交易号',width:150},    
	            {field:'m',title:'金额',formatter:function(value,row,index){return value.toFixed(2);},width:100},    
	            {field:'state',title:'付款状态',width:100}
	        ]],
            onLoadSuccess:function(data){
                var length=data.rows.length;
                if(length>0){
                    //设置党费缴至时间为最大的缴费记录时间
                     $.each(data.rows,function(index,value){
                         if(value.state=='已付款'||value.state=='TRADE_SUCCESS'||value.state=='TRADE_FINISHED'){
                            $('#dfjz_time').textbox('setValue',value.p_date);
                            return true;
                         }
                     });
                    
                }
            }
		});

    }
	function query(type){
		
		var array=$('#searchForm').serializeArray();
		var params={};
		$.each(array,function(index,value){
			params[value.name]=value.value;
		});
		$('#dfjjGrid').datagrid('load',params);
	}
</script>


<body style="margin: 1px;">
    <div>
        <form id="searchForm">
        <table>
        	<tr>
        	   <td>党员编号：</td>
        	   <td><input name="pno" class="easyui-textbox" /></td>
        	   <td>身份证号：</td>
        	   <td><input name="pnum" class="easyui-textbox" /></td>
        	   <td>姓名：</td>
        	   <td><input name="name" class="easyui-textbox" /></td>
        	   <td>入党时间：</td>
        	   <td><input name="party_dateB" class="easyui-datebox" /></td>
        	   <td>至：</td>     
        	   <td><input name="party_dateE" class="easyui-datebox" /></td>
        	</tr>
        	<tr>
        	 <td>历史党费缴至：</td>
        	   <td><input name="his_dateB" class="easyui-datebox" /></td>
        	   <td> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;至：</td> 
        	   <td><input name="his_dateE" class="easyui-datebox" /></td>
        	   <td><a onclick="query()" class="easyui-linkbutton"
				data-options="iconCls:'icon-search',plain:true">查询</a></td>
        	</tr>
        </table>
        </form>
    </div>
	<div data-options="region:'center',border:false" style="">
		<div id="dfjjTool" style="background-color:#FFFFFF;">
			  
				<a onclick="show()" class="easyui-linkbutton"
				data-options="iconCls:'icon-search',plain:true">查看</a>  <a
				onclick="drjfjz()" class="easyui-linkbutton"
				data-options="iconCls:'icon-print',plain:true">导入缴费基准</a>
				<!--  <a
				onclick="drlsdfjj()" class="easyui-linkbutton"
				data-options="iconCls:'icon-print',plain:true">导入历史党费缴至</a> --> <a
				onclick="sdnjfjz()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true">设定年缴费基准</a> <a
				onclick="dcmb()" class="easyui-linkbutton"
				data-options="iconCls:'icon-print',plain:true">导出模板</a>
		</div>
		<div>
			<table id="dfjjGrid"></table>
		</div>
	</div>
	<div id="viewInfo" align="center"></div>
	<div id="drjfjzInfo"></div>
	<div id="drlsdfjjInfo"></div>
	<div id="sdnjfjzInfo"></div>
	<div id="dcmbInfo"></div>
	<div id="baseFormImport"></div>
</body>
</html>
