<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>参数修改</title>

<body>

	<form id="csxg" method="post">

   <div>
      <table class="table2">
      <tr>
	      <td class="left">参数编码</td>
	      <td class="right"><input id ="zhmc11" name="zhmc11" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">参数名称</td>
	      <td class="right"><input id ="zhmc21" name="zhmc21"  class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
	  <tr>
	      <td class="left">参数值</td>
	      <td class="right"><input id ="zhmc31" name="zhmc31"  class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">说明</td>
	      <td class="right"><input id ="zhmc41" name="zhmc41" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      </table>   
    </div>
    </form> 
     <script type="text/javascript">
      
         $(function(){//存放最开始的参数编号
        	 var temp='';
             $("#zhmc11").textbox({
            	 onChange:function(newValue,oldValue){
            		  if(temp==''){
            			   temp=newValue;
            		  }
            		  if(newValue!=temp&&newValue!=''){
            			$.ajax({
    	    				url:'../csgl/getCode',
    	    				type:'post',
    	    				data:{
    	    					ext:newValue
    	    				},
    	    				success:function(result){
    	    					result=$.parseJSON(result);
    	    					if(!result.flag){
    	    						$.messager.alert('系统提示',newValue+'参数编码已经存在','info');
    	    						$("#zhmc11").textbox('setValue','');
    	    					}
    	    				}
    	    			});
            		  }
            	 }
             });
          
         });
     </script>
</body>

</html>
