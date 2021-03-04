/*
 * 手机验证  （11位数字，且1开头）
 */
function Tel_Validation(tel){
	var re =/^1[3|4|7|8|5]\d{9}$/;
	return re.test(tel);
}
/*
 * 固定电话验证 
 */
function HomeTel_Validation(homeTel){
	var re = /^0\d{2,4}-\d{5,9}$/;
	return re.test(homeTel);
}
/*
 * 证书编号验证（只能输入字母或者数字）
 * */
function  Zno_Validation(Zno){
	var re=/^[0-9a-zA-Z]{1,30}$/;
	return re.test(Zno);
}
/*
 * wx验证（只能输入字母或者数字-.）
 * */
function  Wx_Validation(WX){
	var re=/^[a-zA-Z\d_]{5,}$/;
	return re.test(WX);
}
/*
 * QQ验证只能数字
 */
function QQ_Validation(QQ){
	var re=/^[0-9]*$/;
	return re.test(QQ);
}

function Score_Validation(Score){
	var re=/^(([1-9]{0,1}[0-9]|1[0-4][0-9])(\.[0-9])?|150(\.0)?)$/;
	return re.test(Score);
}

/*
 * 
 */
function cCode_Validation(cCode){
	var re=/^[a-zA-Z0-9]{5,25}$/;
	return re.test(cCode);
}


function enterpriseCode_Validation(enterpriseCode){
	var re=/^[0-9][0-9][0-9]$/;
	return re.test(enterpriseCode);
}

/*
 * 邮政编码
 */
function Post_Validation(post){
	var re= /^[1-9][0-9]{5}$/;
	return re.test(post);
}

/*
 * 身份证号
 */
function Card_Validation(card){
	var re = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	return re.test(card);
}

/*
 * 姓名
 */
function Name_Validation(name){
	var re = /^[a-zA-Z.\u4e00-\u9fa5\d]{2,15}$/;
	return re.test(name);
}

/*
 * 备注
 */
function Remark_Validation(remark){
	var re = /^[a-zA-Z.\u4e00-\u9fa5]{0,150}$/;
	return re.test(remark);
}

/*
 * 邮箱
 */
function Mail_Validation(mail){
	var re = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	return re.test(mail);
}

/*
 * 数字验证
 */
function Num_Validation(num){
	var re = /^[\d+.+\d]{1,9}$/;
	return re.test(num);
}

/*
 * 批准文号
*/
function Pzmo_Validation(pZno){
	var re=/^[0-9a-zA-Z()（）]{1,30}$/;
	return re.test(pZno);
}
/*
*快递单号
**/
function Kpno_Validation(kpno){
	var re=/^(?=.*[a-z])[a-z0-9]+/ig;
	return re.test(kpno);
}
/*
*身份证号
*/
function IDCode_Validation(code){
	var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};

	var pass= true;
    //var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
	//if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
	if(!code || !/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/i.test(code)){
		pass = false;
	}

	else if(!city[code.substr(0,2)]){
		pass = false;
	}
	else{
	  //18位身份证需要验证最后一位校验位
	  if(code.length == 18){
	  	code = code.split('');
	  //∑(ai×Wi)(mod 11)
	  //加权因子
	  var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
	  //校验位
	  var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
	  var sum = 0;
	  var ai = 0;
	  var wi = 0;
	  for (var i = 0; i < 17; i++)
	  {
	  	ai = code[i];
	  	wi = factor[i];
	  	sum += ai * wi;
	  }
	  var last = parity[sum % 11];
	  if(parity[sum % 11] != code[17]){
	  	pass =false;
	  }
	}
}
return pass;

}



function Date_Validation(date){
	var rec=/^(\d{4})-(\d{2})-(\d{2})$/;
		if(!rec.test(date)){
			var rec1=/^(\d{4})\/(\d{2})\/(\d{2})$/;
				return rec1.test(date)
		}else{
			return rec.test(date)
		}
}

/*
 * 正整数
 */
function Num_Validation(Num){
	var re=/^[1-9]\d{0,11}$/;
	return re.test(Num);
}
