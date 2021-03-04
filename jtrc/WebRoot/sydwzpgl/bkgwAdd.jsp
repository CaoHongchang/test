<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>报考活动列表新增</title>
</head>
<script type="text/javascript">

</script>
<body>
	<div data-options="region:'north',border:false" style="padding:5px">
       <table>
       	  <tr height="30">
       	  	<td width="140">报名费活动编码:</td>
       	  	<td id="bkgw_activity_pno" width="100" align="left"></td>
       	  	<td width="100" >报考活动名称:</td>
       	  	<td id="bkgw_activity_pname" width="220" align="left"></td>
       	  </tr>
	      <tr>
			 <td>岗位代码或岗位名称:</td>
			 <td colspan="3">
			 	<input id="selectGWtextbox" name="selectAddEnterprise" class="easyui-textbox" style="width:320px; margin-right: 20px" />
			 	<input type="hidden" id="bkgw_search_activityEnterpriseId" name="activityEnterpriseId"  data-options="required:true" />
			 	<a  onclick="selectGW()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			 </td>
		  </tr>
	   </table>
   </div>
   <div data-options="region:'center',,border:false" style="">
   		<div>
   			<div title="已选岗位列表" style="float: left;width: 355px;height: 400px;">
   				<table id="yxgwxqGrid" style="height: 95%" title="已选岗位列表"></table>
   			</div>
   			<div style="float: left;width: 45px;height: 100px; padding: 100px 5px 0px 5px">
			 	<a onclick="delGW()" class="easyui-linkbutton" data-options="iconCls:'icon-del'">→</a>
   			</div>
   			<div title="可选岗位列表" style="float: left;width: 355px;height: 400px;">
   			<table id="kxgwxqGrid" style="height: 95%" title="可选岗位列表"></table>
   			</div>
   		</div>
   		<div id="aa" class="easyui-accordion" style="height:320px; width:780px"> 
	   		<div title="岗位需求" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="padding:10px;">
	   		<form action="../bgEnterprisePlaceInfo/add" id="fm_gw" method="post">
	   			<input type="hidden" id="bkgw_activityEnterpriseId" name="activityEnterpriseId"  data-options="required:true" />
	   			<input type="hidden" id="bkgw_placeId" name="placeId"  data-options="required:true" />
	   			<input type="hidden" id="bkgw_id" name="id" />
	   			<table>
		       	  <tr height="35">
		       	  	<td width="140">招考人数:</td>
		       	  	<td width="100" align="left">
		       	  		<input class="easyui-numberbox" id="recruitmentNum" name="recruitmentNum"  style="width: 120px" data-options="required:true" />
		       	  	</td>
		       	  	<td width="100" >年龄要求:</td>
		       	  	<td width="220" align="left"><input class="easyui-textbox" id="ageRange" name="ageRange" value="不限" style="width: 120px" data-options="required:true" /></td>
		       	  	<td width="140">性别要求:</td>
		       	  	<td width="100" align="left">
		       	  		<select id="genderRange"  name="genderRange" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="不限">不限</option>   
					        <option value="男">男</option>
					        <option value="女">女</option>
				        </select>
		       	  	</td>
		       	  </tr>
		       	  <tr height="35">
		       	  	<td>民族要求:</td>
		       	  	<td align="left">
		       	  		<select id="nationRange" name="nationRange" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="不限">不限</option>   
									<option value="汉族">汉族</option>
                                    <option value="满族">满族</option>
                                    <option value="侗族">侗族</option>
                                    <option value="瑶族">瑶族</option>
                                    <option value="白族">白族</option>
                                    <option value="土家族">土家族</option>
                                    <option value="哈尼族">哈尼族</option>
                                    <option value="哈萨克族">哈萨克族</option>
                                    <option value="傣族">傣族</option>
                                    <option value="黎族">黎族</option>
                                    <option value="傈僳族">傈僳族</option>
                                    <option value="佤族">佤族</option>
                                    <option value="畲族">畲族</option>
                                    <option value="高山族">高山族</option>
                                    <option value="拉祜族">拉祜族</option>
                                    <option value="水族">水族</option>
                                    <option value="东乡族">东乡族</option>
                                    <option value="纳西族">纳西族</option>
                                    <option value="景颇族">景颇族</option>
                                    <option value="柯尔克孜族">柯尔克孜族</option>
                                    <option value="土族">土族</option>
                                    <option value="达斡尔族">达斡尔族</option>
                                    <option value="仫佬族">仫佬族</option>
                                    <option value="羌族">羌族</option>
                                    <option value="布朗族">布朗族</option>
                                    <option value="撒拉族">撒拉族</option>
                                    <option value="毛难族">毛难族</option>
                                    <option value="仡佬族">仡佬族</option>
                                    <option value="锡伯族">锡伯族</option>
                                    <option value="阿昌族">阿昌族</option>
                                    <option value="普米族">普米族</option>
                                    <option value="塔吉克族">塔吉克族</option>
                                    <option value="怒族">怒族</option>
                                    <option value="乌孜别克族">乌孜别克族</option>
                                    <option value="俄罗斯族">俄罗斯族</option>
                                    <option value="鄂温克族">鄂温克族</option>
                                    <option value="崩龙族">崩龙族</option>
                                    <option value="保安族">保安族</option>
                                    <option value="裕固族">裕固族</option>
                                    <option value="京族">京族</option>
                                    <option value="塔塔尔族">塔塔尔族</option>
                                    <option value="独龙族">独龙族</option>
                                    <option value="鄂伦春族">鄂伦春族</option>
                                    <option value="赫哲族">赫哲族</option>
                                    <option value="门巴族">门巴族</option>
                                    <option value="珞巴族">珞巴族</option>
                                    <option value="基诺族">基诺族</option>
                                    <option value="蒙古族">蒙古族</option>
                                    <option value="回族">回族</option>
                                    <option value="藏族">藏族</option>
                                    <option value="维吾尔族">维吾尔族</option>
                                    <option value="苗族">苗族</option>
                                    <option value="彝族">彝族</option>
                                    <option value="壮族">壮族</option>
                                    <option value="布依族">布依族</option>
                                    <option value="布依族">朝鲜族</option>
                                    <option value="布依族">其他</option>
                                    <option value="布依族">外国血统</option>
				        </select>
		       	  	</td>
		       	  	<td>政治面貌要求:</td>
		       	  	<td align="left">
		       	  		<select id="politicalStatusRange" name="politicalStatusRange" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="不限">不限</option>   
					        <option value="党员">中共党员</option>
					        <option value="团员">共青团员</option>
				        </select>
		       	  	</td>
		       	  	<td>文化程度要求:</td>
		       	  	<td align="left">
		       	  		<select id="educationRange" name="educationRange" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="不限">不限</option>   
					        <option value="博士">博士</option>
					        <option value="硕士">研究生及以上</option>
					        <option value="本科">本科及以上</option>
					        <option value="大专">大专及以上</option>
				        </select>
		       	  	</td>
		       	  </tr>
		       	  <tr height="35">
		       	  	<td>学位要求:</td>
		       	  	<td align="left">
		       	  		<select id="schoolRange" name="schoolRange" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="不限">不限</option>   
					        <option value="学士">学士及以上</option>
					        <option value="硕士">硕士及以上</option>
					        <option value="博士">博士</option>
				        </select>
		       	  	</td>
		       	  	<td>学历类型要求:</td>
		       	  	<td align="left">
		       	  		<select id="educationTypeRange" name="educationTypeRange" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="不限">不限</option>   
					        <option value="全日制">全日制</option>
					        <option value="全日制普通高等院校">全日制普通高等院校</option>
				        </select>
		       	  	</td>
		       	  	<td>专业要求:</td>
		       	  	<td align="left"><input class="easyui-textbox" name="professionRange" id="professionRange" value="不限" style="width: 120px" data-options="required:true,validType:'length[1,200]'" /></td>
		       	  </tr>
		       	  <tr height="35">
		       	  	<td>试卷类型:</td>
		       	  	<td align="left">
		       	  		<select  name="paperStyle" id="paperStyle" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="一类">一类</option>   
					        <option value="二类">二类</option>
				        </select>
		       	  	</td>
		       	  	<td>考试名称:</td>
		       	  	<td align="left"><input class="easyui-textbox" name="examinationName" id="examinationName" style="width: 120px" data-options="required:true" /></td>
		       	  	<td>考试地点:</td>
		       	  	<td align="left"><input class="easyui-textbox" name="examinationPlace" id="examinationPlace" style="width: 120px" data-options="required:true" /></td>
		       	  </tr>
		       	  <tr height="35">
		       	  	<td>考试科目:</td>
		       	  	<td align="left"><input class="easyui-textbox" name="examinationSubject" id="examinationSubject" style="width: 120px" data-options="required:true" /></td>
		       	  	<td>是否开考:</td>
		       	  	<td align="left">
		       	  		<select  name="isStart" id="isStart" class="easyui-combobox" data-options="required:true" style="width: 120px" data-options="required:true" >
					        <option value="是">是</option>   
					        <option value="否">否</option>
				        </select>
		       	  	</td>
		       	  	<td></td>
		       	  	<td></td>
		       	  </tr>
		       	  <tr height="35">
		       	  	<td>其他要求:</td>
		       	  	<td align="left" colspan="5"><input class="easyui-textbox" name="othersRange" id="othersRange"  value="不限" style="width: 450px" data-options="required:true" /></td>
		       	  </tr>
		       	  <tr height="35">
		       	  	<td>备注:</td>
		       	  	<td align="left" colspan="5"><input class="easyui-textbox" name="remark" id="remark" style="width: 450px"/></td>
		       	  </tr>
			   </table>
			</form>
	   		</div>
   		</div>
   </div>
</body>
</html>
