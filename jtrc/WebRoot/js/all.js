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
function logOut(){
	
     alert('ϵͳ�Ự���ӳ�ʱ��ȷ���󽫻ص�ϵͳ��¼��ҳ��'); 
     window.location.href="./jsp/login/login.jsp";
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
function submitForm(formId,doAction){

	var formObject = document.getElementById(formId);
	formObject.doAction.value=doAction;
	formObject.submit();
	return false;
}
if(typeof(DWREngine) != 'undefined'){
	
	DWREngine.setErrorHandler(sAlert);
}
function sAlert(errorMsg){
 
	   var errorMsgs = errorMsg.split("|");
	   if((errorMsgs!=null && errorMsgs.length!=3)||(typeof(errorMsgs[2]) == 'undefined')){
		   return;
	   }
	   var msgw,msgh,bordercolor;
	   msgw=400;//��ʾ���ڵĿ��
	   msgh=210;//��ʾ���ڵĸ߶�
	   titleheight=25 //��ʾ���ڱ���߶�
	   bordercolor="#336699";//��ʾ���ڵı߿���ɫ
	   titlecolor="#538ED2";//��ʾ���ڵı�����ɫ

	   var sWidth,sHeight;
	   sWidth=document.body.offsetWidth;//���������������ҳ����
	   sHeight=screen.height;//��Ļ�߶ȣ���ֱ�ֱ��ʣ�


	   //�����㣨��С�봰����Ч������ͬ�����������Ի���ʱ��������ʾΪ����״͸����ɫ��
	   var bgObj=document.createElement("div");//����һ��div���󣨱����㣩
	   //����div���ԣ����൱��
	   //<div id="bgDiv" style="position:absolute; top:0; background-color:#777; filter:progid:DXImagesTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75); opacity:0.6; left:0; width:918px; height:768px; z-index:10000;"></div>
	   bgObj.setAttribute('id','bgDiv');
	   bgObj.style.position="absolute";
	   bgObj.style.top="0";
	   $("select").attr("disabled",true);

	   //bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
	   bgObj.style.opacity="0.6";
	   bgObj.style.left="0";
	   bgObj.style.width=sWidth + "px";
	   bgObj.style.height=sHeight + "px";
	   bgObj.style.zIndex = "10000";
	   document.body.appendChild(bgObj);//��body����Ӹ�div����

	   var msgObj=document.createElement("div")//����һ��div������ʾ��㣩
	   //����div���ԣ����൱��
	   msgObj.setAttribute("id","msgDiv");
	   msgObj.setAttribute("align","center");
	   msgObj.style.background="white";
	   msgObj.style.border="1px solid " + bordercolor;
	   msgObj.style.position = "absolute";
	   msgObj.style.left = "50%";
	   msgObj.style.top = "50%";
	   msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
	   msgObj.style.marginLeft = "-225px" ;
	   msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
	   msgObj.style.width = msgw + "px";
	   msgObj.style.height =msgh + "px";
	   msgObj.style.textAlign = "center";
	   msgObj.style.lineHeight ="25px";
	   msgObj.style.zIndex = "10001";
	  
	   var titleTable = document.createElement("table");
	   titleTable.setAttribute("id", "titleTable");
	   titleTable.style.margin="0";
	   titleTable.style.border="2px solid " + titlecolor;
	   titleTable.style.height="25px";
	   titleTable.style.width="400px";
	   titleTable.align="center";
	      
	   var button=document.createElement("img");//����һ��input������ʾ��ť��
	   //����input�����ԣ����൱��
	   button.setAttribute("src",'/icm/images/btn_close1.gif');
	   button.setAttribute("id","subcomit");
	   button.style.align="right";
	   button.style.background=titlecolor;
	   button.style.color="white";
	   button.style.cursor="pointer";
	   button.onclick=removeObj;
	   
	   var titleMsg=document.createElement("img");//����һ��input������ʾ��ť��
	   //����input�����ԣ����൱��
	   titleMsg.setAttribute("src",'/icm/images/mess_sys.gif');
	   titleMsg.setAttribute("id","messId");
	   titleMsg.style.align="left";
	   titleMsg.style.background=titlecolor;
	   titleMsg.style.color="white";
	   titleMsg.style.cursor="pointer";
	   
	   var title=document.createElement("h5");//����һ��h4������ʾ���������
	   //����h4�����ԣ����൱��
	   title.setAttribute("id","msgTitle");
	   title.setAttribute("align","left");
	   title.style.margin="0";
	   title.style.background=titlecolor;
	   title.style.opacity="0.75";
	   title.style.border="2px solid " + titlecolor;
	   //title.style.height="25px";
	   //title.style.font="13px  Arial, Helvetica, sans-serif";
	   title.style.color="white";
	  
	  
	   var ttr0 = titleTable.insertRow();
	   ttr0.style.height="25px";
	   ttr0.style.background=titlecolor;
	   var ttd = ttr0.insertCell();
	   ttd.appendChild(titleMsg);
	   var ttd0 = ttr0.insertCell();
	   ttd0.style.width="350px";
	   ttd0.appendChild(title)
	   var ttd1 = ttr0.insertCell();
	   ttd1.appendChild(button);

	   function removeObj(){//����������������¼�
	     document.body.removeChild(bgObj);//ɾ���Div
	     document.getElementById("msgDiv").removeChild(titleTable);//ɾ����ʾ��ı�����
	     document.body.removeChild(msgObj);//ɾ����ʾ���
	   }
	   document.body.appendChild(msgObj);//��body�������ʾ��div����msgObj
	   document.getElementById("msgDiv").appendChild(titleTable);//����ʾ��div����ӱ���������title
	
	   var table = document.createElement("table");
	   table.setAttribute("id", "errorTable");
	   table.style.marginTop ="10px";
	   table.style.height="160px";
	   table.style.width="380px";
	   table.align="center";
	   table.style.border = '1px solid #DDD'; 
	
	   var tr0 = table.insertRow();
	   tr0.style.height="5px";
	   var td0 = tr0.insertCell();
	   var td1 = tr0.insertCell();
	   var td2 = tr0.insertCell();
	   var td3 = tr0.insertCell();

	   
	   var tr1 = table.insertRow();
	   var td0 = tr1.insertCell();
	   td0.style.width="10px";
	   var td1 = tr1.insertCell();
	   td1.innerHTML="�������:";
	   var td2 = tr1.insertCell();
	   var input=document.createElement("input");
	   input.type="text";
	   input.style.width="280px";
	   input.value=errorMsgs[0];
	   td2.appendChild(input);
	   var td3 = tr1.insertCell();
	   td3.style.width="15px";
	   
	   var tr2 = table.insertRow();
	   var td0 = tr2.insertCell();
	   td0.style.width="10px";
	   var td1 = tr2.insertCell();
	   td1.innerHTML="����˵��:";
	   var td2 = tr2.insertCell();
	   var input=document.createElement("textarea");
	   input.readOnly=true;
	   input.rows="5";
	   input.cols="30";
	   input.style.overflow="hidden";
	   input.style.width="280px";
	   input.style.height="30px";
	   input.value=errorMsgs[1];
	   td2.appendChild(input);
	   var td3 = tr2.insertCell();
	   td3.style.width="15px";
	   
	   var tr3 = table.insertRow();
	   var td0 = tr3.insertCell();
	   td0.style.width="10px";
	   var td1 = tr3.insertCell();
	   td1.innerHTML="���?��:";
	   var td2 = tr3.insertCell();
	   var input=document.createElement("textarea");
	   input.style.overflow="hidden";
	   input.style.width="280px";
	   input.style.height="50px";
	   input.readOnly=true;
	   input.rows="5";
	   input.cols="30";
	   input.value=errorMsgs[2];
	   td2.appendChild(input);
	   var td3 = tr3.insertCell();
	   td3.style.width="15px";
	   
	   var tr4 = table.insertRow();
	   var td0 = tr4.insertCell();
	   td0.style.width="15px";
	   var td1 = tr4.insertCell();
	   td1.innerHTML="&nbsp;&nbsp;&nbsp;";
	   var td2 = tr4.insertCell();
	   td2.style.textAlign = "right";
	   td2.style.width="280px";
	   var button1=document.createElement("img");//����һ��input������ʾ��ť��
	   //����input�����ԣ����൱��
	   //<input type="button" align="center" style="width:100px; align:center; margin-left:250px; margin-bottom:10px;" value="�ر�">
	   //button1.setAttribute("type","button");
	   //button1.setAttribute("value","ȷ��");
	   //button1.style.width="60px";
	   button1.style.align="right";
	   button1.src="/icm/images/submit.gif";
	   //button1.style.background=bordercolor;
	   //button1.style.border="0px solid "+ bordercolor;
	   //button1.style.color="white";
	   button1.onclick=removeObj;
	   td2.appendChild(button1);
	   var td3 = tr4.insertCell();
	   td3.style.width="15px";

	   document.getElementById("msgDiv").appendChild(table);//����ʾ��div�������ʾ��Ϣ����txt
	   //document.getElementById("msgDiv").appendChild(button1);

	}


function showTab(ID) 
{ 
  for(var i=1;i<=6;i++) 
  { 
    if(ID==i) 
    { 
      document.getElementById("basic_Tab_"+i).className='on'; 
      document.getElementById("basic_cont_"+i).style.display='';
	  
    } 
    else 
    { 
      document.getElementById("basic_Tab_"+i).className='off'; 
      document.getElementById("basic_cont_"+i).style.display='none'; 
    } 
  } 
} 

function ext_showTab(ID) 
{ 
  for(var i=1;i<=6;i++) 
  { 
    if(ID==i) 
    { 
      document.getElementById("ext_Tab_"+i).className='on'; 
      document.getElementById("ext_cont_"+i).style.display='';
	  
    } 
    else 
    { 
      document.getElementById("ext_Tab_"+i).className='off'; 
      document.getElementById("ext_cont_"+i).style.display='none'; 
    } 
  } 
} 


function bizShowTab(ID) 
{ 
  for(var i=1;i<=5;i++) 
  { 
    if(ID==i) 
    { 
      document.getElementById("bizTab_"+i).className='bizOn'; 
      document.getElementById("bizCont_"+i).style.display='block'; 
    } 
    else 
    { 
      document.getElementById("bizTab_"+i).className='bizOff'; 
      document.getElementById("bizCont_"+i).style.display='none'; 
    } 
  } 
} 



var show_i=1;
function hotsetShow(a,b) {
if (show_i==b)  {return true;}
var ohidden=document.getElementById("list_item"+show_i);
ohidden.className="b";
a.className="show";
show_i=b;
}


	var timeBeforeAutoHide = 100;	// Microseconds to wait before auto hiding menu(1000 = 1 second)
	var slideSpeed_out = 5000;	// Steps to move sub menu at a time ( higher = faster)
	var slideSpeed_in = 5000;
		
	
	var slideTimeout_out = 45;	// Microseconds between slide steps ( lower = faster)
	var slideTimeout_in = 20;	// Microseconds between slide steps ( lower = faster)
	
	var showSubOnMouseOver = true;	// false = show sub menu on click, true = show sub menu on mouse over
	var fixedSubMenuWidth = false;	// Width of sub menu items - A number(width in pixels) or false when width should be dynamic
	
	var xOffsetSubMenu = 0; 	// Offset x-position of sub menu items - use negative value if you want the sub menu to overlap main menu
	
	var slideDirection = 'right';	// Slide to left or right ?
	
	/* Don't change anything below here */
	
	var activeSubMenuId = false;
	var activeMainMenuItem = false;
	var currentZIndex = 1000;		
	var autoHideTimer = 0;
	var submenuObjArray = new Array();
	var okToSlideInSub = new Array();
	var subPositioned = new Array();
	

	function stopAutoHide()
	{
		autoHideTimer = -1;
	}
	
	function initAutoHide()
	{
		autoHideTimer = 0;
		if(autoHideTimer>=0)autoHide();
	}
	
	function autoHide()
	{
		
		if(autoHideTimer>timeBeforeAutoHide)
		{
			
			if(activeMainMenuItem){
				activeMainMenuItem.className='';
				activeMainMenuItem = false;
			}
			
			if(activeSubMenuId){
				var obj = document.getElementById('subMenuDiv' + activeSubMenuId);
				showSub();
			}
		}else{
			if(autoHideTimer>=0){
				autoHideTimer+=50;
				setTimeout('autoHide()',50);
			}
		}
	}	
	
	function getTopPos(inputObj)
	{		
	  var returnValue = inputObj.offsetTop;
	  while((inputObj = inputObj.offsetParent) != null)returnValue += inputObj.offsetTop;
	  return returnValue;
	}
	
	function getLeftPos(inputObj)
	{
	  var returnValue = inputObj.offsetLeft;
	  while((inputObj = inputObj.offsetParent) != null)returnValue += inputObj.offsetLeft;
	  return returnValue;
	}
	
	function showSub()
	{
		var subObj = false;
		if(this && this.tagName){
			var numericId = this.parentNode.id.replace(/[^0-9]/g,'');
			okToSlideInSub[numericId] = false;
			var subObj = document.getElementById('subMenuDiv' + numericId);
			if(activeMainMenuItem)activeMainMenuItem.className='';
			if(subObj){
				if(!subPositioned[numericId]){
					if(slideDirection=='right'){
						subObj.style.left = getLeftPos(submenuObjArray[numericId]['parentDiv']) + submenuObjArray[numericId]['parentDiv'].offsetWidth + xOffsetSubMenu + 'px';
					}else{
						subObj.style.left = getLeftPos(submenuObjArray[numericId]['parentDiv']) + xOffsetSubMenu + 'px';
						
					}
					submenuObjArray[numericId]['left'] = subObj.style.left.replace(/[^0-9]/g,'');
					subObj.style.top = getTopPos(submenuObjArray[numericId]['parentDiv']) + 'px';
					subPositioned[numericId] = true;
				}				
				subObj.style.visibility = 'visible';
				subObj.style.zIndex = currentZIndex;
				currentZIndex++;	
				this.className='activeMainMenuItem';
				activeMainMenuItem = this;
			}
		}else{
			var numericId = activeSubMenuId;
		}
		if(activeSubMenuId && (numericId!=activeSubMenuId || !subObj))slideMenu(activeSubMenuId,(slideSpeed_in*-1));
		if(numericId!=activeSubMenuId && this && subObj){
			subObj.style.width = '0px';	
			slideMenu(numericId,slideSpeed_out);
			activeSubMenuId = numericId;
		}else{
			if(numericId!=activeSubMenuId)activeSubMenuId = false;
		}
		if(showSubOnMouseOver)stopAutoHide();
	}
	
	function slideMenu(menuIndex,speed){
		var obj = submenuObjArray[menuIndex]['divObj'];
		var obj2 = submenuObjArray[menuIndex]['ulObj'];
		var width = obj.offsetWidth + speed;
		if(speed<0){
			if(width<0)width = 0;
			obj.style.width = width + 'px';
			if(slideDirection=='left'){
				obj.style.left = submenuObjArray[menuIndex]['left'] - width + 'px';
				obj2.style.left = '0px';
			}else{
				obj2.style.left = width - submenuObjArray[menuIndex]['width'] + 'px' 
			}
			if(width>0 && okToSlideInSub[menuIndex])setTimeout('slideMenu(' + menuIndex + ',' + speed + ')',slideTimeout_in); else{
				obj.style.visibility = 'hidden';
				obj.style.width = '0px';
				if(activeSubMenuId==menuIndex)activeSubMenuId=false;
			}
			
		}else{
			if(width>submenuObjArray[menuIndex]['width'])width = submenuObjArray[menuIndex]['width'];
			if(slideDirection=='left'){
				obj.style.left = submenuObjArray[menuIndex]['left'] - width + 'px';
				obj2.style.left = '0px';
			}else{
				obj2.style.left = width - submenuObjArray[menuIndex]['width'] + 'px' 
			}		
			
			obj.style.width = width + 'px';
			if(width<submenuObjArray[menuIndex]['width']){
				setTimeout('slideMenu(' + menuIndex + ',' + speed + ')',slideTimeout_out);
			}else{
				okToSlideInSub[menuIndex] = true;
			}
		}
	}
	function resetPosition()
	{
		subPositioned.length = 0;
	}
			
	function initLeftMenu()
	{
		var isMSIE = navigator.userAgent.indexOf('MSIE')>=0?true:false;
		var browserVersion = parseInt(navigator.userAgent.replace(/.*?MSIE ([0-9]+?)[^0-9].*/g,'$1'));
		if(!browserVersion)browserVersion=1;
		
		var menuObj = document.getElementById('dhtmlgoodies_menu');	
		var mainMenuItemArray = new Array();
		if(menuObj==null)
			return;
		var mainMenuItem = menuObj.getElementsByTagName('LI')[0];
		while(mainMenuItem){
			if(mainMenuItem.tagName && mainMenuItem.tagName.toLowerCase()=='li'){
				mainMenuItemArray[mainMenuItemArray.length] = mainMenuItem;
				var aTag = mainMenuItem.getElementsByTagName('A')[0];
				if(showSubOnMouseOver)
					aTag.onmouseover = showSub;	
				else
					aTag.onclick = showSub;	
			}
			mainMenuItem = mainMenuItem.nextSibling;
		}		
		
		var lis = menuObj.getElementsByTagName('A');
		for(var no=0;no<lis.length;no++){
			if(!showSubOnMouseOver)lis[no].onmouseover = stopAutoHide;
			lis[no].onmouseout = initAutoHide;
			lis[no].onmousemove = stopAutoHide;
		}
				
		for(var no=0;no<mainMenuItemArray.length;no++){
			var sub = mainMenuItemArray[no].getElementsByTagName('UL')[0];
			if(sub){
				mainMenuItemArray[no].id = 'mainMenuItem' + (no+1);
				var div = document.createElement('DIV');
				div.className='dhtmlgoodies_subMenu';
				document.body.appendChild(div);
				div.appendChild(sub);
				if(slideDirection=='right'){
					div.style.left = getLeftPos(mainMenuItemArray[no]) + mainMenuItemArray[no].offsetWidth + xOffsetSubMenu + 'px';
				}else{
					div.style.left = getLeftPos(mainMenuItemArray[no]) + xOffsetSubMenu + 'px';
				}
				div.style.top = getTopPos(mainMenuItemArray[no]) + 'px';
				div.id = 'subMenuDiv' + (no+1);
				sub.id = 'submenuUl' + (no+1);
				sub.style.position = 'relative';	

				if(navigator.userAgent.indexOf('Opera')>=0){
					submenuObjArray[no+1] = new Array();
					submenuObjArray[no+1]['parentDiv'] = mainMenuItemArray[no];
					submenuObjArray[no+1]['divObj'] = div;
					submenuObjArray[no+1]['ulObj'] = sub;
					submenuObjArray[no+1]['width'] = sub.offsetWidth;
					submenuObjArray[no+1]['left'] = div.style.left.replace(/[^0-9]/g,'');
				}
				sub.style.left = 1 - sub.offsetWidth + 'px';	
				
				
				
				if(browserVersion<7 && isMSIE)div.style.width = '1px';	
					
				if(navigator.userAgent.indexOf('Opera')<0){
					submenuObjArray[no+1] = new Array();
					submenuObjArray[no+1]['parentDiv'] = mainMenuItemArray[no];
					submenuObjArray[no+1]['divObj'] = div;
					submenuObjArray[no+1]['ulObj'] = sub;
					submenuObjArray[no+1]['width'] = sub.offsetWidth;
					
					
					
					submenuObjArray[no+1]['left'] = div.style.left.replace(/[^0-9]/g,'');
					if(fixedSubMenuWidth)submenuObjArray[no+1]['width'] = fixedSubMenuWidth;
				}	

				if(!document.all)div.style.width = '1px';			
					
			}			
		}
			

		
		
		menuObj.style.visibility = 'visible';
		
		window.onresize = resetPosition;
	}
	
	
	window.onload = initLeftMenu;