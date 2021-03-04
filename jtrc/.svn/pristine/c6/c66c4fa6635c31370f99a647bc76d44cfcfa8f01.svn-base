<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>参数新增</title>

<body>

	<form id="csxz" method="post">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">参数编码</td>
	      <td class="right"><input id ="zhmc1" name="zhmc1" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">参数名称</td>
	      <td class="right"><input id ="zhmc2" name="zhmc2"  class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
	  <tr>
	      <td class="left">参数值</td>
	      <td class="right"><input id ="zhmc3" name="zhmc3"  class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">说明</td>
	      <td class="right"><input id ="zhmc4" name="zhmc4" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      </table>  
    </div>
         
    </form> 
     <script type="text/javascript">
	    $(function(){
	    	$("#zhmc1").textbox({
	    		onChange:function(newValue,oldValue){
	    			
	    			if(newValue!=''){
	    			$.ajax({
	    				url:'../csgl/getCode',
	    				type:'post',
	    				data:{
	    					ext:newValue
	    				},
	    				success:function(result){
	    					result=$.parseJSON(result);
	    					if(result.flag==false){
	    						var msg=newValue+"参数编码已经存在";
	    						$.messager.alert('系统提示',msg,'info');
	    						$("#zhmc1").textbox('setValue','');
	    					}
	    				}
	    			});
	    			}
	    		}
	    	});
			//$.parser.parse($("#zhmc1"));
		});
	 </script>
</body>

</html>
