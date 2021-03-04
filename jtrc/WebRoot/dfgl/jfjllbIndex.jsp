<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>
<html>
  <head>

  </head>
  <script type="text/javascript">
        $(function(){
        	$('#jfjlGrid').datagrid({
        		url:'../dfgl/queryPartyMoneyInfos',
        		title:'',
        		rownumbers:false,
        		pageList:[10,20,30,40],
        		fitColumns:true,
        		pagination:true,
        		height:'90%',
        		width:'100%',
        		pageSize:10,
        		toolbar:'#zcpshdTool',
        		sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
        		columns:[[
        		    {field:'id',title:'选择',checkbox:true,align:'center'},
                    {field:'p_date',title:'付款时间',formatter:function(value,row,index){return DateFormat(new Date(value),"yyyy-MM-dd HH:mm:ss");},width : $(this).width() * 0.1,align:'center'},
                    {field:'msg_from_id',title:'数据来源',width : $(this).width() * 0.1,align:'center'},
                    {field:'pnum',title:'身份证号',width : $(this).width() * 0.1,align:'center'},
                    {field:'name',title:'姓名',width : $(this).width() * 0.1,align:'center'},
                    {field:'sex',title:'性别',width : $(this).width() * 0.1,align:'center',
        	formatter: function(value,row,index){
            if (value == "") {
          	   return value;
			}
            else if (value == '1') {
          	    return "男";
			}else if (value == '0') {
          	    return "女";
		    }else{
				return value;
		    }}},
                    {field:'m',title:'金额',width : $(this).width() * 0.1,align:'center'},
                    {field:'order_no',title:'付款交易号',width:$(this).width()*0.1,align:'center'},
                    {field:'state',title:'付款状态',width:$(this).width()*0.1,align:'center'},
				    {
				     title:'操作',field:'operator',width:$(this).width() * 0.1,align:'center',
	    		    formatter: function(value,row,index){
			          return    "<a href=\"javascript:show("+index+")\" style=\"color:blue;\">查看</a>&nbsp;&nbsp;"
                      			+"<a href=\"javascript:modify("+index+")\" style=\"color:blue;\">修改</a>&nbsp;&nbsp;"
                      			+"<a href=\"javascript:deletePay("+row.id+")\" style=\"color:blue;\">删除</a>";
			        }   
			       }
        		  ]]
        		
        	});
        });
        //查看缴费记录
  		function show(index){
        	
  			var row='';
  			if(index!=''){
  				row=$('#jfjlGrid').datagrid('getRows')[index];
  			}else{
  			    row=$("#jfjlGrid").datagrid('getSelected');
  			}
  			if(row==''||row==null){
  				$.messager.alert('系统提示','请选择您要查看的缴费记录！','info');
  			}else{
  				$("#jfjlAddDialog").dialog({
  	  				title:'缴费记录查看',
  	  				href:'../dfgl/jfjlShow.jsp',
  	  				closed:false,
  	  				cache:false,
  	  				modal:true,
  	  				width:450,
  	  				height:300,
  	  				buttons:[
  	  				   {
  	  					text:'关闭',
  	  					iconCls:'icon-cancel',
  	  					handler:function(){
  	  						$('#jfjlAddDialog').dialog('close');
  	  					}
  	  				}],
  	  				iconCls:'icon-save',
  					onLoad:function(){
  						$('#showName').textbox('setValue',row.name);
  						$('#showPnum').textbox('setValue',row.pnum);
  						$('#showPayTime').datetimebox('setValue',DateFormat(new Date(row.p_date),"yyyy-MM-dd HH:mm:sss"));
  						$('#showPayCode').textbox('setValue',row.order_no);
  						$('#showMoney').numberbox('setValue',row.m);
  					}
  	  			});
  			}
  			
  		}
        
        //新增缴费记录
  		function addPay(){
  			$("#jfjlAddDialog").dialog({
  				title:'缴费记录新增',
  				href:'../dfgl/jfjlAdd.jsp',
  				closed:false,
  				cache:false,
  				modal:true,
  				width:450,
  				height:300,
  				buttons:[{
  				   text:'保存',
  				   iconCls:'icon-save',
  				   handler:function(){
					   var result=$("#fm").form('validate');
						if(result){
					//	if($('#money').numberbox())
						//检查用户是否符合缴纳党费的条件   需缴金额不为空 且已缴总额不大于需缴金额  应缴总额不为空 从历史党费缴至到当前年的基准都存在
						if($('#money').numberbox('getValue')<=0){
						   $.messager.alert('系统提示','金额应当大于0元','info');
						} 
						else{ 
						$.post('../dfgl/checkIsEnablePay',{pnum:$('#pnum').textbox('getValue')},function(data){
						      if(data.flag){
						          $.messager.confirm('确定新增缴费记录','确定新增该缴费记录吗？',function(flag){
  						   			if(flag){
  								    $("#fm").form('submit',{
  								    	url:'../dfgl/savePartyMoneyInfo',
  								    	queryParams:{
  								    	    type:0,   //表示通过后台缴费
  								    	    name:$('#name').textbox('getValue'),
											payTime:$('#payTime').datetimebox('getValue'),
											money:$('#money').numberbox('getValue')
  								    	},
  								    	success:function(data){
  								    		data=$.parseJSON(data);
  								    		if(data.flag){
  								    			$.messager.alert('系统提示',data.cause,'info');
  								    			$("#jfjlGrid").datagrid('reload');
  								    			$("#jfjlAddDialog").dialog('close');
  								    		}else{
  								    			$.messager.alert('系统提示',data.cause,'info');
  								    		}
  								    	}
  								    });
  						   			}
  					   				});
						      }else{
						    	  
						         $.messager.alert('系统提示',data.cause,'info');
						      }
						
						},'json');
						}
  					}
  					}
  				},{
  					text:'关闭',
  					iconCls:'icon-cancel',
  					handler:function(){
  						$('#jfjlAddDialog').dialog('close');
  					}
  				}],
  				iconCls:'icon-save',
				onLoad:function(){
					$("#payTime").datetimebox('setValue',DateFormat(new Date(),"yyyy-MM-dd HH:mm:ss"));
				}
  			});
  		}
        //修改缴费记录
  		function modify(index){
        	
  			var row='';
  			if(index!=''){
  				row=$('#jfjlGrid').datagrid('getRows')[index];
  			}else{
  			    row=$("#jfjlGrid").datagrid('getSelected');
  			}
  			if(row==''||row==null){
  				$.messager.alert('系统提示','请选择您要修改的缴费记录！','info');
  			}else{
  				$("#jfjlAddDialog").dialog({
  					title:'缴费记录修改',
  	  				href:'../dfgl/jfjlAdd.jsp',
  	  				closed:false,
  	  				cache:false,
  	  				modal:true,
  	  				width:450,
  	  				height:300,
  	  				buttons:[{
  	  				   text:'保存',
  	  				   iconCls:'icon-save',
  	  				   handler:function(){
						var result=$("#fm").form('validate');
						if(result){
						//检查用户是否符合缴纳党费的条件   需缴金额不为空 且已缴总额不大于需缴金额  应缴总额不为空 从历史党费缴至到当前年的基准都存在
						if($('#money').numberbox('getValue')<=0){
						   $.messager.alert('系统提示','金额应当大于0元','info');
						} 
						else{
						$.post('../dfgl/checkIsEnablePay',{pnum:$('#pnum').textbox('getValue')},function(data){
						  	if(data.flag){
  	  					  		$.messager.confirm('确定修改缴费记录','确定修改该缴费记录吗？',function(flag){
    						     if(flag){
    								    $("#fm").form('submit',{
    								    	url:'../dfgl/updatePartyMoneyInfo',
    								    	queryParams:{
    								    		id:id,
    								    		name:$('#name').textbox('getValue'),
    										    payTime:$('#payTime').datetimebox('getValue'),
    										    money:$('#money').numberbox('getValue')
    								    	},
    								    	success:function(data){
    								    		data=$.parseJSON(data);
    								    		if(data.flag){
    								    			$.messager.alert('系统提示','修改缴费记录成功！','info');
    								    			$("#jfjlGrid").datagrid('reload');
    								    			$("#jfjlAddDialog").dialog('close');
    								    		}
    								    	}
    								    });
    						     }
  	  					  		});
    						}else{
    							$.messager.alert('系统提示',data.cause,'info');
    						}
    					},'json');
				        }
						}
  	  				   }
  	  				},{
  	  					text:'关闭',
  	  					iconCls:'icon-cancel',
  	  					handler:function(){
  	  						$('#jfjlAddDialog').dialog('close');
  	  					}
  	  				}],
  	  				iconCls:'icon-save',
					onLoad:function(){
						$('#name').textbox('setValue',row.name);
						$('#pnum').textbox({editable:false});
  						$('#pnum').textbox('setValue',row.pnum);
  						$('#payTime').datetimebox('setValue',DateFormat(new Date(row.p_date),"yyyy-MM-dd HH:mm:sss"));
  						$('#payCode').textbox('setValue',row.order_no);
  						$('#money').numberbox('setValue',row.m);
					}
  				});
  			}
  			
  			
  		}
        //删除缴费记录
  		function deletePay(id){
        	var ids="";
        	if(id!=''){
        		ids="&id="+id;
        	}else{
        		ids=getSelectRowIds();
        	}
        	if(ids!=""){
        		$.messager.confirm('确定删除缴费记录','确定删除选择的缴费记录信息？',function(flag){
        			if(flag){
        				$.post('../dfgl/deletePartyMoneyInfos',ids,function(result){
        				
        					if(result.flag){
        						$.messager.alert('系统提示','删除缴费记录成功','info');
        						$('#jfjlGrid').datagrid('reload');
        					}else{
        					    $.messager.alert('系统提示','删除缴费记录失败','error');
        					}
        				},'json');
        			}
        		});
        	}else{
        		$.messager.alert('系统提示','请选择您要删除的缴费记录！','info');
        	}
  			
  		}
        function getSelectRowIds(){
            var rows=$("#jfjlGrid").datagrid('getSelections');
            var ids="";
            if(rows!=null&&rows!=undefined){
            	for(var i=0;i<rows.length;i++){
            		ids+="&id="+rows[i].id;
            	}
            }
            return ids;
        }
        //查询缴费记录
        function selectSubmit(){
        	$('#jfjlGrid').datagrid('load',{
        		pnum:$('#searchPnum').textbox('getValue'),
        		pDate:$('#searchPayTime').datetimebox('getValue'),
        		pDate1:$('#searchPayTime1').datetimebox('getValue'),
        		name:$('#searchName').textbox('getValue'),
        		orderNo:$('#searchPayCode').textbox('getValue'),
        		state:$('#searchPayState').combobox('getValue'),
        		msgFromId:$('#searchMsgFromId').combobox('getValue')
        	});
        }
        //重置查询
        function resetSubmit(){
        		$('#searchPnum').textbox('setValue','');
        		$('#searchPayTime').datetimebox('setValue','');
        		$('#searchName').textbox('setValue','');
        		$('#searchPayCode').textbox('setValue','');
        		$('#searchPayState').combobox('setValue','2');
        		$('#searchMsgFromId').combobox('setValue','2');
        	    selectSubmit();
        }
  </script>
 <body style="margin:1px">
      <div id="zcpshdTool" style="background-color:#FFFFFF">
	      <a onclick="show('')" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查看</a>
	      <a onclick="addPay()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增缴费记录</a>
		  <a onclick="modify('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
		  <a onclick="deletePay('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" >删除</a>
	  </div>
	  <div class="easyui-layout" data-options="fit:true,border:false">
	       <div data-options="region:'north',border:false" style="padding:5px;">
		        <table>
				    <tr>
						<td><label>身份证号：</label></td>
						<td><input class="easyui-textbox" id="searchPnum" name="searchPnum" /></td>
						<td><label style="margin-left:10px">姓名：</label></td>
						<td><input class="easyui-textbox" id="searchName" name="searchName"/></td>
						<td><label style="margin-left:10px">付款交易号：</label></td>
						<td><input class="easyui-textbox" id="searchPayCode" name="searchPayCode"/></td>
						<td><label>付款时间：</label></td>
						<td><input class="easyui-datetimebox" id="searchPayTime" name="searchPayTime" data-options="editable:false" />
						到<input class="easyui-datetimebox" id="searchPayTime1" name="searchPayTime1" data-options="editable:false" />
						
						</td>
						
					</tr>
					<tr>
					    <td><label style="margin-left:10px">数据来源：</label></td>
						<td>
						<select class="easyui-combobox" id="searchMsgFromId" name="searchMsgFromId" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:120px">
						    <option value="所有">所有</option>
						    <option value="手动录入">手动录入</option>
						    <option value="支付宝">支付宝</option>
						</select>
						</td>
						<td><label style="margin-left:10px">付款状态：</label></td>
						<td>
						<select class="easyui-combobox" id="searchPayState" name="searchPayState" data-options="editable:false,panelHeight:null,onSelect:function(record){
						  selectSubmit();
						}" style="width:120px">
						    <option value="所有">所有</option>
						    <option value="未付款">未付款</option>
						    <option value="已付款">已付款</option>
						</select>
						</td>
						<td>
						     <a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin-left:10px">查询</a>
							 <a onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin-left:10px">重置</a>
						</td>
					</tr>
				</table>
		   </div>
		   <div data-options="region:'center',title:'缴费记录列表',border:false">
		   		<table id="jfjlGrid"></table>
		   </div>
	  </div>
	 <div id="jfjlAddDialog"></div>
  </body>
</html>
