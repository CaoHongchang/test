<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<meta charset="UTF-8">
<title>jQuery Autocomplete入门示例</title>
<!-- <link rel="Stylesheet" href="../js/jquery-autocomplete/jquery.autocomplete.css" />
<script async src="//code.jquery.com/ui/1.10.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="../js/jquery-autocomplete/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="../js/jquery-autocomplete/jquery.autocomplete.min.js"></script>
 -->
 
 <style type="text/css"> 
#preview_wrapper{   
    display:inline-block;   
    width:300px;   
    height:300px;   
    background-color:#CCC;   
}   
#preview_fake{ /* 该对象用户在IE下显示预览图片 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);   
}   
#preview_size_fake{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);     
    visibility:hidden;   
}   
#preview{ /* 该对象用户在FF下显示预览图片 */   
    width:300px;   
    height:300px;   
}   
</style> 
 
 
 <script type="text/javascript"> 
function onUploadImgChange(sender){   
    if( !sender.value.match( /.jpg|.gif|.png|.bmp/i ) ){   
        alert('图片格式无效！');   
        return false;   
    }   
       
    var objPreview = document.getElementById( 'preview' );   
    var objPreviewFake = document.getElementById( 'preview_fake' );   
    var objPreviewSizeFake = document.getElementById( 'preview_size_fake' );   
       
    if( sender.files && sender.files[0] ){   
        objPreview.style.display = 'block';   
        objPreview.style.width = 'auto';   
        objPreview.style.height = 'auto';   
           
        // Firefox 因安全性问题已无法直接通过 input[file].value 获取完整的文件路径   
        objPreview.src = sender.files[0].getAsDataURL();       
    }else if( objPreviewFake.filters ){    
        // IE7,IE8 在设置本地图片地址为 img.src 时出现莫名其妙的后果   
        //（相同环境有时能显示，有时不显示），因此只能用滤镜来解决   
           
        // IE7, IE8因安全性问题已无法直接通过 input[file].value 获取完整的文件路径   
        sender.select();   
        var imgSrc = document.selection.createRange().text;   
           
        objPreviewFake.filters.item(  //ie显示图片的div id 
            'DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;   
        //获取原始图片大小
        //objPreviewSizeFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;   
        alert(2);   
         objPreviewFake.style.width = '300px';   
        objPreviewFake.style.height = '150px';   
        //autoSizePreview( objPreviewFake,1140, 900 );   
        objPreview.style.display = 'none';   
    }   
}   
function onPreviewLoad(sender){   
    autoSizePreview( sender, sender.offsetWidth, sender.offsetHeight );   
}   
function autoSizePreview( objPre, originalWidth, originalHeight ){   
    var zoomParam = clacImgZoomParam( 300, 300, originalWidth, originalHeight );   
    objPre.style.width = zoomParam.width + 'px';   
    objPre.style.height = zoomParam.height + 'px';   
    objPre.style.marginTop = zoomParam.top + 'px';   
    objPre.style.marginLeft = zoomParam.left + 'px';   
}   
function clacImgZoomParam( maxWidth, maxHeight, width, height ){   
    var param = { width:width, height:height, top:0, left:0 };   
       
    if( width>maxWidth || height>maxHeight ){   
        rateWidth = width / maxWidth;   
        rateHeight = height / maxHeight;   
           
        if( rateWidth > rateHeight ){   
            param.width = maxWidth;   
            param.height = height / rateWidth;   
        }else{   
            param.width = width / rateHeight;   
            param.height = maxHeight;   
        }   
    }   
    param.left = (maxWidth - param.width) / 2;   
    param.top = (maxHeight - param.height) / 2;   
       
    return param;   
}   
</script> 
 
 
</head>
<title>员工导入</title>
<!-- 	  <script>
 var data = [{"name":"电视","value":"电视11","id":101},
    	            {"name":"开会","value":"开会2222","id":102},
    	            {"name":"电视21","value":"电fds","id":103},
    	            {"name":"电视22","value":"电视呜呜呜","id":104},
    	            {"name":"电视26","value":"电视ss呜","id":109},
    	            {"name":"电视29","value":"电视20","id":110},
    	            {"name":"开会333","value":"开会啦---","id":105},
    	            {"name":"开会555","value":"开会？？？？","id":106},
    	            {"name":"开会888","value":"开会}}}}","id":107} ]
    $(function() {
    	
   $("#text").AutoComplete({
      		'data':data,
      		'ajaxDataType': 'json',
      	 	'width':280, 
      	 	'itemHeight': 20,
      	 	'listStyle': 'custom',
      	 	'maxHeight': 480,
      	 	'emphasis':true,
      	 	'createItemHandler': function(index, data){   
      	 		return "<span style='color:green;'>--"+data['name']+"--"+data['value']+"---"+data["id"]+"</span>";
      		}//end   createItemHandler
  	 		,'emphasisHandler':function (keyword,data){
  	 		 	var regex = RegExp("("+keyword.replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1")+")", 'ig');
             	data['name'] = data['name'].replace(regex, "<span style='font-weight:bold;color:blue;'>$1</span>");
  	 		}
  		}).AutoComplete('show');
   		
    }); 

     
  </script> -->

<body>

 <div id="preview_wrapper"> 
        <div id="preview_fake"> 
            <img id="preview" onload="onPreviewLoad(this)"/> 
        </div> 
    </div> 
    <br/> 
    <input id="upload_img" type="file" onchange="onUploadImgChange(this)"/> 
    <br/> 
    <img id="preview_size_fake"/> 


<!-- 
 <form id="form1" >
	    <div>
		    <center>
		    请输入“开”或“电”
		        <input id="text" value=""/>
		    </center>
	    </div>
   	</form> -->
</body>

</html>
