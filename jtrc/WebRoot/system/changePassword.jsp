<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
  </head>
  
  <body style="margin:1px">
     <form id="changPwdForm" >
         <input name="userId" type="text" hidden="hidden"/>
         <table style="margin:25px" height="150px">
             <tr>
                <td class="left">平台账号名称</td>
                <td class="right"><input name="userName" class="easyui-textbox" data-options="editable:false,readonly:true" size="30" style="height:30px;"/></td>
             </tr>
              <tr>
                <td class="left">新密码</td>
                <td class="right"><input name="newpassword" value="0591968980" class="easyui-textbox" data-options="required:true" size="30" type="password" style="height:30px"/></td>
             </tr>
         </table>
     </form>  
  </body>
</html>
