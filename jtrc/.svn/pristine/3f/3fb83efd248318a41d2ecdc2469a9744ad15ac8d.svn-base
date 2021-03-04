<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>申报审核</title>

<body>
<script type="text/javascript">
 $("#s_uid").val(sessionUserId);
 $("#sh_name").val(sessionRealName);

 function downFjFuc(){debugger;
     var url=$('#url').textbox('getValue');
     var r=GetFileExt(url);
     if(r==''||r==null){
       $.messager.alert('错误','文件有误无法下载！','error');
     }else{
         $.ajax({
    		url:basePath+"zcps/downFjExists",
    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
    	    data: {file:url},    //参数值
    	    type: "POST",   //请求方式
    	    success: function(data) {
    	    	var resObj = eval("("+data+")");
	            if(resObj.flag == '0'){
	            	 window.location.href=basePath+"zcps/downFjFuc?file="+url;
		        }else{
		        	 $.messager.alert('系统提示','下载失败，下载的文件有误或者不存在');
			    }
    	    },
    	    error: function() {
    	        //请求出错处理
    	    }
    	});
         
         
     
     }
     //
 
 }
//取文件后缀名
function GetFileExt(str) {
    if (str != "") {
       var index = str .lastIndexOf("\/");  
       str  = str.substring(index + 1, str.length);
       return str
    }
}

