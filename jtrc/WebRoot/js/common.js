/**
 * 公共信息
 * @author liu_quan
 * 
 */
var wholeWidth = window.innerWidth-10;//window.screen.availWidth
var wholeHeight =  window.screen.availHeight-300;




function fixWidth(percent) {
	return document.body.clientWidth * percent; 
}	
 /**
  * 非空校验
 * @param obj
 */
function isEmpty(obj){
	   if(obj!=null&&typeof(obj)!= "undefined"&&obj!=''){
		  return true;
	   }
	   return false;
	   
   } 

/**
 * 是否只选择一条记录
 * 
 */
function isCheckOne(id){
	var selections = $(id).datagrid('getSelections'); 
	   if(selections.length == 0){
			$.messager.alert('提示','请选择数据！');
			return false;
		}else if(selections.length > 1){
			$.messager.alert('提示','只能选择一个数据！');
			return false;
		} 
	   return true;
}

/**
 * 成功信息提示
 */
function successMsg(){
	 /*$.messager.show({
			title:'提示信息',
			msg:'操作成功',
			showType:'show',
			timeout:2000
			});*/
	$.messager.alert('提示信息','操作成功！','info');


	
}

/**
 * 失败信息
 */
function failMsg(result){
	var msg='';
	if(obj!=null&&typeof(obj)!= "undefined"&&obj!=''){
		msg=result.cause;
	}
	$.messager.alert('错误','操作失败！' +msg,'error');
	
}

/**
 * 异常信息
 */
function errorMsg(){
	$.messager.alert('错误','操作失败！','error');
	
}
/**生成指定位数的随机整数*/
function randomNum(n){ 
    var t=''; 
    for(var i=0;i<n;i++){ 
        t+=Math.floor(Math.random()*10); 
    } 
    return t; 
} 

/**表单校验
 * @param formid
 * @returns {Boolean}
 */
function formIsValid(formid){
	 var r = $(formid).form('enableValidation').form('validate');
		if(!r) {
			return false;
		}
		return true;

	
	
}
/**弹出查看对话框禁用表单域编辑*/
function disableForm(formId,isDisabled) {  
    
    var attr="disable";  
    if(!isDisabled){  
       attr="enable";  
    }  
    $("form[id='"+formId+"'] :text").attr("disabled",isDisabled);  
    $("form[id='"+formId+"'] textarea").attr("disabled",isDisabled);  
    $("form[id='"+formId+"'] select").attr("disabled",isDisabled);  
    $("form[id='"+formId+"'] :radio").attr("disabled",isDisabled);  
    $("form[id='"+formId+"'] :checkbox").attr("disabled",isDisabled);  
      
    //禁用jquery easyui中的下拉选（使用input生成的combox）  
  
    $("#" + formId + " input[class='combobox-f combo-f']").each(function () {  
        if (this.id) {alert("input"+this.id);  
            $("#" + this.id).combobox(attr);  
        }  
    });  
      
    //禁用jquery easyui中的下拉选（使用select生成的combox）  
    $("#" + formId + " select[class='combobox-f combo-f']").each(function () {  
        if (this.id) {  
        alert(this.id);  
            $("#" + this.id).combobox(attr);  
        }  
    });  
      
    //禁用jquery easyui中的日期组件dataBox  
    $("#" + formId + " input[class='datebox-f combo-f']").each(function () {  
        if (this.id) {  
        alert(this.id)  
            $("#" + this.id).datebox(attr);  
        }  
    });  
}  
//日期格式转换
function DateFormat(date,fmt) {         
    var o = {         
    "M+" : date.getMonth()+1, //月份         
    "d+" : date.getDate(), //日         
    "h+" : date.getHours()%12 == 0 ? 12 : date.getHours()%12, //小时         
    "H+" : date.getHours(), //小时         
    "m+" : date.getMinutes(), //分         
    "s+" : date.getSeconds(), //秒         
    "q+" : Math.floor((date.getMonth()+3)/3), //季度         
    "S" : date.getMilliseconds() //毫秒         
    };         
    var week = {         
    "0" : "/u65e5",         
    "1" : "/u4e00",         
    "2" : "/u4e8c",         
    "3" : "/u4e09",         
    "4" : "/u56db",         
    "5" : "/u4e94",         
    "6" : "/u516d"        
    };         
    if(/(y+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));         
    }         
    if(/(E+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[date.getDay()+""]);         
    }         
    for(var k in o){         
        if(new RegExp("("+ k +")").test(fmt)){         
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));         
        }         
    }         
    return fmt;         
}       



