<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>商家管理</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script src="<%=request.getContextPath()%>/data/date.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/all.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ps/sjgl.js"></script>
<script>
     var where = new Array(35);
        function comefrom(loca, locacity) { this.loca = loca; this.locacity = locacity; }
        where[0] = new comefrom("请选择省份名", "请选择城市名");
        where[1] = new comefrom("北京", "|东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆");  
        where[2] = new comefrom("上海", "|黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明"); 
        where[3] = new comefrom("天津", "|和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县");
        where[4] = new comefrom("重庆", "|万州|涪陵|渝中|大渡口|江北|沙坪坝|九龙坡|南岸|北碚|万盛|双挢|渝北|巴南|黔江|长寿|綦江|潼南|铜梁|大足|荣昌|壁山|梁平|城口|丰都|垫江|武隆|忠县|开县|云阳|奉节|巫山|巫溪|石柱|秀山|酉阳|彭水|江津|合川|永川|南川");
        where[5] = new comefrom("河北", "|石家庄|邯郸|邢台|保定|张家口|承德|廊坊|唐山|秦皇岛|沧州|衡水");
        where[6] = new comefrom("山西", "|太原|大同|阳泉|长治|晋城|朔州|吕梁|忻州|晋中|临汾|运城");
        where[7] = new comefrom("内蒙古", "|呼和浩特|包头|乌海|赤峰|呼伦贝尔盟|阿拉善盟|哲里木盟|兴安盟|乌兰察布盟|锡林郭勒盟|巴彦淖尔盟|伊克昭盟");
        where[8] = new comefrom("辽宁", "|沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛");
        where[9] = new comefrom("吉林", "|长春|吉林|四平|辽源|通化|白山|松原|白城|延边");
        where[10] = new comefrom("黑龙江", "|哈尔滨|齐齐哈尔|牡丹江|佳木斯|大庆|绥化|鹤岗|鸡西|黑河|双鸭山|伊春|七台河|大兴安岭");
        where[11] = new comefrom("江苏", "|南京|镇江|苏州|南通|扬州|盐城|徐州|连云港|常州|无锡|宿迁|泰州|淮安");
        where[12] = new comefrom("浙江", "|杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水");
        where[13] = new comefrom("安徽", "|合肥|芜湖|蚌埠|马鞍山|淮北|铜陵|安庆|黄山|滁州|宿州|池州|淮南|巢湖|阜阳|六安|宣城|亳州");
        where[14] = new comefrom("福建", "|福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德");
        where[15] = new comefrom("江西", "|南昌市|景德镇|九江|鹰潭|萍乡|新馀|赣州|吉安|宜春|抚州|上饶");
        where[16] = new comefrom("山东", "|济南|青岛|淄博|枣庄|东营|烟台|潍坊|济宁|泰安|威海|日照|莱芜|临沂|德州|聊城|滨州|菏泽");
        where[17] = new comefrom("河南", "|郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源");
        where[18] = new comefrom("湖北", "|武汉|宜昌|荆州|襄樊|黄石|荆门|黄冈|十堰|恩施|潜江|天门|仙桃|随州|咸宁|孝感|鄂州");
        where[19] = new comefrom("湖南", "|长沙|常德|株洲|湘潭|衡阳|岳阳|邵阳|益阳|娄底|怀化|郴州|永州|湘西|张家界");
        where[20] = new comefrom("广东", "|广州|深圳|珠海|汕头|东莞|中山|佛山|韶关|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|潮州|揭阳|云浮");
        where[21] = new comefrom("广西", "|南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|南宁地区|柳州地区|贺州|百色|河池");
        where[22] = new comefrom("海南", "|海口|三亚");
        where[23] = new comefrom("四川", "|成都|绵阳|德阳|自贡|攀枝花|广元|内江|乐山|南充|宜宾|广安|达川|雅安|眉山|甘孜|凉山|泸州");
        where[24] = new comefrom("贵州", "|贵阳|六盘水|遵义|安顺|铜仁|黔西南|毕节|黔东南|黔南");
        where[25] = new comefrom("云南", "|昆明|大理|曲靖|玉溪|昭通|楚雄|红河|文山|思茅|西双版纳|保山|德宏|丽江|怒江|迪庆|临沧");
        where[26] = new comefrom("西藏", "|拉萨|日喀则|山南|林芝|昌都|阿里|那曲");
        where[27] = new comefrom("陕西", "|西安|宝鸡|咸阳|铜川|渭南|延安|榆林|汉中|安康|商洛");
        where[28] = new comefrom("甘肃", "|兰州|嘉峪关|金昌|白银|天水|酒泉|张掖|武威|定西|陇南|平凉|庆阳|临夏|甘南");
        where[29] = new comefrom("宁夏", "|银川|石嘴山|吴忠|固原");
        where[30] = new comefrom("青海", "|西宁|海东|海南|海北|黄南|玉树|果洛|海西");
        where[31] = new comefrom("新疆", "|乌鲁木齐|石河子|克拉玛依|伊犁|巴音郭勒|昌吉|克孜勒苏柯尔克孜|博尔塔拉|吐鲁番|哈密|喀什|和田|阿克苏");
        where[32] = new comefrom("香港", "");
        where[33] = new comefrom("澳门", "");
        where[34] = new comefrom("台湾", "|台北|高雄|台中|台南|屏东|南投|云林|新竹|彰化|苗栗|嘉义|花莲|桃园|宜兰|基隆|台东|金门|马祖|澎湖");
        where[35] = new comefrom("其它", "|北美洲|南美洲|亚洲|非洲|欧洲|大洋洲");
    $(function() {

	//alert("dd");
	//$('#addNotice1').hide();
	//$('#addNotice2').hide();
	//$('#addNotice3').hide();
	init();
	   var url = "../user/shopinit";
	$.post(url,null,function(data){
		 $("#sjlb1").empty();
		 $("#sjlb1").append("<option value=''>全部</option>");
		 $.each(data,function(index,item){  		   
			$("#sjlb1").append("<option value='"+item.id+"'>"+item.title+" </option>");
		 });
	},"json");
	$('#noticeGt').click(function() {
		
	    init();

	});
	
	 
});
function init(){



	var url = "../game.php?doAction=act_popri";
	$.post(url,null,function(data){
		if(data.flag7==10){
			
			$('#addNotice1').show();
			
			
		}
		if(data.flag8==11){
			$('#addNotice2').show();
			
			
		}
		if(data.flag9==12){
			$('#addNotice3').show();
		}
	},"json");
	
var url = "../user/shopinfo?name="+$('#name1').val()+"&type="+$("#sjlb1").val()+"&tel="+$("#tel1").val()+"&sstate="+$('#shopstate').val();
//alert(url);
$('#noticeRs').datagrid({
	 fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	url:url,
	fitColumns:false,
	pagination:true,
	columns:[[
	            {field:'id',checkbox:true},
	            {title:'商家编号',field:'pno',width:60,align:'center'},
	            {title:'商家名称',field:'name',width:60,align:'center'},	
	    		{title:'商家类别',field:'type',width:150,align:'center'},
	            {title:'商家客服电话',field:'tel',width:60,align:'center'},
				{title:'商家地址',field:'adr',width:100,align:'center'},
				{title:'商家联系人',field:'bcontact',width:100,align:'center'},
				{title:'商家logo',field:'logo',width:100,align:'center', formatter:function(value,row,index){return '<img src="'+row.logo+'" width="100px" height="50px"   onmouseover=ShowDiv("'+row.logo+'") onmouseout=HidDiv() />';}},
				{title:'商家排序',field:'seq',width:100,align:'center'},
				{title:'身份证正面',field:'idcardfront',width:100,align:'center', formatter:function(value,row,index){return '<img src="'+row.idcardfront+'"  width="100px" height="50px" onmouseover=ShowDiv("'+row.idcardfront+'")  onmouseout=HidDiv() />';}},
				{title:'身份证反面',field:'idcardback',width:100,align:'center', formatter:function(value,row,index){return '<img src="'+row.idcardback+'"  width="100px" height="50px" onmouseover=ShowDiv("'+row.idcardback+'")  onmouseout=HidDiv() />';}},
				{title:'申请人姓名',field:'sname',width:100,align:'center'},
				{title:'商家线下兑换地址',field:'adr_offline',width:100,align:'center'},
				{title:'商家线下兑换电话',field:'tel_offline',width:100,align:'center'},
				{title:'商家所在省',field:'provice',width:100,align:'center'},
				{title:'商家所在市',field:'city',width:100,align:'center'},
				{title:'商家状态',field:'sstate',width:100,align:'center'},
				{title:'人民币余额',field:'rmb',width:100,align:'center'},
				{title:'点币数',field:'dpoint',width:100,align:'center'}
			]],
			singleSelect: false,
			selectOnCheck: true,
			checkOnSelect: true,
			onLoadSuccess:function(data){ 
			
			if(data){
			$.each(data.rows, function(index, item){
			if(item.checked){
				$('#noticeRs').datagrid('checkRow', index);
			}
			
			});
			}
			}

});
	
}

