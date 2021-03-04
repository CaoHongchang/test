<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>员工查看</title>

<body>

	<form id="fm" method="post">

    <div id="aa" class="easyui-accordion" style="height:550px;">   
       <div title="申报审核" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">企业性质</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
	</td>
      <td class="left">组织机构代码</td>
      <td class="right"><input id ="zhmc2"  class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">单位</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select></td>
       <td class="left">身份证</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true"  style="height:22px"></td>
       <td class="left">出生年月</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true"  style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">性别</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      <td class="left">现档案所在地</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
      <td class="left">参加工作时间</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">民族</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      <tr>
      <td class="left">用工形式</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      <td class="left">政治面貌</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">毕业时间</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">所学专业</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">文化程度</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">户籍地</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">联系地址</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">固定电话</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">手机号码</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">户籍性质</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
        <tr>
      <td class="left">户籍所在地</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      <td class="left">开户银行</td>
      <td class="right">
      <select  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">银行帐号</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">技术职称</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">职业等级</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">执（职）业资格</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">获取时间</td>
      <td class="right"><input class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      </table>  
      </div>   
   
       </div>

       <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="劳动合同签订期限" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="ldhtGrid" >  </table>
             
              
              </div>
              </div>

             
    </form> 

</body>

</html>
