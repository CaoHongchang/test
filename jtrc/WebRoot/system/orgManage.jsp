<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>组织权限分配</title>

<script type="text/javascript">
	 $(function(){
   
  
	
	
	
	});





 
</script>


<body style="margin: 1px;">

<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   

    <div data-options="region:'west',title:'组织结构',split:true,border:false" style="width:300px;">
        <ul id="zzjgTree" class="easyui-tree">   
      
            <li>   
                <span>省交通运输人才中心</span>   
                <ul>   
                    <li>   
                        <span><a href="#">党委</a></span>   
                    </li>   
                    <li>   
                        <span>财务部</span>   
                    </li>   
                    <li>   
                        <span>宏业公司</span>   
                    </li>   
                </ul>   
            </li>   

</ul>  
    
    
    </div>   
    <div data-options="region:'center',title:'权限分配',border:false" style="">
        <ul id="qxfpTree" class="easyui-tree">   
      
            <li>   
                <span>咨询管理</span>   
                <ul>   
                    <li>   
                        <span><a href="#">咨询分类管理</a></span>   
                    </li>   
                    <li>   
                        <span>图片管理</span>   
                    </li>   
                      
                </ul>   
            </li>   

     </ul>   
    </div>   
</div>  



<div id="zzqxfpAddInfo"></div> 


</body>
</html>
