package com.tgb.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SpringTest {

	 public static void main(String[] args) {
//		 ApplicationContext ctx = new ClassPathXmlApplicationContext("config/spring-common.xml"}; 
//		 Object userMapper = ctx.getBean("userMapper"}; 
//		 System.out.println(userMapper);
	       String[] a0= new String[]{"北京", "东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆"};  
	       String[] a1= new String[]{"上海", "黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明"}; 
	       String[] a2= new String[]{"天津", "和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县"}; 
	       String[] a3= new String[]{"重庆", "万州|涪陵|渝中|大渡口|江北|沙坪坝|九龙坡|南岸|北碚|万盛|双挢|渝北|巴南|黔江|长寿|綦江|潼南|铜梁|大足|荣昌|壁山|梁平|城口|丰都|垫江|武隆|忠县|开县|云阳|奉节|巫山|巫溪|石柱|秀山|酉阳|彭水|江津|合川|永川|南川"}; 
	       String[] a4= new String[]{"河北", "石家庄|邯郸|邢台|保定|张家口|承德|廊坊|唐山|秦皇岛|沧州|衡水"}; 
	       String[] a5= new String[]{"山西", "太原|大同|阳泉|长治|晋城|朔州|吕梁|忻州|晋中|临汾|运城"}; 
	       String[] a6= new String[]{"内蒙古", "呼和浩特|包头|乌海|赤峰|呼伦贝尔盟|阿拉善盟|哲里木盟|兴安盟|乌兰察布盟|锡林郭勒盟|巴彦淖尔盟|伊克昭盟"}; 
	       String[] a7= new String[]{"辽宁", "沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛"}; 
	       String[] a8= new String[]{"吉林", "长春|吉林|四平|辽源|通化|白山|松原|白城|延边"}; 
	       String[] a9= new String[]{"黑龙江", "哈尔滨|齐齐哈尔|牡丹江|佳木斯|大庆|绥化|鹤岗|鸡西|黑河|双鸭山|伊春|七台河|大兴安岭"}; 
	       String[] a10= new String[]{"江苏", "南京|镇江|苏州|南通|扬州|盐城|徐州|连云港|常州|无锡|宿迁|泰州|淮安"}; 
	       String[] a11= new String[]{"浙江", "杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水"}; 
	       String[] a12= new String[]{"安徽", "合肥|芜湖|蚌埠|马鞍山|淮北|铜陵|安庆|黄山|滁州|宿州|池州|淮南|巢湖|阜阳|六安|宣城|亳州"}; 
	       String[] a13= new String[]{"福建", "福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德"}; 
	       String[] a14= new String[]{"江西", "南昌市|景德镇|九江|鹰潭|萍乡|新馀|赣州|吉安|宜春|抚州|上饶"}; 
	       String[] a15= new String[]{"山东", "济南|青岛|淄博|枣庄|东营|烟台|潍坊|济宁|泰安|威海|日照|莱芜|临沂|德州|聊城|滨州|菏泽"}; 
	       String[] a16 = new String[]{"河南", "郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源"}; 
	       String[] a17 = new String[]{"湖北", "武汉|宜昌|荆州|襄樊|黄石|荆门|黄冈|十堰|恩施|潜江|天门|仙桃|随州|咸宁|孝感|鄂州"}; 
	       String[] a18= new String[]{"湖南", "长沙|常德|株洲|湘潭|衡阳|岳阳|邵阳|益阳|娄底|怀化|郴州|永州|湘西|张家界"}; 
	       String[] a19 = new String[]{"广东", "广州|深圳|珠海|汕头|东莞|中山|佛山|韶关|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|潮州|揭阳|云浮"}; 
	       String[] a20= new String[]{"广西", "南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|南宁地区|柳州地区|贺州|百色|河池"}; 
	       String[] a21= new String[]{"海南", "海口|三亚"}; 
	       String[] a22= new String[]{"四川", "成都|绵阳|德阳|自贡|攀枝花|广元|内江|乐山|南充|宜宾|广安|达川|雅安|眉山|甘孜|凉山|泸州"}; 
	       String[] a23 = new String[]{"贵州", "贵阳|六盘水|遵义|安顺|铜仁|黔西南|毕节|黔东南|黔南"}; 
	       String[] a24= new String[]{"云南", "昆明|大理|曲靖|玉溪|昭通|楚雄|红河|文山|思茅|西双版纳|保山|德宏|丽江|怒江|迪庆|临沧"}; 
	       String[] a25= new String[]{"西藏", "拉萨|日喀则|山南|林芝|昌都|阿里|那曲"}; 
	       String[] a26 = new String[]{"陕西", "西安|宝鸡|咸阳|铜川|渭南|延安|榆林|汉中|安康|商洛"}; 
	       String[] a27= new String[]{"甘肃", "兰州|嘉峪关|金昌|白银|天水|酒泉|张掖|武威|定西|陇南|平凉|庆阳|临夏|甘南"}; 
	       String[] a28= new String[]{"宁夏", "银川|石嘴山|吴忠|固原"}; 
	       String[] a29 = new String[]{"青海", "西宁|海东|海南|海北|黄南|玉树|果洛|海西"}; 
	       String[] a30= new String[]{"新疆", "乌鲁木齐|石河子|克拉玛依|伊犁|巴音郭勒|昌吉|克孜勒苏柯尔克孜|博尔塔拉|吐鲁番|哈密|喀什|和田|阿克苏"}; 
	       String[] a31= new String[]{"香港", ""}; 
	       String[] a32= new String[]{"澳门", ""}; 
	       String[] a33 = new String[]{"台湾", "台北|高雄|台中|台南|屏东|南投|云林|新竹|彰化|苗栗|嘉义|花莲|桃园|宜兰|基隆|台东|金门|马祖|澎湖"}; 
	       String[] a34 = new String[]{"其它", "北美洲|南美洲|亚洲|非洲|欧洲|大洋洲"}; 
	    	  
	       List list = new ArrayList(Arrays.asList(a0));
	       list.addAll(Arrays.asList(a1));
	       list.addAll(Arrays.asList(a2));
	       list.addAll(Arrays.asList(a3));
	       list.addAll(Arrays.asList(a4));
	       list.addAll(Arrays.asList(a5));
	       list.addAll(Arrays.asList(a6));
	       list.addAll(Arrays.asList(a7));
	       list.addAll(Arrays.asList(a8));
	       list.addAll(Arrays.asList(a9));
	       list.addAll(Arrays.asList(a10));
	       list.addAll(Arrays.asList(a11));
	       list.addAll(Arrays.asList(a12));
	       list.addAll(Arrays.asList(a13));
	       list.addAll(Arrays.asList(a14));
	       list.addAll(Arrays.asList(a15));
	       list.addAll(Arrays.asList(a16));
	       list.addAll(Arrays.asList(a17));
	       list.addAll(Arrays.asList(a18));
	       list.addAll(Arrays.asList(a19));
	       list.addAll(Arrays.asList(a20));
	       list.addAll(Arrays.asList(a21));
	       list.addAll(Arrays.asList(a22));
	       list.addAll(Arrays.asList(a23));
	       list.addAll(Arrays.asList(a24));
	       list.addAll(Arrays.asList(a25));
	       list.addAll(Arrays.asList(a26));
	       list.addAll(Arrays.asList(a27));
	       list.addAll(Arrays.asList(a28));
	       list.addAll(Arrays.asList(a29));
	       list.addAll(Arrays.asList(a30));
	       list.addAll(Arrays.asList(a31));
	       list.addAll(Arrays.asList(a32));
	       list.addAll(Arrays.asList(a33));
	       list.addAll(Arrays.asList(a34));
	       for (int i = 0; i < list.size(); i++) {
			   
	    	   if(i%2==0)
	    	   System.out.println(list.get(i));
	    	   else{
	    		   String[] d = (list.get(i)+"").split("\\|");
	               for (int f = 0; f < d.length; f++) {
					System.out.println(d[f]);
	               }
	    	   }
            
		}
	    		 
			  
	 }
}
