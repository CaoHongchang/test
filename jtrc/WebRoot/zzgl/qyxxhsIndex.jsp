<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){
			
            $('#qyxxGrid').datagrid({
                url:'../zzgl/listUnitInfo',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
                collapsible:true,
                fitColumns:true,
                height: '100%',
                toolbar: '#zcpshdTool',
                pagination:true,
				singleSelect:true,
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
				    {field:'id1',title:'选择',checkbox:true,align:'center'},
				    {field:'mainOrg',title:'主企业',width : $(this).width() * 0.1,align:'center'},
				    {field:'orgType',title:'企业架构',width : $(this).width() * 0.1,align:'center',formatter:function(value,row,index){if(value=='0') return '主企业'; else if(value=='1') return '子企业';}},
				    {field:'orgCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
				    {field:'orgName',title:'单位名称',width : $(this).width() * 0.1,align:'center'},
				    {field:'status',title:'状态',width : $(this).width() * 0.1,align:'center',formatter:function(value,row,index){if(value=='0')return '待审核';else if(value=='1') return '审核通过'; else if(value=='2') return '审核不通过'; else return "采集中";}},
                    {field:'content',title:'审核意见',width : $(this).width() * 0.1,align:'center'},
                    {field:'dataSource',title:'数据来源',width : $(this).width() * 0.1,align:'center',formatter:function(value,row,index){return '数据采集';}},
                    {field:'creator',title:'录入人',width : $(this).width() * 0.1,align:'center'},
                    {field:'createTime',title:'录入时间',width : $(this).width() * 0.2,align:'center'},
                    {
     				   title:'操作',field:'uid',width:$(this).width() * 0.2,align:'center',
     	    		   formatter: function(value,row,index){
                           var id=row.id1;
     			          return '<a href="javascript:chakanOrg()" style="color: blue;">查看</a> <a href="javascript:checkOrg()" style="color: blue;">审核</a>';
     			       }   
     			       }
                ]]
            });

            var pager = $('#qyxxGrid').datagrid('getPager');
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
        function chakanOrg(){
			var row=$('#qyxxGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
            $('#viewDialog').dialog({
                title: '企业查看',
                width: 900,
                height: 500,
                closed: false,
                cache: false,
                href: '../zzgl/cjqyView.jsp',
                modal: true,
                iconCls: 'icon-save',
				onLoad:function(){
					$('#fmView').form('load',row);
					disableForm('fmView',true);
				}

            });
			}else{
				$.messager.alert('系统提示','请选择要查看的企业！');
			}
		}
        
        function checkOrg(){
		      var row=$('#qyxxGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
				if(row.status=='0'){
          $('#CheckDialog').dialog({
              title: '企业审核',
              width: 900,
              height: 500,
              closed: false,
              cache: false,
              href: '../zzgl/cjqyCheck.jsp',
              modal: true,
              buttons:[{
                  text:'审核',
                  iconCls:'icon-ok',
                  handler:function(){
                	  var content = $("#content").val();
                	  if(content.length>200){
                			alert('审核意见不能超过200位');
                			return ;
                	  }
                      var result = $("#fmCheck").form("validate");
                      if(result){
							$.messager.confirm('确定审核','您确定要审核该企业吗？',function(flag){
								if(flag){
									$("#fmCheck").form("submit",{
										url:'../zzgl/checkUnitInfo',
										type:'post',
										queryParams:{
											id:row.id1,
											checkUserId:$('#checkUserId').val()
										},success:function(result){
										if(result==1){
										$('#CheckDialog').dialog('close');
										$.messager.alert('系统提示','审核企业成功！');
										$('#qyxxGrid').datagrid('reload');
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
					$('#fmCheck').form('load',row);
					$('#status').combobox('setValue','1');
		  			$('#checkUser').textbox('setValue','<%=(String)request.getSession().getAttribute("realName")%>');
		  			$('#checkUserId').val('<%=(String)request.getSession().getAttribute("uid")%>');
				}

          });
				}else{
					$.messager.alert('系统提示','当前状态无法审核！');
				}
			}else{
			     $.messager.alert('系统提示','请选择您要审核的企业！');
			}
      }

	function selectSubmit(){
		$('#qyxxGrid').datagrid('load',{
		    selectOrgCode:$('#selectOrgCode').val(),
			selectOrgName:$('#selectOrgName').val(),
			selectCheck:$('#selectCheck').combobox('getValue')
		});
	}
	function resetSubmit(){
		    $('#selectOrgCode').textbox('setValue','');
			$('#selectOrgName').textbox('setValue','');
			$('#selectCheck').combobox('setValue','3');
		    selectSubmit();
	}
    </script>


<body style="margin: 1px;">
<div class="easyui-layout" data-options="fit:true,border:false">
<div data-options="region:'north',border:false" style="padding:5px">
	    <table>
		   <tr style="padding:5px">
		       <td>组织机构代码：</td>
			   <td><input id="selectOrgCode" name="selectOrgCode" class="easyui-textbox" size="20" /></td>
			   <td>单位名称:</td>
			   <td><input id="selectOrgName" name="selectOrgName" class="easyui-textbox" size="20"/></td>
			   <td>审核状态：</td>
			   <td>
			   <select id="selectCheck" name="selectCheck" class="easyui-combobox" style="width:160px" data-options="editable:false,panelHeight:null" />
				  <option value="3">所有</option>
				  <option value="9">采集中</option>
				  <option value="0">待审核</option>
			      <option value="1">审核通过</option>
				  <option value="2">审核不通过</option>
			   </select>
			   </td>
			  
			   <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			   <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		   </tr>
		</table>
	</div>
    <div data-options="region:'center',title:'企业采集信息管理',border:false" style="">
        <table id="qyxxGrid"></table>
    </div>
</div>

<div id="viewDialog"></div>
<div id="CheckDialog"></div>

</body>
</html>
