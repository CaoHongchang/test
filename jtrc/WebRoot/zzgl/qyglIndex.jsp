
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){


            var pager = $('#tpglGrid').datagrid('getPager');
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

        });


        function addOrg(){
            $('#addOrg').dialog({
                title: '主企业新增',
                width: 900,
                height: 350,
                closed: false,
                cache: false,
                href: '../zzgl/qyAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
							var enterpriseCode=$("#enterpriseCode").textbox("getValue");
							if(enterpriseCode!=""&&!enterpriseCode_Validation(enterpriseCode)){
								$.messager.alert("系统提示","企业代码只允许输入三位数字！");
								return false;
							}
							
							var manageType=$("#manageType").textbox("getValue");
							if(manageType==""){
								$.messager.alert("系统提示","管理类型不能为空");
								return false;
							}
							if(manageType.length>50){
								$.messager.alert("系统提示","管理类型长度不超过50位！");
								return false;
							}
							
							var orgCode=$("#orgCode").textbox("getValue");
							if(orgCode==""){
								$.messager.alert("系统提示","组织机构代码不能为空");
								return false;
							}
							if(!cCode_Validation(orgCode)){
								$.messager.alert("系统提示","组织机构代码只允许数字字母，长度在5-25之间 ！");
								return false;
							}
							
							var orgName=$("#orgName").textbox("getValue");
							if(orgName==""){
								$.messager.alert("系统提示","单位名称不能为空");
								return false;
							}
							if(orgName.length>50){
								$.messager.alert("系统提示","单位名称长度不超过50位！");
								return false;
							}
							
							var legalPerson=$("#legalPerson").textbox("getValue");
							if(legalPerson==""){
								$.messager.alert("系统提示","法人代表不能为空");
								return false;
							}
							if(!Name_Validation(legalPerson)){
								$.messager.alert("系统提示","法人代表只能由中文数字字母和.组成");
								return false;
							}
							
							var orgArea=$("#orgArea").textbox("getValue");
							if(orgArea==""){
								$.messager.alert("系统提示","单位所在行政区域不能为空");
								return false;
							}
							if(orgArea.length>50){
								$.messager.alert("系统提示","单位所在行政区域长度不超过50位！");
								return false;
							}
							
							var orgType=$("#orgType").combobox("getValue");
							if(orgType==""){
								$.messager.alert("系统提示","填报单位类型不能为空");
								return false;
							}
							
							
							var orgLevel=$("#orgLevel").numberbox("getValue");
							if(orgLevel==""){
								$.messager.alert("系统提示","层次不能为空");
								return false;
							}
							if(!Num_Validation(orgLevel)){
								$.messager.alert("系统提示","层次只能为数值！");
								return false;
							}
							
							
							var type=$("#type").textbox("getValue");
							if(type==""){
								$.messager.alert("系统提示","机构类型不能为空");
								return false;
							}
							if(type.length>50){
								$.messager.alert("系统提示","机构类型长度不超过50位！");
								return false;
							}
							
							
							var businessArea=$("#businessArea").textbox("getValue");
							if(businessArea.length>50){
								$.messager.alert("系统提示","单位主管业务区域长度不超过50位！");
								return false;
							}
							
							var parentOrgType=$("#parentOrgType").textbox("getValue");
							if(parentOrgType.length>50){
								$.messager.alert("系统提示","上级单位类型长度不超过50位！");
								return false;
							}
							
							var parentOrgCode=$("#parentOrgCode").textbox("getValue");
							if(parentOrgCode!=""&&!cCode_Validation(parentOrgCode)){
								$.messager.alert("系统提示","上级单位代码只允许数字字母，长度在5-25之间 ！");
								return false;
							}
							var parentOrgName=$("#parentOrgName").textbox("getValue");
							if(parentOrgName.length>50){
								$.messager.alert("系统提示","上级单位名称长度不超过50位！");
								return false;
							}
							
							var parentOrgLeader=$("#parentOrgLeader").textbox("getValue");
							if(parentOrgLeader!=""&&!Name_Validation(parentOrgLeader)){
								$.messager.alert("系统提示","上级单位负责人只能由中文数字字母和.组成");
								return false;
							}
							
							var parentOrgPhone=$("#parentOrgPhone").textbox("getValue");
							if(parentOrgPhone!=""&&!Tel_Validation(parentOrgPhone)&&!HomeTel_Validation(parentOrgPhone)){
								$.messager.alert("系统提示","请输入正确的上级单位电话,如果为固定电话请按照0597-xxxxxxx的格式输入");
								return false;
							}
                        var result = $("#fm").form("validate");
                        if(result){
							$.messager.confirm('确定添加主企业','您确定要添加主企业吗？',function(flag){
							if(flag){
								 $("#fm").form("submit",{
								     url:'../zzgl/insertEnterpriseInfo',
									 type:'post',
									 queryParams:{
										 //情况1添加主企业
										situation:1 
									 },
									 success:function(result){
										
										 if(result==1){
											 $('#addOrg').dialog('close');
											 $.messager.alert('系统提示','添加主企业成功！');
											 $('#tpglGrid').datagrid('reload');
										 }else{
											 $.messager.alert('系统提示','添加主企业失败！'+result);
										 }
									 }
							     });
							}
							});	
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addOrg').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					$('#fm').form('clear');
					$('#orgNature').combobox('setValue','0');
					$('#isSignOrg').combobox('setValue','1');
				}

            });
        }
        function addChildOrg(){
			var row=$('#tpglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
		    if(row.orgType1=='1'){
            $('#addOrg').dialog({
                title: '子企业新增',
                width: 900,
                height: 350,
                closed: false,
                cache: false,
                href: '../zzgl/qyAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){

                    	var enterpriseCode=$("#enterpriseCode").textbox("getValue");
						if(enterpriseCode!=""&&!enterpriseCode_Validation(enterpriseCode)){
							$.messager.alert("系统提示","企业代码只允许输入三位数字！");
							return false;
						}
						
						var manageType=$("#manageType").textbox("getValue");
						if(manageType==""){
							$.messager.alert("系统提示","管理类型不能为空");
							return false;
						}
						if(manageType.length>50){
							$.messager.alert("系统提示","管理类型长度不超过50位！");
							return false;
						}
						
						var orgCode=$("#orgCode").textbox("getValue");
						if(orgCode==""){
							$.messager.alert("系统提示","组织机构代码不能为空");
							return false;
						}
						if(!cCode_Validation(orgCode)){
							$.messager.alert("系统提示","组织机构代码只允许数字字母，长度在5-25之间 ！");
							return false;
						}
						
						var orgName=$("#orgName").textbox("getValue");
						if(orgName==""){
							$.messager.alert("系统提示","单位名称不能为空");
							return false;
						}
						if(orgName.length>50){
							$.messager.alert("系统提示","单位名称长度不超过50位！");
							return false;
						}
						
						var legalPerson=$("#legalPerson").textbox("getValue");
						if(legalPerson==""){
							$.messager.alert("系统提示","法人代表不能为空");
							return false;
						}
						if(!Name_Validation(legalPerson)){
							$.messager.alert("系统提示","法人代表只能由中文数字字母和.组成");
							return false;
						}
						
						var orgArea=$("#orgArea").textbox("getValue");
						if(orgArea==""){
							$.messager.alert("系统提示","单位所在行政区域不能为空");
							return false;
						}
						if(orgArea.length>50){
							$.messager.alert("系统提示","单位所在行政区域长度不超过50位！");
							return false;
						}
						
						var orgType=$("#orgType").combobox("getValue");
						if(orgType==""){
							$.messager.alert("系统提示","填报单位类型不能为空");
							return false;
						}
						
						
						var orgLevel=$("#orgLevel").numberbox("getValue");
						if(orgLevel==""){
							$.messager.alert("系统提示","层次不能为空");
							return false;
						}
						if(!Num_Validation(orgLevel)){
							$.messager.alert("系统提示","层次只能为数值！");
							return false;
						}
						
						
						var type=$("#type").textbox("getValue");
						if(type==""){
							$.messager.alert("系统提示","机构类型不能为空");
							return false;
						}
						if(type.length>50){
							$.messager.alert("系统提示","机构类型长度不超过50位！");
							return false;
						}
						
						
						var businessArea=$("#businessArea").textbox("getValue");
						if(businessArea.length>50){
							$.messager.alert("系统提示","单位主管业务区域长度不超过50位！");
							return false;
						}
						
						var parentOrgType=$("#parentOrgType").textbox("getValue");
						if(parentOrgType.length>50){
							$.messager.alert("系统提示","上级单位类型长度不超过50位！");
							return false;
						}
						
						var parentOrgCode=$("#parentOrgCode").textbox("getValue");
						if(parentOrgCode!=""&&!cCode_Validation(parentOrgCode)){
							$.messager.alert("系统提示","上级单位代码只允许数字字母，长度在5-25之间 ！");
							return false;
						}
						var parentOrgName=$("#parentOrgName").textbox("getValue");
						if(parentOrgName.length>50){
							$.messager.alert("系统提示","上级单位名称长度不超过50位！");
							return false;
						}
						
						var parentOrgLeader=$("#parentOrgLeader").textbox("getValue");
						if(parentOrgLeader!=""&&!Name_Validation(parentOrgLeader)){
							$.messager.alert("系统提示","上级单位负责人只能由中文数字字母和.组成");
							return false;
						}
						
						var parentOrgPhone=$("#parentOrgPhone").textbox("getValue");
						if(parentOrgPhone!=""&&!Tel_Validation(parentOrgPhone)&&!HomeTel_Validation(parentOrgPhone)){
							$.messager.alert("系统提示","请输入正确的上级单位电话,如果为固定电话请按照0597-xxxxxxx的格式输入");
							return false;
						}
                    	
                        var result = $("#fm").form("validate");
                        if(result){
							$.messager.confirm('确定添加子企业','您确定要添加子企业吗？',function(flag){
								if(flag){
									$("#fm").form("submit",{
								     url:'../zzgl/insertEnterpriseInfo',
									 type:'post',
									 queryParams:{
										 //情况2添加子企业
										situation:2,
										parentId:row.id1
									 },
									 success:function(result){
										 if(result==1){
											 $('#addOrg').dialog('close');
											 $.messager.alert('系统提示','添加子企业成功！');
											 $('#tpglGrid').datagrid('reload');
										 }else{
											 $.messager.alert('系统提示',result);
										 }
									 }
							    });
								}
							});
                            
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addOrg').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					$('#fm').form('clear');
					$('#mainOrgLabelTd').css('display','');
			        $('#mainOrgInputTd').css('display','');
			        
			        
					$('#orgNature').combobox('setValue','0');
					$('#isSignOrg').combobox('setValue','1');
					$('#mainOrgName').textbox('setValue',row.mainOrgName);
				}

            });
			}else{
				$.messager.alert('系统提示','请在主企业下添加子企业！');
			}
			}else{
				$.messager.alert('系统提示','请选择要添加子企业的主企业！');
			}
        }
		function updateOrg(){
			var row=$('#tpglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
            $('#addOrg').dialog({
                title: '企业修改',
                width: 900,
                height: 350,
                closed: false,
                cache: false,
                href: '../zzgl/qyAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                    	var enterpriseCode=$("#enterpriseCode").textbox("getValue");
						if(enterpriseCode!=""&&!enterpriseCode_Validation(enterpriseCode)){
							$.messager.alert("系统提示","企业代码只允许输入三位数字！");
							return false;
						}
						
						var manageType=$("#manageType").textbox("getValue");
						if(manageType==""){
							$.messager.alert("系统提示","管理类型不能为空");
							return false;
						}
						if(manageType.length>50){
							$.messager.alert("系统提示","管理类型长度不超过50位！");
							return false;
						}
						
						var orgCode=$("#orgCode").textbox("getValue");
						if(orgCode==""){
							$.messager.alert("系统提示","组织机构代码不能为空");
							return false;
						}
						if(!cCode_Validation(orgCode)){
							$.messager.alert("系统提示","组织机构代码只允许数字字母，长度在5-25之间 ！");
							return false;
						}
						
						var orgName=$("#orgName").textbox("getValue");
						if(orgName==""){
							$.messager.alert("系统提示","单位名称不能为空");
							return false;
						}
						if(orgName.length>50){
							$.messager.alert("系统提示","单位名称长度不超过50位！");
							return false;
						}
						
						var legalPerson=$("#legalPerson").textbox("getValue");
						if(legalPerson==""){
							$.messager.alert("系统提示","法人代表不能为空");
							return false;
						}
						if(!Name_Validation(legalPerson)){
							$.messager.alert("系统提示","法人代表只能由中文数字字母和.组成");
							return false;
						}
						
						var orgArea=$("#orgArea").textbox("getValue");
						if(orgArea==""){
							$.messager.alert("系统提示","单位所在行政区域不能为空");
							return false;
						}
						if(orgArea.length>50){
							$.messager.alert("系统提示","单位所在行政区域长度不超过50位！");
							return false;
						}
						
						var orgType=$("#orgType").combobox("getValue");
						if(orgType==""){
							$.messager.alert("系统提示","填报单位类型不能为空");
							return false;
						}
						
						
						var orgLevel=$("#orgLevel").numberbox("getValue");
						if(orgLevel==""){
							$.messager.alert("系统提示","层次不能为空");
							return false;
						}
						if(!Num_Validation(orgLevel)){
							$.messager.alert("系统提示","层次只能为数值！");
							return false;
						}
						
						
						var type=$("#type").textbox("getValue");
						if(type==""){
							$.messager.alert("系统提示","机构类型不能为空");
							return false;
						}
						if(type.length>50){
							$.messager.alert("系统提示","机构类型长度不超过50位！");
							return false;
						}
						
						
						var businessArea=$("#businessArea").textbox("getValue");
						if(businessArea.length>50){
							$.messager.alert("系统提示","单位主管业务区域长度不超过50位！");
							return false;
						}
						
						var parentOrgType=$("#parentOrgType").textbox("getValue");
						if(parentOrgType.length>50){
							$.messager.alert("系统提示","上级单位类型长度不超过50位！");
							return false;
						}
						
						var parentOrgCode=$("#parentOrgCode").textbox("getValue");
						if(parentOrgCode!=""&&!cCode_Validation(parentOrgCode)){
							$.messager.alert("系统提示","上级单位代码只允许数字字母，长度在5-25之间 ！");
							return false;
						}
						var parentOrgName=$("#parentOrgName").textbox("getValue");
						if(parentOrgName.length>50){
							$.messager.alert("系统提示","上级单位名称长度不超过50位！");
							return false;
						}
						
						var parentOrgLeader=$("#parentOrgLeader").textbox("getValue");
						if(parentOrgLeader!=""&&!Name_Validation(parentOrgLeader)){
							$.messager.alert("系统提示","上级单位负责人只能由中文数字字母和.组成");
							return false;
						}
						
						var parentOrgPhone=$("#parentOrgPhone").textbox("getValue");
						if(parentOrgPhone!=""&&!Tel_Validation(parentOrgPhone)&&!HomeTel_Validation(parentOrgPhone)){
							$.messager.alert("系统提示","请输入正确的上级单位电话,如果为固定电话请按照0597-xxxxxxx的格式输入");
							return false;
						}
                        var result = $("#fm").form("validate");
                        if(result){
							$.messager.confirm('确定修改企业','您确定要修改此企业吗？',function(flag){
								if(flag){
									$("#fm").form("submit",{
										url:'../zzgl/updateEnterpriseInfo',
										type:'post',
										queryParams:{
											id:row.id1
										},
										success:function(result){
											if(result==1){
												 $('#addOrg').dialog('close');
											     $.messager.alert('系统提示','修改企业成功！');
											     $('#tpglGrid').datagrid('reload');
												// $('#tpflGrid').tree('reload');
											}else{
												$.messager.alert('系统提示',result);
											}
										}
									});
								}
							});
                            
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addOrg').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){debugger 
				    if(row.mainOrg){
				         row.mainOrgName=row.mainOrg;
				       	 $('#mainOrgLabelTd').css('display','block');
			             $('#mainOrgInputTd').css('display','block');
				    }
				    //console.log(row);
					$('#fm').form('load',row);
					
				}

            });
			}else{
				$.messager.alert('系统提示','请选择要修改的企业！');
			}
        }
        function formatOper(value,row,index)
        {
            return "<div>" +
                    "<a href='javascript:chakanOrg()' rowid='"+row.id+"' style='color:blue'>查看</a>&nbsp;&nbsp;" +
                    "<a href='javascript:updateOrg()' rowid='"+row.id+"' style='color:blue' >修改</a>&nbsp;&nbsp;" +
                    "<a href='javascript:checkOrg()' rowid='"+row.id+"' style='color:blue'>审核</a>&nbsp;&nbsp;" +
                    "<a href='javascript:addChildOrg()' rowid='"+row.id+"' style='color:blue'>添加子企业</a>" +
                    "</div>";
        }
        
        function formatAuthorize(value,row,index){
        	if(value=='0'){
        		return "<a href='javascript:collectAuthorize()' rowid='"+row.id+"' style='color:blue'>采集授权</a>&nbsp;&nbsp;";
        	}else if(value=='1'){
        		return "<a href='javascript:collectAuthorize()' rowid='"+row.id+"' style='color:blue'>取消授权</a>&nbsp;&nbsp;";;
        	} 
        }
        
        function collectAuthorize(){
        	 var row=$('#tpglGrid').datagrid('getSelected');
 			if(row!=null&&row!=undefined){
 				if(row.isAuthorize =='0'){
 					$.messager.confirm('确定授权','您确定要授权该部门吗？',function(flag){
 						if(flag){
 							$.ajax({
								url:'../zzgl/authorizeEnterpriseInfo',
								type:'post',
								data:{
									id:row.id1,
									authorize:'1'
								},
								success:function(result){
									if(result==1){
										$.messager.alert('系统提示','授权企业成功！');
										$('#tpglGrid').datagrid('reload');
								
									}else{
										$.messager.alert('系统提示',result);
									}
								}
							});
 						}
 					});    
 				}else{
 					$.messager.confirm('取消授权','您确定要取消授权该部门吗？',function(flag){
 						if(flag){
 							$.ajax({
								url:'../zzgl/authorizeEnterpriseInfo',
								type:'post',
								data:{
									id:row.id1,
									authorize:'0'
								},
								success:function(result){
									if(result==1){
										$.messager.alert('系统提示','取消授权企业成功！');
										$('#tpglGrid').datagrid('reload');
									}else{
										$.messager.alert('系统提示',result);
									}
								}
							});
 						}
 					});    
 				}
 				
 			}else{
			     $.messager.alert('系统提示','请选择您要授权的企业！');
			}
        }

        function checkOrg(){
		      var row=$('#tpglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
				if(row.status!='1'){
            $('#addOrg').dialog({
                title: '企业审核',
                width: 900,
                height: 500,
                closed: false,
                cache: false,
                href: '../zzgl/qyCheck.jsp',
                modal: true,
                buttons:[{
                    text:'审核',
                    iconCls:'icon-ok',
                    handler:function(){
							var content=$("#content").textbox("getValue");
							if(content.length>150){
								$.messager.alert("系统提示","审核意见长度不超过150位！");
								return false;
							}
							
                        var result = $("#fm").form("validate");
                        if(result){
							$.messager.confirm('确定审核','您确定要审核该企业吗？',function(flag){
								if(flag){
									$("#fm").form("submit",{
										url:'../zzgl/checkEnterpriseInfo',
										type:'post',
										queryParams:{
											id:row.id1,
											checkUserId:$('#checkUserId').val()
										},success:function(result){
										if(result==1){
										$('#addOrg').dialog('close');
										$.messager.alert('系统提示','审核企业成功！');
										$('#tpglGrid').datagrid('reload');
									     }else{
										$.messager.alert('系统提示',result);
									    }
										}
									});
								}
							});    
                        }
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					$('#fm').form('load',row);
					$('#status').combobox('setValue','1');
		  			$('#checkUser').textbox('setValue','<%=(String)request.getSession().getAttribute("userName")%>');
		  			$('#checkUserId').val('<%=(String)request.getSession().getAttribute("uid")%>');
				}

            });
				}else{
					$.messager.alert('系统提示','该企业已审核！');
				}
			}else{
			     $.messager.alert('系统提示','请选择您要审核的企业！');
			}
        }
        function deleteOrg(){
			var row=$('#tpglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
					$.messager.confirm('确定删除企业','您确定要删除此企业？',function(flag){
						if(flag){
							$.ajax({
								url:'../zzgl/deleteEnterpriseInfo',
								type:'post',
								data:{
									id:row.id1
								},
								success:function(result){
									if(result==1){
										//$('#addOrg').dialog('close');
										$.messager.alert('系统提示','删除企业成功！');
										$('#tpglGrid').datagrid('reload');
								
									}else{
										$.messager.alert('系统提示',result);
									}
								}
							});
						}
					});	
			}else{
				$.messager.alert('系统提示','请选择要删除的企业！');
			}
		}
        function selectSubmit(){
			
			$('#tpglGrid').datagrid('load',{
				selectOrgCode:$('#selectOrgCode').textbox('getValue'),
				selectOrgName:$('#selectOrgName').textbox('getValue'),
				selectOrgType:$('#selectOrgType').combobox('getValue'),
				selectOrgType1:$('#selectOrgType1').combobox('getValue'),
				selectIsValid:$('#selectIsValid').combobox('getValue'),
				selectCheckType:$('#selectCheckType').combobox('getValue'),
				selectMsgFrom:$('#selectMsgFrom').combobox('getValue')
				
			});
		}
		 function resetSubmit(){
			$('#selectOrgCode').textbox('setValue','');
			$('#selectOrgName').textbox('setValue','');
			$('#selectOrgType').combobox('setValue','4');
			$('#selectOrgType1').combobox('setValue','2');
			$('#selectIsValid').combobox('setValue','2');
			$('#selectCheckType').combobox('setValue','3');
			$('#selectMsgFrom').combobox('setValue','3');
			var selected=$('#tpflGrid').tree('getSelected');
			if(selected!=null){
			    $('#tpflGrid').tree('uncheck',selected);
			}
			selectSubmit();
		}
        function invalidOrg(){
			var row=$('#tpglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
				if(row.available=='1'){
				$.messager.confirm('确定无效企业','您确定要无效该企业吗？',function(flag){
					if(flag){
						var available=0;
					$.ajax({
						url:'../zzgl/invalidEnterprise',
						type:'post',
						data:{
							id:row.id1,
							isValid:available
						},
						success:function(result){
								if(result==1){
								
								$.messager.alert('系统提示','无效企业成功！');
								$('#tpglGrid').datagrid('reload');
								}else{
										$.messager.alert('系统提示',result);
								}
						}
					});
					}
				});
				}else{
					var available=1;
					$.ajax({
						url:'../zzgl/invalidEnterprise',
						type:'post',
						data:{
							id:row.id1,
							isValid:available
						},
						success:function(result){
								if(result==1){
								$.messager.alert('系统提示','无效企业成功！');
								$('#tpglGrid').datagrid('reload');
								}else{
										$.messager.alert('系统提示',result);
								}
						}
					});
				}
			}else{
				$.messager.alert('系统提示','请选择您要无效的企业！');
			}
		}
		function chakanOrg(){
			var row=$('#tpglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
            $('#addOrg').dialog({
                title: '企业查看',
                width: 700,
                height: 500,
                closed: false,
                cache: false,
                href: '../zzgl/qyAdd.jsp',
                modal: true,
                iconCls: 'icon-save',
				onLoad:function(){
					$('#fm').form('load',row);
					disableForm('fm',true);
				}

            });
			}else{
				$.messager.alert('系统提示','请选择要查看的企业！');
			}
		}
		
		
		function exportMbFuc(){
          window.location.href="../zzgl/qyDownload";
         } 
		
	
	//批量导入企业
    function plExportFuc(){
	$("#addXlFileForm2").ajaxSubmit({
		dataType:"html",
		url : "../zzgl/qyUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $('#addXlFileForm2')[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			if(result.infoMsg!=''&&result.infoMsg!=null){
			     infoMsg=result.infoMsg;
			 }
			    //展示数据
				 addqydrFuc(result.rows);
				
			}else{
			      $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 
		
	function addqydrFuc(dates){
	$('#qyglInfo').dialog({
    title: '企业导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zzgl/qydrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){ 
				   saveQy(dates);
				   $('#qyglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#qyglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   //企业
    $('#qydrGrid').datagrid({    
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
        {field:'mainOrgName',title:'主企业',width: $(this).width() *0.15},
     
        {field:'enterpriseCode',title:'企业代码',width: $(this).width() *0.15},
        {field:'manageType',title:'管理类型',width: $(this).width() *0.15},
        {field:'isSignOrg',title:'是否签约企业',width: $(this).width() *0.15},
        {field:'orgCode',title:'组织机构代码',width: $(this).width() *0.15},
        
        {field:'orgName',title:'单位名称',width: $(this).width() *0.15},
        {field:'orgNature',title:'企业性质',width: $(this).width() *0.15},
        {field:'legalPerson',title:'法人代表',width: $(this).width() *0.15},
        {field:'orgArea',title:'单位所在行政区划',width: $(this).width() *0.15},
        {field:'orgType',title:'填报单位类型',width: $(this).width() *0.15},
        {field:'orgLevel',title:'层次',width: $(this).width() *0.15},
        {field:'type',title:'机构类型',width: $(this).width() *0.15},
        {field:'registerType',title:'注册经济类型',width: $(this).width() *0.15},
        {field:'businessArea',title:'单位主管业务区域',width: $(this).width() *0.15},
        {field:'phone',title:'联系电话',width: $(this).width() *0.15},
        {field:'email',title:'邮箱号码',width: $(this).width() *0.15},
        {field:'sendTime',title:'上级单位报出日期',width: $(this).width() *0.15},
        {field:'parentOrgType',title:'上级单位类型',width: $(this).width() *0.15},
        {field:'parentOrgCode',title:'上级单位代码',width: $(this).width() *0.15},
        {field:'parentOrgName',title:'上级单位名称',width: $(this).width() *0.15},
        {field:'parentOrgLeader',title:'上级单位负责人',width: $(this).width() *0.15},
        {field:'parentOrgPhone',title:'上级单位电话',width: $(this).width() *0.15},
       
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#qydrGrid').datagrid('getPager');
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
	debugger;
	$('#qydrGrid').datagrid('loadData',dates);
	

    
    } //loadEnd
    

});

}	
		


var dateFlag=null;
var infoMsg=null;
//成绩保存
function saveQy(dates){
   if(dateFlag=='true'){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   if(infoMsg!=''&&infoMsg!=null){  
    var m="存在已保存的身份证号："+infoMsg;
    $.messager.confirm('确认', m+'您确认想要覆盖记录吗？',function(r){    
    if (r){    
         savaQy2(dates);
         infoMsg='';
    }else{
    infoMsg='';
       return;
    }    
   });  
  }else{
  savaQy2(dates);
  infoMsg='';
  }

   
}		
		
	
function savaQy2(dates){
  $.blockUI();
    $.ajax({
                url: "../zzgl/addQyList",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                    
                      successMsg();
                      $('#tpglGrid').datagrid('reload');
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

 //导出excel
 function exportFuc(){
    
    window.location.href=basePath+"zzgl/qyExport";

} 
 	
    </script>


<body style="margin: 1px;">
<div id="cc" class="easyui-layout" data-options="fit:true,border:false" >
    <div class="easyui-panel" data-options="region:'north',border:false" style="padding:5px;height: 90px">
	<table>
		<tr>
			<td>组织机构代码：</td>
			<td><input class="easyui-textbox"  id="selectOrgCode" name="selectOrgCode"/></td>
			<td>单位名称：</td>
			<td><input class="easyui-textbox"  id="selectOrgName" name="selectOrgName"/></td>
			<td>企业性质：</td>
			<td>
			<select style="width:160px" class="easyui-combobox" id="selectOrgType" name="selectOrgType" data-options="editable:false,panelHeight:null">
                <option value="4">所有</option>
				<option value="0">私营企业</option>
				<option value="1">国有企业</option>
				<option value="2">外资企业</option>
				<option value="3">合资企业</option>
			</select>
			</td>
			<td>企业架构：</td>
			<td>
			   <select style="width:160px" class="easyui-combobox" id="selectOrgType1" name="selectOrgType1" data-options="editable:false,panelHeight:null">
                <option value="2">所有</option>
				<option value="0">主企业</option>
				<option value="1">子企业</option>
			    </select>
			</td>
			<td><a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			<td><a onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		</tr>
		<tr>
				<td>有效性：</td>
			<td>
			   <select style="width:160px" class="easyui-combobox" id="selectIsValid" name="selectIsValid" data-options="editable:false,panelHeight:null">
                <option value="2">所有</option>
				<option value="0">无效</option>
				<option value="1">有效</option>
			    </select>
			</td>
			<td>审核状态：</td>
			<td>
			   <select style="width:160px" class="easyui-combobox" id="selectCheckType" name="selectCheckType" data-options="editable:false,panelHeight:null">
                <option value="3">所有</option>
				<option value="0">未审核</option>
				<option value="1">已审核</option>
				<option value="2">审核失败</option>
			    </select>
			</td>
			<td>数据来源：</td>
			<td>
			   <select style="width:160px" class="easyui-combobox" id="selectMsgFrom" name="selectMsgFrom" data-options="editable:false,panelHeight:null">
                <option value="3">所有</option>
				<option value="0">内部创建</option>
				<option value="1">外部注册</option>
				<option value="2">数据采集</option>
			    </select>
			</td>
		</tr>
	</table>
	<div style="float:left">
   
    <a onclick="addOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增主企业</a>
    <a onclick="addChildOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加子企业</a>
    <a onclick="deleteOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    <a onclick="invalidOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">失效</a>
    <a onclick="checkOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">审核</a>
        <a id="dcmb" onclick="exportMbFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出企业模板</a>
		<a id="dcmb" onclick="exportFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出excel</a>
</div>
 <div style="float:left">
        <form id="addXlFileForm2" method="post" enctype="multipart/form-data" style="width: 160px;height: 10px" >
		<a id="drwj" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="plExportFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">批量导入企业</a>
         </form>
       </div>
	</div>





    <div class="easyui-panel" data-options="region:'center',title:'企业管理',border:false" style="">
     
        <table id="tpglGrid"  class="easyui-datagrid" data-options="url:'../zzgl/listEnterpriseInfo',rownumbers:false,fitColumns:true,singleSelect:true,pagination:true,height:'90%'"
           >
            <thead>
            <tr>
                <th data-options="field:'id1',checkbox:true,align:'center'">选择</th>
                <th data-options="field:'mainOrg',width:40">主企业</th>
                <th data-options="field:'orgType1',formatter:function(value,row,index){if(value=='1') return '主企业'; else if(value=='2') return '子企业';},width:50">企业架构</th>
                <th data-options="field:'orgCode',width:80">组织机构代码</th>
                <th data-options="field:'orgName',width:40">单位名称</th>
                <th data-options="field:'orgType2',formatter:function(value,row,index){if(value=='0') return '私营企业';else if(value=='1') return '国有企业'; else if(value=='2') return '外资企业'; else if(value=='3') return '合资企业';},width:50">企业性质</th>
                <th data-options="field:'available',formatter:function(value,row,index){if(value=='0') return '无效'; else if(value=='1') return '有效';},width:40">有效性</th>
                <th data-options="field:'status',formatter:function(value,row,index){if(value=='0') return '未审核'; else if(value=='1') return '已审核'; else if(value=='2') return '审核失败';},width:50">审核状态</th>
                <th data-options="field:'isAuthorize',width:50,align:'center',formatter:formatAuthorize">采集授权</th>
                <th data-options="field:'options',width:40">审核意见</th>
                <th data-options="field:'source',formatter:function(value,row,index){if(value=='0') return '内部创建'; else if(value=='1') return '外部注册'; else if(value=='2') return '数据采集';},width:40">数据来源</th>
                <th data-options="field:'creator',width:40">录入人</th>
                <th data-options="field:'createTime',width:40">录入时间</th>
                <th data-options="field:'_operate',width:100,align:'center',formatter:formatOper">操作</th>
            </tr>
            </thead>
        </table>

    </div>
</div>

<div id="addOrg"></div>
<div id="qyglInfo"></div>
</body>
</html>