function publicNotice(){
	$('#w2').window('open');
	$('#nId').val("");
	$('#name2').val("");
    $('#tel').val("");
    $('#adr').val("");
    $('#adr_offline').val("");
    $('#tel_offline').val("");
    $('#province').val("");
    $('#city').val("");
    $('#rmb').val("");
    
    var url = "../user/shopinit";
	$.post(url,null,function(data){
		 $("#sjlb").empty();
		 $("#sjlb").append("<option value=''>全部</option>");
		 $.each(data,function(index,item){  		   
			$("#sjlb").append("<option value='"+item.id+"'>"+item.title+" </option>");
		 });
	},"json");
     
  
                var  length = where.length;
              
                for (k = 0; k < where.length; k++) { 
                
                  //alert(where[k].loca);
                $("#province").append("<option value='"+where[k].loca+"'>"+where[k].loca+" </option>");
                  
                }
                

                var loca3 = (where[0].locacity).split("|");
                for (l = 0; l < loca3.length; l++) { 
                $("#city").append("<option value='"+loca3[l]+"'>"+loca3[l]+" </option>");
                }
                

}
function select() {
   
                if($("#province").val()!='请选择省份名'){
                   $("#city").empty();
                   var loca2 = $("#province").val();
                  
                   for (i = 0; i < where.length; i++) {
                       if (where[i].loca == loca2) {
                       
                        //alert(loca2);
                       var  loca3 = (where[i].locacity).split("|");
                           for (j = 0; j < loca3.length; j++) { 
                           
                            $("#city").append("<option value='"+loca3[j]+"'>"+loca3[j]+" </option>");
                           } 
                            break;
                       }
                          
                       }
                }
     
}
function mdNotice(){
	
	    var url = "../user/shopinit";
	$.post(url,null,function(data){
		 $("#sjlb").empty();
		 $("#sjlb").append("<option value=''>全部</option>");
		 $.each(data,function(index,item){  		   
			$("#sjlb").append("<option value='"+item.id+"'>"+item.title+" </option>");
		 });
	},"json");
	   var  length = where.length;
              
           for (k = 0; k < where.length; k++) { 
           
             //alert(where[k].loca);
           $("#province").append("<option value='"+where[k].loca+"'>"+where[k].loca+" </option>");
             
           }
           

           var loca3 = (where[0].locacity).split("|");
           for (l = 0; l < loca3.length; l++) { 
           $("#city").append("<option value='"+loca3[l]+"'>"+loca3[l]+" </option>");
           }
	    
	$('#w2').window('open');
	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
	    $('#nId').val(row.id);
	    $('#name2').val(row.name);
	    $('#tel').val(row.tel);
	    $('#adr').val(row.adr);
	    $('#adr_offline').val(row.adr_offline);
	    $('#tel_offline').val(row.tel_offline);
	    $('#province').val(row.province);
	    $('#city').val(row.city);
	    $('#rmb').val(row.rmb);
	}
}
function delNotice(){

				
var ids="";
var rows = $('#noticeRs').datagrid('getSelections');
for(var i=0;i<rows.length;i++){

ids+=rows[i].id+",";
};     

 if (ids.length > 0) { 

        ids = ids.substr(0, ids.length - 1); 

    }
		//alert(row.id);
		
		var url = "../user/delshopinfo?ids="+ids;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
				init();
			}else{
				alert("发布失败！");
			}
		},"json");
	
}
function closeProduct(){
	$('#w2').window('close');
	init();
}
function saveOrUpdateProductNode(){
	var url;
	
	var isstate=14;
	var isSelected = $("#isstate2").attr("checked"); 
	if (isSelected )
		isstate = 15;
		
		if($('#name2').val()==""){
		
			    alert("请输入名称！");
				$('#name2').focus();
				return;
		}
		if($('#adr_offline').val()==""){
				alert("请输入商家线下兑换地址！");
				$('#adr_offline').focus();
				return ; 
			}
			if($('#adr').val()==""){
				alert("请输入商家地址！");
				$('#adr').focus();
				return ; 
			}
		if (isNaN($("#rmb").val())) {  
		    	alert("请正确输入数字！");
				$('#rmb').focus();
				return;
		    }  
		    if (!$("#tel").val().match(/^1[3|4|5|7|8]\d{9}$/)) { 
		alert("手机号码格式不正确！"); 
		$("#tel").focus(); 
		return ; 
	}
	 if (!$("#tel_offline").val().match(/^1[3|4|5|7|8]\d{9}$/)) { 
		alert("手机号码格式不正确！"); 
		$("#tel_offline").focus(); 
		return ; 
	}
	if ($("#sjlb").val()==0) {  
		    	alert("请选择商家类别！");
				$('#sjlb').focus();
				return;
		    }  
	if($('#nId').val()=="")
	   url = "../user/upshopinfo?name="+$('#name2').val()+"&type="+$('#sjlb').val()+"&tel="+$('#tel').val()+"&adr="+$('#adr').val()+"&adr_offline="+$('#adr_offline').val()+"&tel_offline="+$('#tel_offline').val()+"&province="+$('#province').val()+"&city="+$("#city").val()+"&rmb="+$("#rmb").val()+"&isstate="+isstate+"&id=0";
	else
	   url = "../user/upshopinfo?name="+$('#name2').val()+"&type="+$('#sjlb').val()+"&tel="+$('#tel').val()+"&adr="+$('#adr').val()+"&adr_offline="+$('#adr_offline').val()+"&tel_offline="+$('#tel_offline').val()+"&province="+$('#province').val()+"&city="+$("#city").val()+"&rmb="+$("#rmb").val()+"&isstate="+isstate+"&id="+$('#nId').val();
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("执行成功！");
			$('#w2').window('close');
			init();
			//$('#w2').window('close');
		}else{
			alert("执行失败！");
		}
	},"json");
}
    function qNotice(s){
    var row = $('#noticeRs').datagrid('getSelected');
		if (row){
	    
	    var  url="../user/upzshopinfo?id="+row.id+"&s="+s;
	    $.post(url,null,function(data){
		if(data.flag==1){
			alert("执行成功！");
			$('#w2').window('close');
			init();
			//$('#w2').window('close');
		}else{
			alert("执行失败！");
		}
	},"json");
	    }
    }
     function link(){
      var row = $('#noticeRs').datagrid('getSelected');
		if (row){
		   window.location.href="../ps/sjczcx.jsp?name="+row.name;
		}else{
		
		  alert("请选择记录");
		}
     }
       
