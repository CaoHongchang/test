<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){
			/*
            $('#tpflGrid').tree({
                url:'',
                checkbox:false,
                onClick:function(node){
                    var id = node["id"];
                    $('#tpglGrid').datagrid('load',{
                        pid:id
                    });
                }
            });
            */

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

        function addPic(){
            $('#addImageTypeDialog').dialog({
                title: '图片新增',
                width: 500,
                height: 450,
                closed: false,
                cache: false,
                href: '../tpgl/tpAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var result = $("#fm").form("validate");
                        if(result){
                            if($('#useTime').datetimebox('getValue')>$('#disableTime').datetimebox('getValue')){
                                $.messager.alert('系统提示','上架时间应早于下架时间！','info');
                                $('#useTime').datetimebox('setValue','');
                                $('#disableTime').datetimebox('setValue','');
                            }
							else if(judgeFile()){
								$('#fm').form('submit',{
									url:'../tpgl/insertAdverInfo',
									queryParams:{
										createTime:$('#createTime').datetimebox('getValue')
									},
									success:function(data){
										if(data==1){
										$('#addImageTypeDialog').dialog('close');
										$('#tpglGrid').datagrid('reload');
									  }else{
										$.messager.alert('系统提示',data);
									   }
									}
									
								});
							}
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addImageTypeDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					
					$('#createTime').datetimebox('setValue',DateFormat(new Date(),"yyyy-MM-dd HH:mm:ss"));
					$.ajax({
					    url:'../tpgl/generatePno',
					    type:'post',
					    success:function(result){
					    	$('#code').textbox('setValue',result);
					    }
					});
				
				}

            });
        }

        function formatOper(value,row,index)
        {
		
            return "<div>" +
			        "<a href='javascript:updateAdverInfo("+row.id1+")' style='color:blue'>修改</a>&nbsp;&nbsp;"+
                    "<a href='javascript:pulloffPic("+row.id1+")' style='color:blue'>下架</a>&nbsp;&nbsp;" +
                    "<a href='javascript:deleteAdverInfo("+row.id1+")' style='color:blue' >删除</a>&nbsp;&nbsp;" +
                    "<a href=\"javascript:preview(\'"+row.adr+"\')\" onmouseover=\"preview(\'"+row.adr+"\')\" onmouseleave='closeDialog()' style='color:blue'>预览</a>" +
                    "</div>";
        }

		function updateAdverInfo(id){
			var row=$('#tpglGrid').datagrid('getSelected');
            $('#addImageTypeDialog').dialog({
                title: '图片修改',
                width: 500,
                height: 450,
                closed: false,
                cache: false,
                href: '../tpgl/tpAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){

                        var result = $("#fm").form("validate");
                        if(result){
                           if($('#useTime').datetimebox('getValue')>$('#disableTime').datetimebox('getValue')){
                                $.messager.alert('系统提示','上架时间应早于下架时间！','info');
                                $('#useTime').datetimebox('setValue','');
                                $('#disableTime').datetimebox('setValue','');
                            }
							else
							if(judgeFile()){
								$('#fm').form('submit',{
									url:'../tpgl/updateAdverInfo',
									queryParams:{
										id:id,
										createTime:$('#createTime').datetimebox('getValue')
									},
									success:function(data){
										if(data==1){
										$('#addImageTypeDialog').dialog('close');
										$.messager.alert('系统提示','修改图片成功！');
										$('#tpglGrid').datagrid('reload');
									  }else{
										$.messager.alert('系统提示',data);
									   }
									}
									
								});
							}
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addImageTypeDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					$('#code').textbox('setValue',row.code);
					$('#orderNo').numberbox('setValue',row.orderNo);
					$('#picTitle').textbox('setValue',row.picTitle);
					$('#typeId').combotree('tree').tree({
					   onLoadSuccess:function( node, data){
					        
					        $('#typeId').combotree('tree').tree('select',$('#typeId').combotree('tree').tree('find',row.tid).target);
					        $('#typeId').combotree('setValue',row.tid);
					   } 
					
					});
					$('#imageType').combobox('setValue',row.typeId);
					$('#url').textbox('setValue',row.url);
					$('#useTime').datetimebox('setValue',row.useTime);
					$('#disableTime').datetimebox('setValue',row.disableTime);
					$('#createTime').datetimebox('setValue',row.createTime);
					$('#file').filebox('setValue',row.adr);
				}

            });
        }
	function deleteAdverInfo(id){
		var ids = "";
		if('' != id){
			ids = id;
		}else{
			ids = getSelectRowId();
	    }
	
	    if(ids != ""){
			$.messager.confirm("确定删除","您是否确定删除所选的节点？",function(flag){
			    if(flag){
					 $.ajax({  
				    type: "post",  
				     cache: false,  
				     url: "../tpgl/deleteAdverInfo",  
				     data: "ids=" + ids,  
				     success: function (result) {  
				    if(result == 1){
						$.messager.alert('系统提示',"您已成功删除节点！");
						$('#tpglGrid').datagrid('reload');  
					}else{
						$.messager.alert('系统提示',result);
					}
				}  
			});  
				}else{
					
				}
		    });
	    	
		 }else{
			 $.messager.alert('系统提示',"请选择要删除的数据");
	     }
	}
	function getSelectRowId(){
		var rows = $('#tpglGrid').datagrid('getSelections');  
		var ids = "";
    	if (rows.length>0) {  
    		for(var i=0; i<rows.length; i++){
    			if(ids == ""){
        			ids = rows[i].id1;
        		}else{
        			ids += "," + rows[i].id1;
            	}
    		}
    	}
    	return ids;
	}
	//下架图片
	function pulloffPic(id){
		var date=new Date();
		var day=date.getDate()<10?"0"+date.getDate():date.getDate();
		var year=1900+date.getYear();
		var month=date.getMonth()+1;
		month=month<10?"0"+month:month;
		var str=year+"-"+month+"-"+day;
		$.messager.confirm("下架图片","您确定要下架此图片吗?",function(flag){
			if(flag){
				$.ajax({
			      url:'../tpgl/pullofAdverInfo',
			      type:'post',
			      data:{
				    id:id,
				    disableTime:str
			      },
			      success:function(data){
				  if(data==1){
					  $.messager.alert('系统提示','下架成功');
					  $('#tpglGrid').datagrid('reload');
				  }else{
					$.messager.alert('系统提示',data);
				  }
			   }
		       });
			}
		});
		
	}
	function judgeFile(){
			var filename=$('#file').filebox('getValue');
	  		if(filename!=""){
	  		var suffix=filename.substring(filename.lastIndexOf("."),filename.length).toUpperCase();
			
			//判断文件类型* PNG ，JPEG ，TIFF，ZIP、RAR、DOC、DOCX、XLS、XLSX
			var ftype=[".PNG",".JPEG",".TIFF",".JPG"];
			var flag=false;
			for(var i=0;i<ftype.length;i++){
				if(suffix==ftype[i]){
					flag=true;
					break;
				}
			}
			if(!flag){
				$.messager.alert('系统提示',"文件格式需为【PNG,JPG,JPEG,TIFF】");
			}else{
			     /*var filesize=files[0].size/1024/1024;
				if(filesize>10){
						$.messager.alert('系统提示',"文件大小不能大于10M");
					    flag=false;
				}*/
			}
			return flag;
	  		}else{
	  		  return true;
	  		 }
			
	}
   function selectSubmit(){
        var selected=$('#selectTypeTitle').combotree('tree').tree('getSelected');
        var typeTitle="";
        if(selected!=null){
            typeTitle=selected.id;
        }
		$('#tpglGrid').datagrid('load',{
			selectCode:$('#selectCode').textbox('getValue'),
			selectTypeTitle:typeTitle,
			selectImageType:$('#selectImageType').combobox('getValue'),
			selectPicTitle:$('#selectPicTitle').textbox('getValue'),
			selectCreateTime:$('#selectCreateTime').datebox('getValue'),
			selectUseTime:$('#selectUseTime').datebox('getValue'),
			selectDisableTime:$('#selectDisableTime').datebox('getValue')
		});
	}
	function resetSubmit(){
		$('#selectCode').textbox('setValue','');
		$('#selectTypeTitle').combotree('clear');
		$('#selectImageType').combobox('setValue','0');
		$('#selectPicTitle').textbox('setValue','');
	    $('#selectCreateTime').datebox('setValue','');
		$('#selectUseTime').datebox('setValue','');
		$('#selectDisableTime').datebox('setValue','');
		selectSubmit();
	}
	function preview(adr) {  
	        $('#previewDialog').dialog({
			title: '图片预览',
            width: 300,
            height: 300,
            closed: false,
            cache: false,
            href: '../tpgl/preview.jsp',
            modal: false,
		    onLoad:function(){ 
            var imgid=document.getElementById('previewImage');
			
			imgid.src=adr;
           // imgid.src="http://localhost:8080/jtrc/upload/adverinfos/2016-07-20/eeedf408-bfca-449f-89a1-fb466d016a9c.jpg";  
			}
			});  
        }
    function closeDialog(){
		var flag=$("#previewDialog").parent().is(":hidden");
		if(!flag){
			$('#previewDialog').dialog('close');
		}
	}		
    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a onclick="addPic()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a onclick="addPic()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改</a>
    <a  onclick="deleteAdverInfo('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    

</div>
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
    <!--
    <div data-options="region:'west',title:'图片分类',split:true,border:false" style="width:300px;">
        <table id="tpflGrid"></table>

    </div>
	-->
    <div data-options="region:'north',border:false"  style="padding:5px">
	    <form id="searchForm" type="post">
		   <table>
		      <tr>
			     <td>图片编码:</td>
			     <td><input id="selectCode" name="selectCode" class="easyui-textbox" /></td>
				 <td>分类名称:</td>
			     <td><input id="selectTypeTitle" name="selectTypeTitle" data-options="panelHeight:null,editable:false" url="../tpgl/listAdverTypeInfoTree" class="easyui-combotree" /></td>
				  <td>图片类型:</td>
			     <td>
				 <select id="selectImageType" name="selectImageType" data-options="panelHeight:null,editable:false" class="easyui-combobox" style="width:150px">
				     <option value="0">所有</option>
					 <option value="1">轮播图</option>
					 <option value="2">图片链接</option>
					 <option value="3">普通图片</option>
				 </select>
				 </td>
				  <td>图片名称:</td>
			     <td><input id="selectPicTitle" name="selectPicTitle" class="easyui-textbox" /></td>
				 
				 <td> <a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
				 <td> <a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
			  </tr>
			  <tr>
			  <td>创建时间:</td>
				 <td><input id="selectCreateTime" name="selectCreateTime" class="easyui-datebox" /></td>
				 <td>上架时间:</td>
				  <td><input id="selectUseTime" name="selectUseTime" class="easyui-datebox" /></td>
				 <td>下架时间:</td>
				  <td><input id="selectDisableTime" name="selectDisableTime" class="easyui-datebox" /></td>
			  </tr>
		   </table>
		</form>
	</div>
    <div data-options="region:'center',title:'图片列表',border:false" style="">
        <%--<table id="tpglGrid"></table>--%>
        <table id="tpglGrid" title="" class="easyui-datagrid"
               url="../tpgl/listAdverInfo"
               rownumbers="false" fitColumns="true" singleSelect="true" pagination="true" height="90%" toolbar="#zcpshdTool">
            <thead>
            <tr>
                <th data-options="field:'id1',checkbox:true,align:'center'">选择</th>
                <th data-options="field:'code',width:40">图片编码</th>
                <th data-options="field:'typeTitle',width:50">分类名称</th>
                <th data-options="field:'typeId',width:50,formatter:function(value,row,index){if(value=='1') return '轮播图';else if(value=='2') return '图片链接'; else if(value=='3') return '普通图片';}">图片类型</th>
                <th data-options="field:'picTitle',width:40">图片名称</th>
                <th data-options="field:'createTime',width:40,formatter:function(value,row,index){return value.substring(0,10);}">创建时间</th>
                <th data-options="field:'useTime',width:40,formatter:function(value,row,index){return value.substring(0,10);}">上架时间</th>
                <th data-options="field:'disableTime',width:40,formatter:function(value,row,index){return value.substring(0,10);}">下架时间</th>
                <th data-options="field:'orderNo',width:40">排序编号</th>
                <th data-options="field:'url',width:40">URL</th>
                <th data-options="field:'_operate',width:50,align:'center',formatter:formatOper">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<div id="addImageTypeDialog"></div>
<div id="previewDialog"></div>  
</body>
</html>
