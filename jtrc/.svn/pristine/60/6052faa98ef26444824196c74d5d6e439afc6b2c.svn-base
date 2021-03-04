<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>员工审核</title>

<body>
<script type="text/javascript">
   var selections = $('#yyglGrid').datagrid('getSelections');
   var id=selections[0].id;
   //页面表单数据加载
     $.ajax({
                url: "../yggl/getYgMsg?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){
               	    $("#ygshForm").form('load', data.rows);
                     ldhtFun(data.rows.id);
				}else{
					   $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   errorMsg();

                }
            });
            
           //“审核”保存 
           function shFunction(){
           $("#ygshForm").ajaxSubmit({
			dataType:"html",
			url : "../yggl/yyglExamine",
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			async : true,
			success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			    successMsg();
			    $('#yyglViewInfo').dialog('close');
			    $('#yyglGrid').datagrid('reload');
			    
			}else{
			    $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});
           
} 

</script>
	<form id="ygshForm" method="post">

    <div id="aa" class="easyui-accordion" style="height:550px;">   
       <div title="申报审核" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">企业性质</td>
      <td class="right">
      <select  class="easyui-combobox" data-options="disabled:true" id="qyxz" name="qyxz" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
	</td>
      <td class="left">组织机构代码</td>
      <td class="right"><input id ="zzjgdm" name ="zzjgdm"  class="easyui-textbox"  size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">单位</td>
      <td class="right">
      <select  class="easyui-combobox" id="dw" name="dw"data-options="disabled:true" style="width:135px;"></select></td>
       <td class="left">身份证</td>
      <td class="right"><input class="easyui-textbox" id="sfz" name="sfz"  data-options="disabled:true" size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right"><input class="easyui-textbox" id="xm" name="xm"  size="20" data-options="disabled:true"  style="height:22px"></td>
       <td class="left">出生年月</td>
      <td class="right"><input class="easyui-textbox" id="csny" name="csny" size="20" data-options="disabled:true"  style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">性别</td>
      <td class="right">
      <select  class="easyui-combobox" id="xb" name="xb" data-options="disabled:true" style="width:135px;">   
	   </select>
      </td>
      <td class="left">现档案所在地</td>
      <td class="right"><input class="easyui-textbox" id="xdaszd" name="xdaszd"   size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
       <tr>
      <td class="left">参加工作时间</td>
      <td class="right"><input class="easyui-textbox"  id="cjgzsj" name="cjgzsj" size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">民族</td>
      <td class="right">
      <select  class="easyui-combobox" id="mz" name="mz"  data-options="disabled:true" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      <tr>
      <td class="left">用工形式</td>
      <td class="right">
      <select id=ygxs name="ygxs"   class="easyui-combobox"  data-options="disabled:true"   style="width:135px;">   
	    
	   </select>
      </td>
      <td class="left">政治面貌</td>
      <td class="right">
      <select  class="easyui-combobox" name="zzmm" id="zzmm" data-options="disabled:true" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox" name="byyx" id="byyx"  size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">毕业时间</td>
      <td class="right"><input class="easyui-textbox"  name="bysj" id="bysj"  size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">所学专业</td>
      <td class="right"><input class="easyui-textbox"  name="sxzy" id="sxzy"  size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">文化程度</td>
      <td class="right"><input class="easyui-textbox"  name="whcd" id="whcd"  size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">户籍地</td>
      <td class="right"><input class="easyui-textbox" name="hjd" id="hjd" size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">联系地址</td>
      <td class="right"><input class="easyui-textbox"  name="lxdz" id="lxdz" size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">固定电话</td>
      <td class="right"><input class="easyui-textbox"  name="gddh" id="gddh"  size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">手机号码</td>
      <td class="right"><input class="easyui-textbox"  name="sjhm" id="sjhm" size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox"  name="dzyx" id="dzyx"  size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">户籍性质</td>
      <td class="right"><input class="easyui-textbox"   name="hjxz" id="hjxz" size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
        <tr>
      <td class="left">户籍所在地</td>
      <td class="right">
      <select  class="easyui-combobox" name="hjszd" id="hjszd" data-options="disabled:true" style="width:135px;">   
	   </select>
      </td>
      <td class="left">开户银行</td>
      <td class="right">
      <select  class="easyui-combobox" name="khyh" id="khyh" data-options="disabled:true" style="width:135px;">   
	   <option value=""></option>   
	   </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">银行帐号</td>
      <td class="right"><input class="easyui-textbox" name="yhzh" id="yhzh"  size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">技术职称</td>
      <td class="right"><input class="easyui-textbox"  name="jszc" id="jszc"  size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">职业等级</td>
      <td class="right"><input class="easyui-textbox" name="zydj" id="zydj" size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left">执（职）业资格</td>
      <td class="right"><input class="easyui-textbox" name="zyzg" id="zyzg" size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">获取时间</td>
      <td class="right"><input class="easyui-textbox"  name="hqsj" id="hqsj"  size="20" data-options="disabled:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      </table>  
      </div>   
   
       </div>

       <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="劳动合同签订期限" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="ldhtGrid" >  </table>
             <script type="text/javascript">
               function ldhtFun(userId){
                $('#ldhtGrid').datagrid({    
					    url:basePath+"yggl/agreementList?userId="+userId, 
					    border:true,
						pageSize:10,
						pageList:[10,20,30,40],
						striped: true,
						collapsible:true,
						fitColumns:true,
						height: 150,
						width:'100%',
						toolbar: '',
						sortName: '',
						sortOrder: 'desc',
						remoteSort: false,    
					    columns:[[    
					      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
						        {field:'startdate',title:'开始时间',width:100},    
						        {field:'enddate',title:'结束时间',width:100}
					         
					    
					    ]]    
					     });  
					}
             
             </script>
              
              </div>
              </div>

        <table  class="table2">
      <tr>
      <td class="left">审核状态</td>
      <td class="right">
      <input type="hidden" id="id" name="id">
      <select id="shzt" class="easyui-combobox" data-options="editable:false" name="shzt" style="width:135px;">   
	   <option value="1">审核通过</option>
	   <option value="2">审核未通过</option>   
	   </select>
	</td>
	</tr>
	
	<tr>
      <td class="left">审核意见</td>
      <td class="right">
      <input class="easyui-textbox" name="shyj" id="shyj" size="60" data-options="multiline:true"  style="height:52px">
	</td>
	</tr>
	
	</table>     
    </form> 

</body>

</html>
