/**
 * 通用的验证工具
 */
$.extend($.fn.validatebox.defaults.rules,{
   idcard : {// 验证身份证 
       validator : function(value) { 
           return/^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value); 
       }, 
       message : '身份证号码格式不正确' 
   },
     minLength: {
       validator: function(value, param){
           return value.length >= param[0];
       },
       message: '请输入至少（2）个字符.'
   },
   length:{validator:function(value,param){ 
       var len=$.trim(value).length; 
           return len>=param[0]&&len<=param[1]; 
       }, 
           message:"输入内容长度必须介于{0}和{1}之间." 
       }, 
   phone : {// 验证电话号码 
       validator : function(value) { 
           return/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
       }, 
       message : '格式不正确,请使用下面格式:020-88888888' 
   }, 
   mobile : {// 验证手机号码 
       validator : function(value) { 
           return/^(13|15|18)\d{9}$/i.test(value); 
       }, 
       message : '手机号码格式不正确' 
   }, 
   
   mobiles : {// 验证手机号码 
	   validator : function(value) {
//		   var reg = /(^(13|15|18)\d{9})(,(13|15|18)\d{9})*$/ ;
		   var reg = /^1[358]\d{9}(,1[358]\d{9})*$/ ;
		   return reg.test(value); 
	   }, 
	   message : '手机号码格式不正确' 
   }, 
   tel : {// 验证手机号码 
       validator : function(value) { 
           return/^(13|15|18)\d{9}$/i.test(value); 
       }, 
       message : '手机号码格式不正确' 
   }, 
   
   tel : {// 验证手机号码 
	   validator : function(value) {
//		   var reg = /(^(13|15|18)\d{9})(,(13|15|18)\d{9})*$/ ;
		   var reg = /^1[358]\d{9}(,1[358]\d{9})*$/ ;
		   return reg.test(value); 
	   }, 
	   message : '手机号码格式不正确' 
   }, 
   emails : {
	   validator : function(value) {
//		   var reg = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/ ;
		   var reg =  /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+(,([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+)*$/;
		   return reg.test(value); 
	   }, 
	   message : '邮箱格式不正确' 
   }, 
	phoneNum: {// 验证手机号码+固定电话 
       validator : function(value) { 
           return /^(((((010)|(02\d)))[2-8]\d{7})|(0[3-9]\d{2}[2-8]\d{6,7})|(0?(?:147|1[358]\d)\d{8}))$/i.test(value); 
       }, 
       message : '手机号码格式不正确' 
	}, 
   intOrFloat : {// 验证整数或小数 
       validator : function(value) { 
           return /^\d+(\.\d+)?$/i.test(value); 
       }, 
       message : '请输入数字，并确保格式正确' 
   }, 
   currency : {// 验证货币 
       validator : function(value) { 
           return /^\d+(\.\d+)?$/i.test(value); 
       }, 
       message : '货币格式不正确' 
   }, 
   qq : {// 验证QQ,从10000开始 
       validator : function(value) { 
           return /^[1-9]\d{4,9}$/i.test(value); 
       }, 
       message : 'QQ号码格式不正确' 
   }, 
   integer : {// 验证整数 
       validator : function(value) { 
           return /^[+]?[1-9]+\d*$/i.test(value); 
       }, 
       message : '请输入正整数' 
   }, 
   age : {// 验证年龄
       validator : function(value) { 
           return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value); 
       }, 
       message : '年龄必须是0到120之间的整数' 
   }, 
   
   chinese : {// 验证中文 
       validator : function(value) { 
           return /^[\Α-\￥]+$/i.test(value); 
       }, 
       message : '请输入中文' 
   }, 
   chineseIntOrFloat : {// 验证中文和数字 
       validator : function(value) { 
           return /^[\Α-\￥0-9]+$/i.test(value);
       }, 
       message : '请输入中文或数字' 
   }, 
   english : {// 验证英语 
       validator : function(value) { 
           return /^[A-Za-z]+$/i.test(value); 
       }, 
       message : '请输入英文' 
   }, 
   unnormal : {// 验证是否包含空格和非法字符 
       validator : function(value) { 
           return /.+/i.test(value); 
       }, 
       message : '输入值不能为空和包含其他非法字符' 
   }, 
   username : {// 验证用户名 
       validator : function(value) { 
           return/^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value); 
       }, 
       message : '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）' 
   }, 
   dbusername : {// 验证数据库用户名 
       validator : function(value) { 
           return/^[a-zA-Z][a-zA-Z0-9_]{0,15}$/i.test(value); 
       }, 
       message : '用户名不合法（字母开头，允许1-16字节，允许字母数字下划线）' 
   },
   tableNameValidate : {// 验证数据库表名、字段
       validator : function(value) { 
           return/^[a-zA-Z][a-zA-Z0-9_]{0,63}$/i.test(value); 
       }, 
       message : '只允许字母开头,字母+数字+下划线' 
   },
   serveip : {// 验证服务ID 
       validator : function(value) { 
           return/^[a-zA-Z][a-zA-Z0-9_@.]{0,100}$/i.test(value); 
       }, 
       message : '服务ID不合法（字母开头，允许字母数字下划线@和.）' 
   },
   sid : {// 验证数据库实例
       validator : function(value) { 
           return/^[a-zA-Z][a-zA-Z0-9#$_.]{0,32}$/i.test(value); 
       }, 
       message : '数据库实例名不合法（字母开头，允许1-32字母允许字母数字下划线#$_和.）' 
   },
   english_IntOrFloat : {// 验证中英文、_、数字
       validator : function(value) { 
           return/^[a-zA-Z0-9_]{0,128}$/i.test(value); 
       }, 
       message : '请输入英文、_、数字' 
   },
   english_IntOrFloatAndChinese : {// 验证英文、_、数字
       validator : function(value) { 
           return/^[a-zA-Z0-9_]{0,128}$/i.test(value) || /^[\Α-\￥0-9]+$/i.test(value) || /^[\Α-\￥_a-zA-X_0-9]+$/i.test(value)|/^[a-zA-X_0-9-.]{0,64}$/i.test(value); 
       }, 
       message : '请输入中英文、_、数字' 
   },
   fiveIntOrFloat : {// 验证小于或等于5位数字
       validator : function(value) { 
           return/^[0-9]{0,5}$/i.test(value); 
       }, 
       message : '请输入小于或等于5位数字' 
   }, 
   englishIntOrFloat : {//验证英文和数字
       validator : function(value) { 
           return/^[a-zA-Z0-9]{0,15}$/i.test(value); 
       }, 
       message : '请输入英文+数字' 
   }, 
   faxno : {// 验证传真 
       validator : function(value) { 
//           return /^[+]{0,1}(\d){1,3}[]?([-]?((\d)|[ ]){1,12})+$/i.test(value); 
           return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
       }, 
       message : '传真号码不正确' 
   }, 
   zip : {// 验证邮政编码 
       validator : function(value) { 
           return /^[1-9]\d{5}$/i.test(value); 
       }, 
       message : '邮政编码格式不正确' 
   }, 
   ip : {// 验证IP地址 
       validator : function(value) { 
    	   var reg = /^((1?\d?\d|(2([0-4]\d|5[0-5])))\.){3}(1?\d?\d|(2([0-4]\d|5[0-5])))$/ ;  
           return reg.test(value)
       }, 
       message : 'IP地址格式不正确' 
   },
   mac:{//验证MAC地址
	   validator : function(value) { 
    	   var reg =/[A-Fa-f0-9]{2}-[A-Fa-f0-9]{2}-[A-Fa-f0-9]{2}-[A-Fa-f0-9]{2}-[A-Fa-f0-9]{2}-[A-Fa-f0-9]{2}/;  
    	   var reg1 =/[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;  
           return reg.test(value)|reg1.test(value)
       }, 
       message : 'MAC地址格式不正确'
	   
   },
  

   filename: {// 验证文件名
       validator : function(value) { 
    	   var reg =  /^(\w|[\u4E00-\u9FA5])*$/;  
           return reg.test(value)
       }, 
       message : '文件名只允许为英文，数字和中文的混合' 
   },
   name : {// 验证姓名，可以是中文或英文 
           validator : function(value) { 
               return /^[\Α-\￥]+$/i.test(value)|/^\w+[\w\s]+\w+$/i.test(value); 
           }, 
           message : '请输入姓名' 
   },
   english_Int: {// 验证包含拉丁字母或数字，以及“_”、“-”、“.” 
       validator : function(value) { 
           return /^[a-zA-X_0-9-.]{0,15}$/i.test(value); 
       }, 
       message : '请输入拉丁字母或数字，以及“_”、“-”、“.”' 
},
   chineseOrEnglish: {// 验证中文或英文数字 
       validator : function(value) { 
           return /^[\Α-\￥_a-zA-X_0-9]+$/i.test(value)|/^[a-zA-X_0-9-.]{0,64}$/i.test(value); 
       }, 
       message : '请输入中文或英文数字' 
},
   date : {// 验证日期 
       validator : function(value) { 
        //格式yyyy-MM-dd或yyyy-M-d
           return/^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value); 
       },
       message : '清输入合适的日期格式'
   },
   msn:{ 
       validator : function(value){ 
       return/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value); 
   }, 
   message : '请输入有效的msn账号(例：abc@hotnail(msn/live).com)' 
   },
   same:{ 
       validator : function(value, param){ 
           if($("#"+param[0]).val() !="" && value != ""){ 
               return $("#"+param[0]).val() == value; 
           }else{ 
               return true; 
           } 
       }, 
       message : '两次输入的密码不一致！'   
   },
   wsdl: {     
       validator: function(value){               
            var reg = "^(http://|([0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}:[0-9]{1,4}))[/a-zA-Z0-9._%&:=(),?+]*[?]{1}wsdl$";  
            return reg.test(value);  
       },     
       message: '请输入合法的WSDL地址'     
   },
   stringValidate: {     
       validator: function(value){    
    	   var pattern = new RegExp("[~'!@#￥$%^&*()-+_=:]");
    	   
    	   var pattern2 = new RegExp("[`~!#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");  
    	   if(value.charAt(value.length-1) == " "){
    		   //字符串后面含有空格
				return false;
		   }
		   if(value.charAt(0) == " "){
			 //字符串前面含有空格
				return false;
			}
            return !pattern.test(value) && !pattern2.test(value);  
       },     
       message: '请输入合法的字符'     
   },
   stringValidateForCodeTypeOperate: {     
       validator: function(value){    
    	   var pattern = new RegExp("[~'!@#￥$%^&*()-+=:]");
    	   
    	   var pattern2 = new RegExp("[`~!#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");  
    	   if(value.charAt(value.length-1) == " "){
    		   //字符串后面含有空格
				return false;
		   }
		   if(value.charAt(0) == " "){
			 //字符串前面含有空格
				return false;
			}
            return !pattern.test(value) && !pattern2.test(value);  
       },     
       message: '请输入合法的字符'     
   },//用于系统配置》系统数据字典配置》分类配置的添加、修改操作
   checkPort: {  //验证1~65535的端口号
   	validator: function (value,param) {  
   		if(value>65535 || value<1)
   			return false;
   		return /^[0-9]\d{0,4}$/i.test(value);     
   	},  
   		message: '请输入1~65535的端口号'  
   },
   //供内部接口服务id输入框验证使用(除了@)
   stringValidateForService: {     
       validator: function(value){    
    	   var pattern = new RegExp("[~'!#￥$%^&*()-+_=:]");  
    	   
    	   var pattern2 = new RegExp("[`~!#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");  
    	   
    	   if(value.charAt(value.length-1) == " "){
    		   //字符串后面含有空格
				return false;
		   }
		   if(value.charAt(0) == " "){
			 //字符串前面含有空格
				return false;
			}
            return !pattern.test(value) && !pattern2.test(value);  
       },     
       message: '请输入合法的字符'     
   },
   stringDescValidate: {     
       validator: function(value){    
    	   var pattern = new RegExp("[%<>=]");
    	   
    	   if(value.charAt(value.length-1) == " "){
    		   //字符串后面含有空格
				return false;
		   }
		   if(value.charAt(0) == " "){
			 //字符串前面含有空格
				return false;
			}
            return !pattern.test(value);  
       },     
       message: '请输入合法的字符'     
   },
   //不含中文
   noChinese: {     
       validator: function(value){    
    	   var pattern = new RegExp("[\Α-\￥]");
           return !pattern.test(value);  
       },     
       message: '请不要输入中文'     
   },
   secondNumber: {// 超时时间--秒的验证 ,验证零和非零开头的15位数字
       validator : function(value) { 
           return /^(0|[1-9][0-9]{0,14})$/i.test(value); 
       }, 
       message : '请输入小于或等于15位数字' 
   },
   //1到10 的正整数
   oneToTen: {
	   validator: function(value){    
		   var reg = /^(?:[1-9]?|10)$/;
		   return reg.test(value);
       },     
       message: '请输入1-10的数字'   
   },
 //1到4 的正整数
   oneToFour: {
	   validator: function(value){    
		   var reg = /^(?:[1-4]?)$/;
		   return reg.test(value);
       },     
       message: '请输入1-4的数字'   
   },
   // radio
    requireRadio: {  
	    validator: function(value, param){  
	        var radios = $("input[name='"+param[0]+"']:checked");
	        var isCheck = false;
	        if(radios.length>0){
	        	isCheck = true;
	        }
	        return isCheck;
	    },  
	    message: '必须选中其中一项.'  
	},
	//验证身份证
    pnum:{
    	validator:function(code){
    		var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    		var tip = "";
    		var pass= true;
    			if(!code || !/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/i.test(code)){
    			tip = "身份证号格式错误";
    			pass = false;
    		}
    		else if(!city[code.substr(0,2)]){
    			tip = "地址编码错误";
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
    		  	tip = "身份证校验位错误";
    		  	pass =false;
    		  }
    		}
    	}
    	return pass;
    	},
    	message:'身份证不通过验证'
    }  
});