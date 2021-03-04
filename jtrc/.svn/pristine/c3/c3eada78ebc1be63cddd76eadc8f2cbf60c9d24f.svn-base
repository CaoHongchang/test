<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>员工修改</title>

<body>
<script type="text/javascript">



//出生日期年月
//dateSet("#csny");
        
        


  /*  var selections = $('#yyglGrid').datagrid('getSelections');
   var id=selections[0].id; */
   
        
/*     $('#qymc').combobox({    
    valueField:'id',    
    textField:'name',
    editable:true,
    hasDownArrow:false,
    prompt:'输入关键字后自动搜索', 
    url:'../yggl/qycx',    

	 onBeforeLoad: function(param){  
        if(param == null || param.q == null || param.q.replace(/ /g, '') == ''){  
            var value = $(this).combobox('getValue');  
            if(value){// 修改的时候才会出现q为空而value不为空  
                param.id = value;  
                return true;  
            }  
            return false;  
        }  
    }  
}); */
   //页面表单数据加载
   function loadEdit(id){
     $.ajax({
                url: "../yggl/getYgMsg?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){debugger;
                    if(data.rows!=null&&data.rows!=''){
               	     $("#ygxgForm").form('load', eval(data.rows));
                     ldhtFun(data.rows.id);
                     }else{
                     ldhtFun('');
                     }
				}else{
					  //failMsg(null);
					  ldhtFun('');
				 }	
                },
                error: function(data){
                   errorMsg();

                }
            });
            }
            
            
            
           //“修改”保存 
           function editSaveFun(){
             var r = $("#ygxgForm").form('enableValidation').form('validate');
	         if(!r) {
		       return false;
	          }
           
           
           var param=$("#ygxgForm").serializeArray();
			 param=JSON.stringify(param); 
			 var htParam= $("#ldhtGrid").datagrid("getData");
			 if(htParam.rows.length>0){
			 htParam=JSON.stringify(htParam.rows); 
			 }else{
			 htParam=null;
			 }
 
            $("#ygxgForm").ajaxSubmit({ 
			url : basePath+"yggl/yyglEdit",
			async : true,
			 data: {
                'param': param,
                'htParam': htParam
            },
			success : function(data) {debugger;
			if(data.flag ==true){
			    successMsg();
			    $('#yyglViewInfo').dialog('close');
			     $('#yyglGrid').datagrid('reload');
			    
			}else{
			  $.messager.alert('错误','操作失败！'+data.cause,'error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});
           
           
     
} 

 
</script>
	
	<form id="ygxgForm" method="post">
     <input type="hidden" id="sUid" name="sUid" ><!-- 登录的用户id -->
    <input type="hidden" id="id" name="id"> <!--用户id -->
    <input type="hidden" id="sstate" name="sstate"><!-- 审核状态id -->
    <input type="hidden" id="enterpriseId" name="enterpriseId"><!-- 原企业id -->
      <input type="hidden"  id="newEnterpriseId" name="newEnterpriseId"><!-- 修改后的企业id -->
    <div  class="easyui-accordion" style="height:570px;">   
       <div title="申报审核" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
     <tr>
     <td class="left">企业名称</td>
      <td class="right">
      
      
      <select  class="easyui-combobox" data-options="iconCls:''" id="qymc" name="qymc" style="width:135px;">   
	  
	   </select>
	</td>
	 <td class="left"></td>
      <td class="right">
     
     </tr>
      <tr>
      <td class="left">企业性质</td>
      <td class="right">
     <input type="hidden" name="pro_id" id="pro_id"><!-- 企业性质编码 --> 
    <input id ="qyxz" name ="qyxz"  class="easyui-textbox"  size="20" data-options="disabled:true" style="height:22px">
	</td>
      <td class="left">组织机构代码</td>
      <td class="right"><input id ="zzjgdm" name ="zzjgdm"  class="easyui-textbox"  size="20" data-options="disabled:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">单位</td>
      <td class="right">
      <select  class="easyui-combobox" id="dw" name="dw"data-options="" style="width:135px;"></select></td>
       <td class="left">身份证</td>
      <td class="right"><input class="easyui-textbox" id="sfz" name="sfz"  data-options="required:true,validType:'idcard'" maxlength="18" size="20"  style="height:22px"></td>
      </tr>
      <tr> 
      <td class="left">姓名</td>
      <td class="right"><input class="easyui-textbox" id="xm" name="xm"  size="20" data-options="validType:['length[0,10]']"  style="height:22px"></td>
       <td class="left">出生年月</td>
      <td class="right"><input onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月',readOnly:true})"  id="csny"  name="csny"   type= "text" class="Wdate"  size="20" style="height:22px;"/>  
      </td>

      </tr>
      <tr>
      <td class="left">性别</td>
      <td class="right">
      <select  class="easyui-combobox" data-options="editable:false" id="xb" name="xb" data-options="" style="width:135px;">   
	  <option value="男">男</option>
	  <option value="女">女</option>
	  </select>
      </td>
      <td class="left">现档案所在地</td>
      <td class="right"><input class="easyui-textbox" id="xdaszd" name="xdaszd"   size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      </tr>
       <tr>
      <td class="left">参加工作时间</td>
      <td class="right"><input  id="cjgzsj"  name="cjgzsj"   type= "text" class= "easyui-datebox" size="20" style="height:22px"/> </td>
      <td class="left">民族</td>
      <td class="right">
      <select  class="easyui-combobox" id="mz" name="mz"  data-options="" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      <tr>
      <td class="left">用工形式</td>
      <td class="right">
      <select id=ygxs name="ygxs"   class="easyui-combobox"  data-options="" style="width:135px;">   
	    <option value="全日制">全日制</option>
	   <option value="非全日制">非全日制</option>
	   <option value="派遣">派遣</option>
	   </select>
      </td>
      <td class="left">政治面貌</td>
      <td class="right">
      <select  class="easyui-combobox" name="zzmm" id="zzmm" data-options="" style="width:135px;">   
	   <option value="党员">党员</option>
	   <option value="团员">团员</option>  
	   <option value="其它">其它</option>     
	   </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox" name="byyx" id="byyx"  size="20" data-options="validType:['length[0,30]']" style="height:22px"></td>
      <td class="left">毕业时间</td>
      <td class="right"><input class="easyui-datebox"  name="bysj" id="bysj"  size="20" data-options="" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">所学专业</td>
      <td class="right"><input class="easyui-textbox"  name="sxzy" id="sxzy"  size="20" data-options="validType:['length[0,30]']" style="height:22px"></td>
      <td class="left">文化程度</td>
      <td class="right"><input class="easyui-textbox"  name="whcd" id="whcd"  size="20" data-options="validType:['length[0,30]']" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">户籍地</td>
      <td class="right"><input class="easyui-textbox" name="hjd" id="hjd" size="20" data-options="validType:['length[0,30]']" style="height:22px"></td>
      <td class="left">联系地址</td>
      <td class="right"><input class="easyui-textbox"  name="lxdz" id="lxdz" size="20" data-options="validType:['length[0,150]']" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">固定电话</td>
      <td class="right"><input class="easyui-textbox"  name="gddh" id="gddh"  size="20" data-options="validType:['length[0,15]']" style="height:22px" maxlength="13"></td>
      <td class="left">手机号码</td>
      <td class="right"><input class="easyui-textbox"  name="sjhm" id="sjhm" size="20" data-options="validType:['length[0,11]']" style="height:22px" maxlength="11"></td>
      </tr>
      
       <tr>
      <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox"  name="dzyx" id="dzyx"  size="20" data-options="validType:['length[0,50]']" style="height:22px"></td>
      <td class="left">户籍性质</td>
      <td class="right"><input class="easyui-textbox"   name="hjxz" id="hjxz" size="20" data-options="" style="height:22px"></td>
      </tr>
      
        <tr>
      <td class="left">户籍所在地</td>
      <td class="right">
      <select class="easyui-combobox" name="hjszd" id="hjszd" data-options="" style="width:135px;">   
	   <option value="本市">本市</option>
	   <option value="派遣">派遣</option>
	   </select>
      </td>
      <td class="left">开户银行</td>
      <td class="right">
      <select class="easyui-combobox" name="khyh" id="khyh" data-options="" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">银行帐号</td>
      <td class="right"><input class="easyui-textbox" name="yhzh" id="yhzh"  size="20" data-options="validType:['length[0,30]']" style="height:22px"></td>
      <td class="left">技术职称</td>
      <td class="right"><input class="easyui-textbox"  name="jszc" id="jszc"  size="20" data-options="validType:['length[0,40]']" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">职业等级</td>
      <td class="right"><input class="easyui-textbox" name="zydj" id="zydj" size="20" data-options="validType:['length[0,40]']" style="height:22px"></td>
      <td class="left">执（职）业资格</td>
      <td class="right"><input class="easyui-textbox" name="zyzg" id="zyzg" size="20" data-options="validType:['length[0,40]']" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">获取时间</td>
      <td class="right"><input class="easyui-datebox"  name="hqsj" id="hqsj"  size="20" data-options="" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      </table>  
      </div>   
   
       </div>

       <div id="aa" class="easyui-accordion" style="height:250px;">   
       <div title="劳动合同签订期限" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <div id="ygEditTool"  style="background-color:#FFFFFF;">
			<a onclick="addHt();"class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
			<a onclick="deletHt();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	       </div>
              <table id="ldhtGrid" >  </table>
             <script type="text/javascript">
               function ldhtFun(userId){
               var href='';
               if(userId!=''&&userId!=null){
                 href=basePath+"yggl/agreementList?userId="+userId;
               }
                $('#ldhtGrid').datagrid({    
					    url:href, 
					    border:true,
						pageSize:10,
						pageList:[10,20,30,40],
						striped: true,
						collapsible:true,
						fitColumns:true,
						toolbar: '#ygEditTool',
						height: 150,
						width:'100%',
						toolbar: '',
						sortName: '',
						sortOrder: 'desc',
						remoteSort: false, 
						checkbox:true,   
					    columns:[[    
					          {field:'id',title:'选择',checkbox:true,width:100},
						        {field:'startdate',title:'开始时间',width:100},    
						        {field:'enddate',title:'结束时间',width:100}
					         
					    
					    ]]    
					     });  
					}
             
             </script>
              
              </div>
              </div>

    
    </form> 
    
	
	
   <script type="text/javascript">
   function deletHt(){
      var rows = $('#ldhtGrid').datagrid('getSelections');
      if(rows.length<=0){
      $.messager.alert('提示','请选择要删除的数据！');
	  return ;
      }
      for(var i = 0; i < rows.length; i++){
      var index = $('#ldhtGrid').datagrid('getRowIndex',rows[i]);//获取某行的行号
	   $('#ldhtGrid').datagrid('deleteRow',index);
      }   
   
   }
   
   
     function addHt(){

	$('#ygHtInfo').dialog({
    title: '添加劳动合同时间',
    width: 350,
    height: 250,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygHtAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				 saveHt();
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ygHtInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {


    
    } //loadEnd
    

});
       
     
     }
     
     </script>
  
    

</body>

</html>