//easyui 只选择年月
function dateSet(formId){
$(formId).datebox({    
          onShowPanel : function() {// 显示日趋选择对象后再触发弹出月份层的事件，初始化时没有生成月份层    
              span.trigger('click'); // 触发click事件弹出月份层    
              if (!tds)    
                  setTimeout(function() {// 延时触发获取月份对象，因为上面的事件触发和对象生成有时间间隔    
                      tds = p.find('div.calendar-menu-month-inner td');    
                      tds.click(function(e) {    
                          e.stopPropagation(); // 禁止冒泡执行easyui给月份绑定的事件    
                          var year = /\d{4}/.exec(span.html())[0]// 得到年份    
                          , month = parseInt($(this).attr('abbr'), 10) + 1; // 月份    
                          $(formId).datebox('hidePanel')// 隐藏日期对象    
                          .datebox('setValue', year + '-' + month); // 设置日期的值    
                      });    
                  }, 0);    
          },    
          parser : function(s) {// 配置parser，返回选择的日期    
              if (!s)    
                  return new Date();    
              var arr = s.split('-');    
              return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);    
          },    
          formatter : function(d) {    
              var month = d.getMonth();  
              if(month<=10){  
                  month = "0"+month;  
              }  
              if (d.getMonth() == 0) {    
                  return d.getFullYear()-1 + '-' + 12;    
              } else {    
                  return d.getFullYear() + '-' + month;    
              }    
          }// 配置formatter，只返回年月    
      });    
      var p = $(formId).datebox('panel'), // 日期选择对象    
      tds = false, // 日期选择对象中月份    
      span = p.find('span.calendar-text'); // 显示月份层的触发控件    
}

/**从身份证号中获取出生日期和性别的方法*/
function GetBirthdatByIdNo(iIdNo){
    var tmpStr = "";
    var birthday ="";
    iIdNo = $.trim(iIdNo);
    if(iIdNo.length == 15){
      tmpStr = iIdNo.substring(6, 12);
      tmpStr = "19" + tmpStr;
      tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6);
      sexStr = parseInt(iIdNo.substring(14, 1),10) % 2 ? "男" : "女";
      birthday= tmpStr;
    }else{
      tmpStr = iIdNo.substring(6, 14);
      tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6);
      sexStr = parseInt(iIdNo.substring(17, 1),10) % 2 ? "男" : "女";
      birthday= tmpStr;
    }
    return  birthday;
  }
//设置档案信息
function setArchiveHead(){
	var cache=window.top.cacheArchive;
	if(cache){
		var frames=window.top.frames;
		//获取选项卡组件
		for(var i=0;i<frames.length;i++){
			var body=frames[i].document.body;
			var cacheId=$(body).find('#cacheId');
			var cacheDpno=$(body).find('#cacheDpno');
			var cacheIdnum=$(body).find('#cacheIdnum');
			var cacheName=$(body).find('#cacheName');
			var cacheSchool=$(body).find('#cacheSchool');
			var cacheMajor=$(body).find('#cacheMajor');
			var cacheTel=$(body).find('#cacheTel');
			
			//获取当前的选项卡
			var currentTab =window.top.$('#pageTabs').tabs('getTab',i);
			if(cacheId.length>0){
				if(currentTab){
					var tabTitle=window.top.$('#pageTabs').tabs('getTab',i).panel('options').tab.text();
					if(tabTitle!='档案信息管理'){
						//frames[i].$('#'+$(body).find('.datagrid-f').attr('id')).datagrid('reload',{dept:"daNum",
						//	key:cache.cacheDpno,ar_no:cache.cacheDpno,dpno:cache.cacheDpno});
					}
				}
				$(cacheId).val(cache.cacheId);
			}
			if(cacheDpno.length>0){
				$(cacheDpno).val(cache.cacheDpno);
			}
			if(cacheIdnum.length>0){
				$(cacheIdnum).val(cache.cacheIdnum);
			}
			if(cacheName.length>0){
				$(cacheName).val(cache.cacheName);
			}
			if(cacheSchool.length>0){
				$(cacheSchool).val(cache.cacheSchool);
			}
			if(cacheMajor.length>0){
				$(cacheMajor).val(cache.cacheMajor);
			}
			if(cacheTel.length>0){
				$(cacheTel).val(cache.cacheTel);
			}
			
		}
	}
}

