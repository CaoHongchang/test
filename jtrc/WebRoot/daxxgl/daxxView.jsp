<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
   <title>材料信息</title>
  </head>

  <body >

<script type="text/javascript">

</script>


     
 
      <table id="llfjlbViewGrid"></table>  
            <script type="text/javascript">      
            var num = 0;
      function downFj2(id){
       window.location.href=basePath+"gdcl/downFj?id="+id;
      
      }
      
      function preview2(id) { 
    	
     window.open(id);    
     
     return
     
    $('#previewDialog').dialog({
	title: '图片预览',
    width: 300,
    height: 300,
    maximizable:true,
    resizable:true, 
    fitColumns:true,
    closed: false,
    cache: false,
    href: '../daxxgl/preview.jsp',
    modal: false,
    buttons:[{text:'关闭',iconCls:'icon-cancel',handler:function(){
    	$('#previewDialog').dialog('close');
    }}],
    onLoad:function(){ 
    var adr='';
     $.ajax({
                url: basePath+"gdcl/getImgView?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
               	  adr=basePath+data.rows.fileUrl;
				}else{
					  $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });
            
    var imgid=document.getElementById('previewImage');
	$('#previewImage').attr({
				'width':250,
				'height':250
	});
	imgid.src=adr;
	$('#previewImage').attr("onClick","roate2()");
	},

	
	});  
}

	 
      function roate2(obj){
    	
    	 
           num++;
               var angle=num*90;
           $("#stm"+obj).rotate(angle);
            var src= $("#stm"+obj).attr("src");
     
           $.post('<%=request.getContextPath()%>/gdcl/rotatePhoto',{src:src,angle1:angle},getback,"json");
           
 
        
 
        
      }
      function getback(data){
    	   if(data.flag ==true){
    	  		alert("同步成功 !");
    	   };
      }
      </script>
     
  
  </body>
</html>
