//author:yahuking
//document.onkeydown = keyDownHandler;
//document.oncontextmenu = nocontextmenu;
//document.onmousedown = norightclick;
var formObject;
function keyDownHandler() {
    if (window.event) {
        if (window.event.altKey && (window.event.keyCode==37 || window.event.keyCode==39)) {    // disable back, forward
            window.event.cancelBubble = true;
            window.event.returnValue = false;
        } else if (window.event.ctrlKey && (window.event.keyCode==78 || window.event.keyCode==87 || window.event.keyCode==82)) {    // disable new, close, refresh
            window.event.cancelBubble = true;
            window.event.returnValue = false;
        } else if (window.event.keyCode==8) {
            if (window.event.srcElement.type != 'text' && window.event.srcElement.type != 'password' && window.event.srcElement.type != 'textarea') {   //disable backspace
                window.event.cancelBubble = true;
                window.event.returnValue = false;
            } else if (window.event.srcElement.type == 'text' && window.event.srcElement.readOnly) {
                window.event.cancelBubble = true;
                window.event.returnValue = false;
            }
        } else if (window.event.keyCode==13) {
            if (window.event.srcElement.type != 'textarea') {   //disable enter submit
                //window.event.keyCode = 0;
                window.event.cancelBubble = true;
                window.event.returnValue = false;
            }
        } else if (window.event.keyCode==116 || window.event.keyCode==122) {    //disable f5, f11
            window.event.keyCode = 0;
            window.event.cancelBubble = true;
            window.event.returnValue = false;
        }
    }
}

function nocontextmenu() {
    event.cancelBubble = true;
    event.returnValue = false;
    return false;
}

function norightclick(e) {
	
    if (window.Event) {

            return false;
    } else if (event.button == 2 || event.button == 3) {

        event.cancelBubble = true;
        event.returnValue = false;
        return false;
    }
}

//提交表单时候，给doAction赋相应的动作名称
function submitForm(formId,doAction){
	var formObject = document.getElementById(formId);
	var inputContent = '<input type="hidden" name="doAction" value="'+doAction+'"/>';
	formObject.insertAdjacentHTML('afterBegin',inputContent);
	formObject.submit();
	return false;
}
// 提交表单带一个参数
function submitForm1Param(formId,doAction,doActionName,doActionValue){
	var formObject = document.getElementById(formId);
	var inputContent = '<input type="hidden" name="doAction" value="'+doAction+'"/>';
	var actionName = document.getElementsByName(doActionName)[0];
	if (typeof(actionName) == "undefined"){
		
		inputContent = inputContent+'<input type="hidden" name="'+doActionName+'" value="'+doActionValue+'"/>'
	}else{
		
		actionName.value = doActionValue;
	}
	
	formObject.insertAdjacentHTML('afterBegin',inputContent);
	formObject.submit();
	return false;
}

//提交成功后，提示相应信息
function submitAfterForm(url,msg,afterurl) {
	var xmlHttp = GetXmlHttpObject();
	if (xmlHttp == null) {
		alert("您的浏览器不支持AJAX！");
		return;
	}
	xmlHttp.onreadystatechange = stateChanged(formId,doAction);
	xmlHttp.open("POST", url, true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send(null);
}

function stateChanged(formId,doAction) {
	if (xmlHttp.readyState == 4) {
		alert(msg);
		window.location=afterurl;
	}
}

function GetXmlHttpObject() {
	var xmlHttp = null;
	try {
		// Firefox, Opera 8.0+, Safari
		xmlHttp = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer
		try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlHttp;
}
