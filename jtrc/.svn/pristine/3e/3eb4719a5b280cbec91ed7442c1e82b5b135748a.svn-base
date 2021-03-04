<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>成绩导入</title>

<body>

   <script type="text/javascript">
   </script>
<div id="ddd">
 <c:forEach var="bm" items="${bmList}"  varStatus="item_index">
<table  style="text-align:center; width:90%; empty-cells:show; border-collapse: collapse; margin:0 auto;border:0px solid #000000;font-size: 24px ">
<tr style="text-align:center;height:40px;font-size:22px;">
<td colspan="6"  ><h1 style="font-size: 16px">福建省成人高等学校招生考试报名表</h1></td>
</tr>
<tr style="height:40px;" >
<td style="font-size: 16px">▲考区名称</td>
<td style="font-size: 16px">${bm.ckkqAddress} </td>
<td style="font-size: 16px">▲考场确认点</td>
<td style="font-size: 16px">${bm.kqAddress}</td> 
<td>
</td>
</tr>
 <tr style="height:40px;">
<td style="font-size: 16px">▲填表时间</td>
<td style="font-size: 16px">${bm.addDate}</td>
<td style="font-size: 16px">▲考生籍贯</td>
<td style="font-size: 16px"> ${bm.jgName}</td>
<td style="font-size: 16px">▲报名ID</td>
<td style="font-size: 16px">${bm.id}</td>
</tr> 
</table>
<table style="text-align:center; width:95%;height:400px; table-layout:fixed; empty-cells:show; border-collapse: collapse; margin:0 auto;border:1px solid #000000;" > 

<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">姓名</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.name}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">性别</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.sex}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">民族</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.mz}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">出生日期</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.birthDate}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">考生特征</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.ksTz}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">政治面貌</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.zzmm}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">最后学历</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.highestDegree}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">QQ号</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.qq}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">工作时间</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.workTime}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">证件类型</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">身份证</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">证件号</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px" colspan="3">${bm.pnum}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">毕业院校</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.school}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">毕业证号</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px" colspan="3">${bm.graduationNum}</td> 
</tr>
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">固定电话</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.gTel}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">手机</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.tel}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">微信号</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.wx}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">工作单位</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px" colspan="3">${bm.workName}</td>  
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">职业类别</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.teLevel}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">通讯地址</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px" colspan="3">${bm.adr}</td>  
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">邮编</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.zipCode}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">身份证地址</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px" colspan="3">${bm.address}</td>  
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">邮编</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.zipCode}</td> 
</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">报考院校</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.educationSchool}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">报考专业</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px" colspan="3">${bm.educationMajor}</td> 

</tr> 
<tr style="height:30px;"> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">招生类别</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.zslb}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">报考层次</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.registerLevel}</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">报考科类</td> 
<td style="border:1px solid #000000; padding:0 1em 0;height:30px;font-size: 16px">${bm.bkkm}</td> 
</tr> 
</table> 
 <br/>	
</c:forEach>	
</div>
</body>

</html>