function ShowDiv(url){


$('#tp').attr("src",url);
$("#mytips").css('display','block'); 
//$("#fade").css('display','block'); 


//$('#mytips').style.width = document.body.scrollWidth;
// bgdiv.style.height = $(document).height();
//$('#mytips').height($(document).height());


};
function HidDiv(){
$("#mytips").css('display','none'); 
}
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
document.getElementById(show_div).style.display='none';
document.getElementById(bg_div).style.display='none';
};
    </script>
</head>
<body class="easyui-layout">
	<input type="hidden" id="nId" />
	<div id="fade" class="black_overlay">
</div>
	<div id="mytips" class="white_content">
		<img id="tp" src="">
	</div>
	<div region="center" border="false" split="false"
		style="overflow:hidden;">
		<table class="table-edit" width="100%">
			<tr>

				<td align="right" nowrap="nowrap"><b>商家名称:</b></td>
				<td><input type="text" id="name1" name="name1" /></td>
				<td align="right" nowrap="nowrap"><b>商家类别:</b> <select
					id="sjlb1" style="width: 150px;">
						<option value="">全部</option>
				</select></td>

				<td align="right" nowrap="nowrap"><b>商家客服电话:</b></td>
				<td><input type="text" id="tel1" name="tel1" /></td>
				<td nowrap="nowrap"><b>商家状态:</b> <select id="shopstate">
						<option value="">全部</option>
						<option value="14">启用</option>
						<option value="15">不启用</option>
						<option value="16">删除</option>
				</select></td>
			</tr>
		</table>
		<div class="datagrid-toolbar">
			<a id="addNotice" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-add" onclick="init()">查询 </a> <a
				id="addNotice1" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-add" onclick="publicNotice()">新增 </a> <a
				id="addNotice2" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-undo" onclick="mdNotice()">修改 </a> <a
				id="addNotice3" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-remove" onclick="delNotice()">删除 </a> <a
				id="addNotice3" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-remove" onclick="qNotice('14')">启用</a> <a
				id="addNotice3" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-remove" onclick="qNotice('15')">不启用</a> <a
				id="addNotice3" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-remove" onclick="qNotice('17')">通过审核</a> <a
				id="addNotice3" href="#" align="center" class="easyui-linkbutton"
				plain="true" icon="icon-remove" onclick="link()">充值历史 </a>
		</div>
		<div class="easyui-layout" border="false" split="false"
			style="overflow:hidden;height:87%;">
			<div region="center" border="false" split="false">
				<table id="noticeRs" singleSelect="true"></table>
			</div>
		</div>
	</div>
	<div id="w2" class="easyui-window" closed="true" title="商家信息"
		iconCls="icon-save"
		style="width:300px;height:410px;padding:5px;background: #fafafa;">
		<div region="center" border="false"
			style="width:250px;height:300px;padding:10px;background:#fff;border:1px solid #ccc;">
			<table cellpadding=5>



				<tr>
					<td nowrap>
						<div align="right">商家名称：</div>
					</td>
					<td><input id="name2" name="name2" style="width:150px;"
						maxlength="50"></input></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家类别：</div>
					</td>
					<td><select id="sjlb">

					</select></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家客服电话：</div>
					</td>
					<td><input id="tel" name="tel" style="width:150px;"
						maxlength="50"></input></td>
				</tr>

				<tr>
					<td nowrap>
						<div align="right">商家地址：</div>
					</td>
					<td><input id="adr" name="adr" style="width:150px;"
						maxlength="50" /></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家线下兑换地址：</div>
					</td>
					<td><input id="adr_offline" name="adr_offline"
						style="width:150px;" maxlength="50" /></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家线下兑换电话：</div>
					</td>
					<td><input id="tel_offline" name="tel_offline"
						style="width:150px;" maxlength="50" /></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家所在省：</div>
					</td>
					<td><select id="province" name="province" onchange="select()"></select>
					</td>

				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家所在市：</div>
					</td>
					<td><select id="city" name="city"></select></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">人民币余额：</div>
					</td>
					<td><input id="rmb" name="rmb" style="width:150px;"
						maxlength="50" /></td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">商家状态：</div>
					</td>
					<td>启用<input id="isstate1" name="isstate" type="radio" checked
						value="0"> 不启用<input name="isstate" id="isstate2"
						type="radio" value="1">
					</td>
				</tr>
			</table>
		</div>
		<div region="south" border="false"
			style="text-align:right;line-height:30px;">
			<a id="add" class="easyui-linkbutton" iconCls="icon-ok"
				href="javascript:saveOrUpdateProductNode()">确定</a> <a
				class="easyui-linkbutton" iconCls="icon-cancel"
				href="javascript:closeProduct()">取消</a>
		</div>

	</div>
</body>
</html>