</script>
	<form id="fm" method="post">
	<input id="id" name="id" type="hidden"/>
	<input id="s_uid" name="s_uid" type="hidden"/>
    <div id="aa" class="easyui-accordion" style="height:250px;">   
       <div title="申报审核" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">姓名</td>
      <td class="right"><input id ="user_name" name="user_name" readonly="readonly" class="easyui-textbox" size="20"  style="height:22px" disabled="disabled"></td>
      <td class="left">性别</td>
      <td class="right"><input id ="sex"  name="sex" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
      </tr>
      <tr>
      <td class="left">身份证号</td>
      <td class="right"><input id="pNum" name="pNum" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
       <td class="left">出生年月</td>
      <td class="right"><input id="birthDate" name="birthDate" readonly="readonly" class="easyui-textbox"   size="20"  style="height:22px" disabled="disabled"></td>
      </tr>
      <tr>
      <td class="left">工作单位</td>
      <td class="right"><input id="workName" name="workName" readonly="readonly" class="easyui-textbox"  size="20"   style="height:22px" disabled="disabled"></td>
       <td class="left">参加工作时间</td>
      <td class="right"><input id="workTime" name="workTime" readonly="readonly" class="easyui-textbox"  size="20"   style="height:22px" disabled="disabled"></td>
      </tr>
      <tr>
      <td class="left">单位属性</td>
      <td class="right"><input id="sx" name="sx" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
      <td class="left">通讯地址</td>
      <td class="right"><input id="adr" name="adr" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
      </tr>
       <tr>
      <td class="left">专业技术职务</td>
      <td class="right"><input id="technical" name="technical" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
      <td class="left">电子邮箱</td>
      <td class="right"><input id="email" name="email" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
      </tr>
      <tr>
      <td class="left">证书编号</td>
      <td class="right"><input id="zsNo" name="zsNo" readonly="readonly" class="easyui-textbox"  size="20"  style="height:22px" disabled="disabled"></td>
      <td class="left">手机</td>
      <td class="right"><input readonly="readonly" class="easyui-textbox" id="tel" name="tel" size="20"  style="height:22px" disabled="disabled"></td>
      </tr>
      
         <tr>
      <td class="left">民族</td>
      <td class="right">
      <select id="mz" class="easyui-combobox" disabled="disabled" >
										<option value="请选择">请选择</option>
										<option value="汉族">汉族</option>
										<option value="壮族">壮族</option>
										<option value="满族">满族</option>
										<option value="回族">回族</option>
										<option value="苗族">苗族</option>
										<option value="维吾尔族">维吾尔族</option>
										<option value="土家族">土家族</option>
										<option value="彝族">彝族</option>
										<option value="蒙古族">蒙古族</option>
										<option value="藏族 ">藏族</option>
										<option value="布依族">布依族</option>
										<option value="侗族">侗族</option>
										<option value="瑶族">瑶族</option>
										<option value="朝鲜族">朝鲜族</option>
										<option value="白族">白族</option>
										<option value="哈尼族">哈尼族</option>
										<option value="哈萨克族">哈萨克族</option>
										<option value="黎族">黎族</option>
										<option value="傣族">傣族</option>
										<option value="畲族">畲族</option>
										<option value="傈僳族">傈僳族</option>
										<option value="仡佬族 ">仡佬族</option>
										<option value="东乡族">东乡族</option>
										<option value="高山族">高山族</option>
										<option value="拉祜族">拉祜族</option>
										<option value="水族">水族</option>
										<option value="佤族">佤族</option>
										<option value="纳西族">纳西族</option>
										<option value="羌族">羌族</option>
										<option value="土族">土族</option>
										<option value="仫佬族">仫佬族</option>
										<option value="锡伯族">锡伯族</option>
										<option value="柯尔克孜族">柯尔克孜族</option>
										<option value="达斡尔族">达斡尔族</option>
										<option value="景颇族">景颇族</option>
										<option value="毛南族">毛南族</option>
										<option value="撒拉族">撒拉族</option>
										<option value="塔吉克族">塔吉克族</option>
										<option value="阿昌族">阿昌族</option>
										<option value="普米族">普米族</option>
										<option value="鄂温克族">鄂温克族</option>
										<option value="怒族">怒族</option>
										<option value="京族">京族</option>
										<option value="基诺族">基诺族</option>
										<option value="德昂族">德昂族</option>
										<option value="保安族 ">保安族</option>
										<option value="俄罗斯族">俄罗斯族</option>
										<option value="裕固族">裕固族</option>
										<option value="乌兹别克族">乌兹别克族</option>
										<option value="门巴族">门巴族</option>
										<option value="鄂伦春族">鄂伦春族</option>
										<option value="独龙族">独龙族</option>
										<option value="塔塔尔族">塔塔尔族</option>
										<option value="赫哲族">赫哲族</option>
										<option value="珞巴族">珞巴族</option>
										<option value="布朗族">布朗族</option>

								</select>
      </td>
      <td class="left">单位所属地区</td>
      <td class="right"><input class="easyui-textbox" id="formPlace" name="formPlace"  size="20" style="height:22px" disabled="disabled"></td>
      </tr>
      
       <tr>
      <td class="left">取得时间</td>
      <td class="right"><input id="getTime" class="easyui-datetimebox" name="getTime" size="20" data-options="editable:false"  style="height:22px" disabled="disabled" /></td>
      <td class="left">邮政编码</td>
      <td class="right"><input class="easyui-textbox" id="zipCode" name="zipCode"  size="20" data-options="editable:false" style="height:22px" disabled="disabled"></td>
      </tr>
        <tr>
      <td class="left">固定电话</td>
      <td class="right"><input class="easyui-textbox" id="gTel" name="gTel"  size="20" data-options="editable:false" style="height:22px" disabled="disabled"></td>
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-textbox" id="qq" name="qq"  size="20" data-options="editable:false" style="height:22px" disabled="disabled"></td>
      </tr>
      
      </table>  
      </div>   
   
       </div>

       <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="学习经历" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="xxjlGrid"> </table>
              </div>
              </div>

        <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="工作经历" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="gzjlGrid"> </table>
              </div>
              </div>
              
        <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="继续教育" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="xxjyGrid"> </table>
              </div>
              </div>     
              
        <div id="sblw" class="easyui-accordion" style="height:200px;">   
       <div  title="申报论文" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="sblwGrid"> </table>
              </div>
              </div>  
              
       <div id="aa" class="easyui-accordion" style="height:310px;">   
       <div title="申报信息 " data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      
		  <td class="left">现专业技术职务</td>
		  <td class="right"><input id ="curPos"  name="curPos" class="easyui-textbox" size="20"   style="height:22px" disabled="disabled"></td>
		    <td class="left">现聘专业</td>
      <td class="right">
     			 <select class="easyui-combobox" id="zType" name="zType" style="width:135px;" disabled="disabled">
								<option value="交通专业">交通专业</option>
								<option value="非交通专业">非交通专业</option>
							</select>
      </td>
      </tr>
      <tr>
      
      <td class="left">聘任时间</td>
      <td class="right"><input id="prDate" name="prDate" class="easyui-datetimebox" size="20"  disabled="disabled"  style="height:22px"></td>
      <td class="left">现聘专业类别</td>
      <td class="right">
      
      <select class="easyui-combobox" id="xp_pro" name="xp_pro" disabled="disabled">
								<option value="交通运输工程">交通运输工程</option>
								<option value="汽车运输工程">汽车运输工程</option>
								<option value="船舶运输工程">船舶运输工程</option>
								<option value="道路与桥梁">道路与桥梁</option>
								<option value="隧道工程（含地质勘测）">隧道工程（含地质勘测）</option>
								<option value="港口及航道工程（含地质勘探、航标）">港口及航道工程（含地质勘探、航标）</option>
								<option value="交通通讯与导航技术">交通通讯与导航技术</option>
								<option value="交通安全监督（含救捞）">交通安全监督（含救捞）</option>
								<option value="筑养路设备应用与管理">筑养路设备应用与管理</option>
								<option value="港航设备应用与管理">港航设备应用与管理</option>
					</select>
      <div id="da"><input class="easyui-textbox"  id="xp_pro1" type="text" name="xpPro" disabled="disabled"/></div>
      </td>
      </tr>
      <tr>
      <td class="left">聘任年限</td>
      <td class="right"><input class="easyui-textbox" id="pTime" name="pTime" size="20"  style="height:22px" disabled="disabled"></td>
       <td class="left">外语是否免试</td>
      <td class="right">
		<input type="checkbox" class="regular-checkbox" id="isOther" name="isOther" value="是" disabled="disabled">
      </tr>
      <tr>
      <td class="left">现从事何专业技术工作</td>
      <td class="right"><input class="easyui-textbox" id="workNow" name="workNow" size="20"   style="height:22px" disabled="disabled"></td>
       <td class="left">获现资格以来完成继续教育总学时</td>
      <td class="right"><input class="easyui-textbox" id="workTime1" name="workTime1" size="20" disabled="disabled"  style="height:22px"></td>
      </tr>
      <tr>
       <td class="left">申报类别</td>
       <td class="right">	<select class="easyui-combobox" id="sType" name="sType" disabled="disabled" style="width:135px;">
								<option value="职称评审">职称评审</option>
								<option value="职称确认">职称确认</option>
							</select>
	  </td>
	  <td class="left">申报级别</td>
      <td class="right">	<select class="easyui-combobox" id="sLevel" name="sLevel" disabled="disabled" style="width:135px;">
								<option value="初级">初级</option>
								<option value="中级">中级</option>
								<option value="副高级" id="gj2">副高级</option>
								<option value="正高级" id="gj1">正高级</option>
								
							</select></td>
      </tr>
      <tr>
      
      <td class="left">申报资格名称</td>
      <td class="right"><input class="easyui-textbox" id="sName" name="sName"  size="20" disabled="disabled" style="height:22px"></td>
      
       <td class="left">申报属性</td>
      <td class="right"><input class="easyui-textbox" id="sId" name="sId" size="20" disabled="disabled" style="height:22px"></td>
      </tr>
       <tr>
     
      <td class="left">现档案存放单位</td>
      <td class="right"><input class="easyui-textbox" id="point" name="point" size="20" disabled="disabled" style="height:22px"></td>
      
        <td class="left">行政职务</td>
		  <td class="right"><input class="easyui-textbox" id="xzPos" name="xzPos" size="20" disabled="disabled" style="height:22px"></td>
      </tr>
      <tr>
		 <td class="left">申报专业</td>
		  <td class="right"><input class="easyui-textbox" id="sPro" name="sPro" size="20" disabled="disabled" style="height:22px"></td>
		  <td class="left"></td>
		  <td class="right"></td>
      </tr>
      
       <tr>
		  <td class="left">附件材料</td>
		  <td class="right">
		  <input id="url" name="url" disabled="disabled" class="easyui-textbox"  size="20"  style="height:22px">
		  
		   <a  onclick="downFjFuc();" class="easyui-linkbutton" data-options="iconCls:'',plain:false">下载附件</a>
		   
		  </td> 
	 	  <td class="left">外语成绩</td>
     	 <td class="right"><input class="easyui-textbox" disabled="disabled" name="jscore" id="jscore" /></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td class="right"><input id="wRemark" name="wRemark" disabled="disabled" class="easyui-textbox"  data-options="multiline:true"  size="20"  style="width:240px;height:62px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">年度考核</td>
      <td class="right"><input class="easyui-textbox" id="yearK" name="yearK" size="20" data-options="multiline:true"  disabled="disabled" style="width:240px;height:62px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      </table> 
      </div>
      </div>  
      

      <div id="zcpssbshDiv" class="easyui-accordion" style="height:200px;">   
  
       <div title=" " data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      <td class="left">审核人</td>
      <td class="right"><input id ="sh_name" name="sh_name" disabled="true" class="easyui-textbox" size="50"  data-options="required:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      <tr>
      <td class="left">审核状态</td>
      <td class="right">
      <select id="cc" class="easyui-combobox" name="sState" name="sState" size="50" style="width:200px;"> 
        <option value="0">未审核</option>  
        <option value="1">审核通过</option>   
        <option value="2">审核不通过</option>
     </select> 
      </td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      <tr>
      <td class="left">审核说明</td>
      <td class="right"><input class="easyui-textbox" data-options="multiline:true" id="remark_info" name="remark_info"  size="50" data-options=""  style="height:52px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
      </table> 
      <font style="margin-left: 135px" color="gray">审核说明限制在300字之内</font>
       </div>
       </div>          
                        
    </form> 

</body>

</html>