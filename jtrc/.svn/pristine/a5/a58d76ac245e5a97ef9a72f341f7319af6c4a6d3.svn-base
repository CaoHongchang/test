<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
    <script>

        $(function () {
            
            //设置text需要验证
            $('input[type=text]').validatebox();
        })
    
    </script>
</head>
<body>
  <form id="ff" runat="server" method="post">
        <div id="content" style="margin-left:50px;">
        <table style="width:300px;" id="uniform">
        <tr>
            <td>书画名称：<input id="paintingName" class="easyui-validatebox" validType:'paintingName' type="text" name="paintingName" data-options="required:true"/></td>
        </tr> 
        <tr>
            <td>书画类别：<input id="radPaint" value="国画" class="easyui-validatebox" name="type" type="radio" checked="checked" data-options="required:true" />国画
                <input id="rad" name="type" class="easyui-validatebox" type="radio" data-options="required:true" />书法</td>
        </tr>
        <tr>
            <td>书画作者：<asp:DropDownList ID="ddlist" runat="server" Width="155px"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>书画价格：<input id="price" class="easyui-numberbox" type="text" name="price" data-options="required:true"/>元</td>
        </tr>
        <tr>
            <td>高　　度：<input id="height" class="easyui-numberbox" type="text" name="height" data-options="required:true"/>cm</td>
        </tr>
        <tr>
            <td>
                宽　　度：<input id="width" class="easyui-numberbox" type="text" name="width" data-options="required:true"/>cm
            </td>
        </tr>
        <tr>
           <td class="left">选择图片:</td>
           <td class="right" colspan="3">
                 <input id="idFile" style="width: 224px" runat="server" name="pic" 
					onchange="javascript:setImagePreview(this,localImag,preview);"
					type="file" />
           </td>
        </tr>
       <tr>
           <td>
               预　　览:
                <div id="localImag" style="width: 300px; height: 200px;">
                    <img id="preview" alt="预览图片" onclick="over(preview,divImage,imgbig);" src="../../Paint/img/default.jpg" width="300" height="200"/>
                </div>
           </td>
       </tr>
    </table>
        <input type="hidden" id="test" name="test" /> 
        <div style="width:300px; text-align:center;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">确定</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取消</a>
        </div> 
        <%--显示大图标的区域--%>  
        <div id="divImage" style="display: none;left:365px;top:40px;position: absolute">  
            <img id="imgbig" onclick="out();" src="" alt="大图" />  
        </div>  
    </div>
    </form>
 <!-- 
    邮箱验证：<input type="text" validtype="email" required="true" missingMessage="不能为空" invalidMessage="邮箱格式不正确" /><br />
    网址验证：<input type="text" validtype="url" invalidMessage="url格式不正确[http://www.example.com]" /><br />
    长度验证：<input type="text" validtype="length[8,20]" invalidMessage="有效长度8-20" /><br />
    手机验证：<input type="text" validtype="mobile"  /><br />
    邮编验证：<input type="text" validtype="zipcode" /><br />
    账号验证：<input type="text" validtype="account[8,20]" /><br />
    汉子验证：<input type="text" validtype="CHS" /><br />
    远程验证：<input type="text" validtype="remote['checkname.aspx','name']" invalidMessage="用户名已存在"/>
     -->
     
     <script>
    //检查图片的格式是否正确,同时实现预览
    function setImagePreview(obj, localImagId, imgObjPreview) {
        var array = new Array('gif', 'jpeg', 'png', 'jpg', 'bmp'); //可以上传的文件类型
        if (obj.value == '') {
            $.messager.alert("让选择要上传的图片!");
            return false;
        }
        else {
            var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用 
            ////布尔型变量
            var isExists = false;
            //循环判断图片的格式是否正确
            for (var i in array) {
                if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
                    //图片格式正确之后，根据浏览器的不同设置图片的大小
                    if (obj.files && obj.files[0]) {
                        //火狐下，直接设img属性 
                        imgObjPreview.style.display = 'block';
                        imgObjPreview.style.width = '400px';
                        imgObjPreview.style.height = '400px';
                        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
                        imgObjPreview.src = window.URL.createObjectURL(obj.files[0]);
                    }
                    else {
                        //IE下，使用滤镜 
                        obj.select();
                        var imgSrc = document.selection.createRange().text;
                        //必须设置初始大小 
                        localImagId.style.width = "400px";
                        localImagId.style.height = "400px";
                        //图片异常的捕捉，防止用户修改后缀来伪造图片 
                        try {
                            localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                        }
                        catch (e) {
                            $.messager.alert("您上传的图片格式不正确，请重新选择!");
                            return false;
                        }
                        imgObjPreview.style.display = 'none';
                        document.selection.empty();
                    }
                    isExists = true;
                    return true;
                }
            }
            if (isExists == false) {
                $.messager.alert("上传图片类型不正确!");
                return false;
            }
            return false;
        }
    }

        //显示图片  
        function over(imgid, obj, imgbig) {
            //大图显示的最大尺寸  4比3的大小  400 300  
            maxwidth = 400;
            maxheight = 300;

            //显示  
            obj.style.display = "";
            imgbig.src = imgid.src;

            //1、宽和高都超过了，看谁超过的多，谁超的多就将谁设置为最大值，其余策略按照2、3  
            //2、如果宽超过了并且高没有超，设置宽为最大值  
            //3、如果宽没超过并且高超过了，设置高为最大值  

            if (img.width > maxwidth && img.height > maxheight) {
                pare = (img.width - maxwidth) - (img.height - maxheight);
                if (pare >= 0)
                    img.width = maxwidth;
                else
                    img.height = maxheight;
            }
            else if (img.width > maxwidth && img.height <= maxheight) {
                img.width = maxwidth;
            }
            else if (img.width <= maxwidth && img.height > maxheight) {
                img.height = maxheight;
            }
        }


        //隐藏图片 &nbsp;
        function out() {
             document.getElementById('divImage').style.display = "none";
        }

         //保存信息
                function submitForm() {
                    $.messager.confirm('提示', '你确定要添加此记录吗？', function (r) {
                        if (r) {
                            //先上传图片后，再提交
                            upLoadFile();

                            var test = document.getElementById("test").value = "add";
                            var paintingName = document.getElementById("paintingName").value;
                            var artistID = document.getElementById("ddlist").value;
                            var type = $(":checkbox[name='type']").attr("checked") == true ? "书法" : "国画";
                            var price = document.getElementById("price").value;
                            var height = document.getElementById("height").value;
                            var width = document.getElementById("width").value;
                            var idFile = document.getElementById("idFile").value;

                            //先判断是否上传图片之后在提交

                            $('#ff').form('submit', {
                                url: "Painting.ashx?paintingName=" + paintingName + "&artistID=" + artistID +
                                     "&type=" + type + "&price=" + price + "&height=" + height + "&width=" + width +
                                    "&idFile=" + idFile + "&addID=" + addID + "&test=" + test,
                                dataType: "json",
                                onSubmit: function () {
                                    return $(this).form('validate');
                                },
                                success: function (result) {
                                    if (result == "T") {
                                        //清空文本框
                                        document.getElementById("paintingName").value = "";
                                        document.getElementById("price").value = "";
                                        document.getElementById("height").value = "";
                                        document.getElementById("width").value = "";
                                        document.getElementById("idFile").value = "";
                                        document.getElementById("preview").value = "";
                                        $.messager.alert('提示', '恭喜您，信息添加成功！', 'info');
                                    }
                                    else {
                                        $.messager.alert('提示', '保存失败，请您核对！', 'info');
                                    }
                                }
                            });
                        }
                    });
                }

                //上传图片
                function upLoadFile() {
                    var idFile = document.getElementById("idFile").value;
                    //判断是否选择图片
                    if (idFile == null || idFile == "") {
                        $.messager.alert('提示','请添加图片!');
                        document.getElementById("idFile").focus();
                        document.getElementById("idFile").select();
                        return;
                    }
                    var options = {
                        type: "POST",
                        url: 'Files.ashx',
                        //success: showResponse
                    };
                    // 将options传给ajaxForm
                    $('#ff').ajaxSubmit(options);
                }
                //function showResponse() {
                //    alert("上传成功!");
                //}


                function clearForm(){
                   //清空文本框
                   document.getElementById("paintingName").value = "";
                   document.getElementById("price").value = "";
                   document.getElementById("height").value = "";
                   document.getElementById("width").value = "";
                   document.getElementById("idFile").value = "";
                 }
</script>
</body>
</html>