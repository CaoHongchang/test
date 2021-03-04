package com.i84.earnpoint.common;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.i84.earnpoint.model.OfficialInfo;
import com.i84.earnpoint.model.RewardsInfo;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.WorkInfo;

public class TextUtil {

	static Random random = new Random();
	static {
		random.setSeed(System.currentTimeMillis());
	}

	/**
	 * function:将数据库中的bigdecimal转化为long
	 *
	 * @param pram
	 * @return
	 * @author wangb
	 */
	public static long getLong(Object pram) {

		if (pram != null) {

			BigDecimal bg = new BigDecimal(pram + "");
			return bg.longValue();
		}
		return 0;

	}

	/**
	 * function:将数据库中的bigdecimal转化为long
	 *
	 * @param pram
	 * @return
	 * @author wangb
	 */
	public static short getShort(Object pram) {

		if (pram != null) {

			BigDecimal bg = new BigDecimal(pram + "");
			return bg.shortValue();
		}
		return 0;

	}

	/**
	 * function:将数据库中的bigdecimal转化为Long
	 *
	 * @param pram
	 * @return
	 * @author wangb
	 */
	public static Long getOlong(Object pram) {

		if (pram != null) {

			BigDecimal bg = new BigDecimal(pram + "");
			return new Long(bg.longValue());
		}
		return null;

	}

	/**
	 * function:将数据库中的string类型进行null处理
	 *
	 * @param pram
	 * @return
	 * @author wangb
	 */
	public static String getString(Object pram) {

		if (pram == null) {
			return "";
		} else {
			return pram + "";
		}
	}

	/**
	 * function:将数据库中的时间转化为String类型
	 *
	 * @param pram
	 * @return
	 * @author wangb
	 */
	public static String getDateFormate(Object pram) {

		if (pram != null) {
			// java.sql.Date ts = (java.sql.Date)pram;
			Timestamp ts = (Timestamp) pram;

			long date = ts.getTime();

			Date jdate = new Date(date);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			String str = df.format(jdate);

			return str;
		} else {

			return "";
		}

	}

	/**
	 * 
	 */
	public static String getLongDateTime(Date d) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return df.format(d);
		} catch (Exception e) {
			return "";
		}

	}

	/**
	 * String转date yyyy-MM-dd HH:mm:ss
	 * 
	 * @param d
	 * @param format
	 *            默认yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Date getDateFormate(String d, String format) {
		Date date = null;
		try {
			if (StringUtils.isBlank(format)) {
				format = "yyyy-MM-dd HH:mm:ss";
			}
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			date = sdf.parse(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		return date;
	}

	/**
	 * function:将string 类型转换为short类型
	 *
	 * @param obj
	 * @return
	 * @author wangb
	 */
	public static short getShort(String obj) {

		if (obj != null && !"".equals(obj)) {

			return Short.parseShort(obj);
		}

		return 0;

	}

	/**
	 * function:将string 类型转换为short类型
	 *
	 * @param obj
	 * @return
	 * @author wangb
	 */
	public static Short getOshort(String obj) {

		if (obj != null && !"".equals(obj) && !"undefined".equals(obj)) {

			return new Short(Short.parseShort(obj));
		}

		return null;

	}

	public static Long getLong(String obj) {

		if (obj != null && !"".equals(obj)) {

			return new Long(Long.parseLong(obj));
		}

		return null;

	}

	public static int getInt(String obj) {

		if (obj != null && !"".equals(obj) && !"null".equals(obj)) {

			return Integer.parseInt(obj);
		}

		return 0;

	}

	public static float getFloat(String obj) {

		if (obj != null && !"".equals(obj) && !"null".equals(obj)) {

			return Float.parseFloat(obj);
		}

		return 0;
	}

	/**
	 * function:将blob转化为string类型
	 *
	 * @param blob
	 * @return
	 * @author wangb
	 */
	public static String getContentString(Blob blob) {

		try {

			BufferedInputStream bi = new BufferedInputStream(
					blob.getBinaryStream());
			byte[] data = new byte[(int) blob.length()];
			String outfile = "";
			bi.read(data);
			outfile = new String(data);
			bi.close();
			return outfile;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	// /**
	// *function:解析json对象
	// *
	// *@param req
	// *@return
	// *@throws IOException
	// *@author wangb
	// */
	// public static Map getJsonMap(HttpServletRequest req) throws IOException {
	//
	// final int BUFFER_SIZE = 8 * 1024;
	// byte[] buffer = new byte[BUFFER_SIZE];
	// ServletInputStream sis = req.getInputStream();
	// int length = 0;
	// ByteArrayOutputStream baos = new ByteArrayOutputStream();
	// do {
	// length = sis.read(buffer);
	// if (length > 0) {
	// baos.write(buffer, 0, length);
	// }
	// } while (length != -1);
	// String bodyData = new String(baos.toByteArray(), "GBK");
	//
	// return JsonUtil.toMap(bodyData);
	// }

	/**
	 * function:将string 类型转换为BigDecimal类型
	 *
	 * @param obj
	 * @return
	 * @author wangb
	 */
	public static BigDecimal getBigDecimal(String obj) {

		if (obj != null && !"".equals(obj)) {

			return new BigDecimal(obj);
		}
		// else{

		// return new BigDecimal("");
		// }
		return null;
	}

	/**
	 * function:将string 转为Integer
	 *
	 * @param obj
	 * @return
	 * @author wangb
	 */
	public static Integer getOInteger(String obj) {

		if (obj != null && !"".equals(obj)) {

			return new Integer(obj);
		}
		return null;
	}

	/**
	 * Integer转化成长度为l的字符串
	 * 
	 * @param no
	 * @param l
	 * @return
	 */
	public static String getSNumber(Integer no, int l) {
		if (no == null) {
			return "";
		} else {
			StringBuffer sn = new StringBuffer(no.toString());
			if (sn.length() < l) {
				int t_l = l - sn.length();
				for (int i = 0; i < t_l; i++) {
					sn.insert(0, 0);
				}
			}
			return sn.toString();
		}
	}

	public static void main(String[] args) {
		System.out.println(getSNumber(1, 10));
	}

	/**
	 * function:获取xml属性
	 *
	 * @param data
	 * @author wangb
	 */
	public static List split(String data, String propertyName) {

		List resList = new ArrayList();
		data = data.toLowerCase();
		// Pattern pattern2 =
		// Pattern.compile("<customstate *?[^>]*?((>.*?</customstate>)|(/>))");
		Pattern pattern2 = Pattern.compile("<transition .*?/>");
		Matcher matcher2 = pattern2.matcher(data);
		while (matcher2.find()) {

			String data1 = matcher2.group();

			resList.add(getAttribute(data1, propertyName));
		}

		return resList;

	}

	/**
	 * function:获取xml属性
	 *
	 * @param data
	 * @author wangb
	 */
	public static List getNodeID(String data, String propertyName) {

		List resList = new ArrayList();
		// data = data.toLowerCase();
		// Pattern pattern2 =
		// Pattern.compile("<customstate *?[^>]*?((>.*?</customstate>)|(/>))");
		Pattern pattern2 = Pattern.compile("<task .*?>");
		Matcher matcher2 = pattern2.matcher(data);
		while (matcher2.find()) {

			String data1 = matcher2.group();

			resList.add(getAttribute(data1, propertyName));
		}

		return resList;

	}

	/**
	 * function:获取xml属性
	 *
	 * @param data
	 * @author wangb
	 */
	public static List getNode(String data, String property, String propertyName) {

		List resList = new ArrayList();
		// data = data.toLowerCase();
		// Pattern pattern2 =
		// Pattern.compile("<customstate *?[^>]*?((>.*?</customstate>)|(/>))");
		Pattern pattern2 = Pattern.compile("<" + property + " .*?>");
		Matcher matcher2 = pattern2.matcher(data);
		while (matcher2.find()) {

			String data1 = matcher2.group();

			resList.add(getAttribute(data1, propertyName));
		}

		return resList;

	}

	// public String getParameter(String data)
	// {
	// String result="";
	// StringBuffer reStr=new StringBuffer();
	// reStr.append("<");
	// // reStr.append("(.*?)");
	// // reStr.append("</");
	// // reStr.append(para);
	// // reStr.append(">");
	// Pattern pattern=Pattern.compile(reStr.toString());
	// Matcher matcher=pattern.matcher(data);
	// if(matcher.find())
	// {
	// result=matcher.group(1);
	// }
	// return result;
	// }

	/**
	 * 在给定的元素中获取指定属性的值.该元素应该从getElementsByTag方法中获取
	 * 
	 * @param elementString
	 *            String
	 * @param attributeName
	 *            String
	 * @return String
	 */
	public static String getAttribute(String elementString, String attributeName) {

		Pattern p = Pattern.compile("<[^>]+>");
		Matcher m = p.matcher(elementString);
		String tmp = m.find() ? m.group() : "";
		p = Pattern.compile("(" + attributeName + "+)\\s*=\\s*\"([^\"]+)\"");
		m = p.matcher(tmp);
		while (m.find()) {
			return m.group(2);
		}
		return "";
	}

	/**
	 * function:将obj转为int
	 *
	 * @param obj
	 * @return
	 * @author wangb
	 */
	public static int getInt(Object obj) {

		if (obj != null && !"null".equals(obj)) {
			String intValue = obj + "";
			if (!"".equals(intValue) && intValue != null) {
				return Integer.parseInt(intValue);
			}

		}
		return 0;
	}

	public static String replaceXmlAttribute(String xmlData,
			String fromAttribute, String toAttribute, String fromArg,
			String toArg) {

		if (xmlData != null && !"".equals(xmlData)) {

			xmlData = xmlData.replaceAll("" + fromAttribute + "=\"" + fromArg
					+ "\"", "" + toAttribute + "=\"" + toArg + "\"");
		}
		return xmlData;
	}

	/**
	 * function:将数据库中的bigdecimal转化为Long
	 *
	 * @param pram
	 * @return
	 * @author wangb
	 */
	public static int getBD2Int(Object pram) {

		if (pram != null) {

			BigDecimal bg = new BigDecimal(pram + "");
			return bg.intValue();
		}
		return 0;

	}

	/**
	 * function:判断字符长短
	 *
	 * @param arg
	 * @param maxSize
	 * @return
	 * @throws java.io.UnsupportedEncodingException
	 * @author wangb
	 */
	public static Map checkFrontNum(String arg, int maxSize)
			throws UnsupportedEncodingException {

		Map map = new HashMap();
		if (arg != null && !"".equals(arg)) {

			byte[] b = arg.getBytes("GBK");

			if (maxSize < b.length) {

				int overLength = b.length - maxSize;
				map.put("overFlag", "1");
				map.put("overLength", overLength);
				return map;
			}
			map.put("overFlag", "0");
			return map;
		}
		map.put("overFlag", "0");
		return map;

	}

	/**
	 * function:file读到byte[]
	 *
	 * @param file
	 * @return
	 * @throws java.io.IOException
	 * @author wangb
	 */
	private static byte[] getBytesFromFile(File file) throws IOException {
		// file size
		long length = file.length();
		InputStream is = null;
		is = new BufferedInputStream(new FileInputStream(file));
		if (length > Integer.MAX_VALUE) {
			throw new IOException("File is to large " + file.getName());
		}
		byte[] bytes = new byte[(int) length];
		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length
				&& (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}
		if (offset < bytes.length) {
			throw new IOException("Could not completely read file "
					+ file.getName());
		}
		is.close();
		return bytes;

	}

	/**
	 * function:inputstream to byte
	 *
	 * @param is
	 * @return
	 * @throws java.io.IOException
	 * @author wangb
	 */
	public static byte[] InputStreamToByte(InputStream is) throws IOException {

		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
		int ch;
		while ((ch = is.read()) != -1) {
			bytestream.write(ch);
		}
		byte imgdata[] = bytestream.toByteArray();
		bytestream.close();
		return imgdata;
	}

	/**
	 * 
	 * function:Object转Long,如果Object为空或者为0,返回NULL
	 * 
	 * @param o
	 * @return
	 * @author wangjs 2011-5-11
	 */
	public static Long getLongValue(Object o) {

		if (o == null || "".equals(o) || "0".equals(o + "")) {
			return null;
		}
		return Long.valueOf(o + "");
	}

	/**
	 * 
	 * @param total
	 *            红包总额
	 * @param count
	 *            红包个数
	 * @param max
	 *            每个小红包的最大额
	 * @param min
	 *            每个小红包的最小额
	 * @return 存放生成的每个小红包的值的数组
	 */
	public static long[] generate(long total, int count, long max, long min) {
		long[] result = new long[count];

		long average = total / count;

		long a = average - min;
		long b = max - min;

		//
		// 这样的随机数的概率实际改变了，产生大数的可能性要比产生小数的概率要小。
		// 这样就实现了大部分红包的值在平均数附近。大红包和小红包比较少。
		long range1 = sqr(average - min);
		long range2 = sqr(max - average);

		for (int i = 0; i < result.length; i++) {
			// 因为小红包的数量通常是要比大红包的数量要多的，因为这里的概率要调换过来。
			// 当随机数>平均值，则产生小红包
			// 当随机数<平均值，则产生大红包
			if (nextLong(min, max) > average) {
				// 在平均线上减钱
				// long temp = min + sqrt(nextLong(range1));
				long temp = min + xRandom(min, average);
				result[i] = temp;
				total -= temp;
			} else {
				// 在平均线上加钱
				// long temp = max - sqrt(nextLong(range2));
				long temp = max - xRandom(average, max);
				result[i] = temp;
				total -= temp;
			}
		}
		// 如果还有余钱，则尝试加到小红包里，如果加不进去，则尝试下一个。
		while (total > 0) {
			for (int i = 0; i < result.length; i++) {
				if (total > 0 && result[i] < max) {
					result[i]++;
					total--;
				}
			}
		}
		// 如果钱是负数了，还得从已生成的小红包中抽取回来
		while (total < 0) {
			for (int i = 0; i < result.length; i++) {
				if (total < 0 && result[i] > min) {
					result[i]--;
					total++;
				}
			}
		}
		return result;
	}

	static long xRandom(long min, long max) {
		return sqrt(nextLong(sqr(max - min)));
	}

	static long sqrt(long n) {
		// 改进为查表？
		return (long) Math.sqrt(n);
	}

	static long sqr(long n) {
		// 查表快，还是直接算快？
		return n * n;
	}

	static long nextLong(long n) {
		return random.nextInt((int) n);
	}

	static long nextLong(long min, long max) {
		return random.nextInt((int) (max - min + 1)) + min;
	}

	/**
	 * 随机指定范围内N个不重复的数 在初始化的无重复待选数组中随机产生一个数放入结果中，
	 * 将待选数组被随机到的数，用待选数组(len-1)下标对应的数替换 然后从len-2里随机产生下一个随机数，如此类推
	 * 
	 * @param max
	 *            指定范围最大值
	 * @param min
	 *            指定范围最小值
	 * @param n
	 *            随机数个数
	 * @return int[] 随机数结果集
	 */
	public static int[] randomArray(int min, int max, int n) {
		int len = max - min + 1;

		if (max < min || n > len) {
			return null;
		}

		// 初始化给定范围的待选数组
		int[] source = new int[len];
		for (int i = min; i < min + len; i++) {
			source[i - min] = i;
		}

		int[] result = new int[n];
		Random rd = new Random();
		int index = 0;
		for (int i = 0; i < result.length; i++) {
			// 待选数组0到(len-2)随机一个下标
			index = Math.abs(rd.nextInt() % len--);
			// 将随机到的数放入结果集
			result[i] = source[index];
			// 将待选数组中被随机到的数，用待选数组(len-1)下标对应的数替换
			source[index] = source[len];
		}
		return result;
	}

	public static String generateName() {

		String[] name1 = { "赵", "钱", "孙", "李", "李", "李", "李", "李", "李", "李",
				"李", "李", "李", "李", "李", "李", "李", "李", "李", "李", "李", "李",
				"李", "李", "李", "李", "李", "李", "李", "李", "李", "李", "李", "李",
				"李", "李", "李", "李", "李", "李", "李", "李", "李", "李", "李", "李",
				"李", "李", "李", "周", "吴", "吴", "吴", "吴", "吴", "吴", "吴", "吴",
				"吴", "吴", "吴", "吴", "吴", "吴", "吴", "吴", "吴", "吴", "吴", "吴",
				"吴", "吴", "吴", "吴", "吴", "郑", "王", "冯", "陈", "诸", "卫", "蒋",
				"沈", "韩", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨",
				"杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨",
				"杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨",
				"杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨",
				"杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨", "杨",
				"杨", "杨", "杨", "王", "王", "王", "王", "王", "王", "王", "王", "王",
				"王", "王", "王", "王", "王", "王", "王", "王", "王", "王", "王", "王",
				"王", "王", "王", "王", "王", "王", "王", "王", "王", "王", "王", "王",
				"王", "王", "王", "王", "王", "张", "张", "张", "张", "张", "张", "张",
				"张", "于", "于", "于", "于", "于", "于", "于", "于", "于", "于", "于",
				"于", "于", "于", "于", "于", "余", "余", "余", "余", "余", "余", "余",
				"余", "余", "余", "余", "余", "余", "余", "余", "余", "张", "张", "张",
				"张", "张", "张", "张", "张", "张", "张", "张", "张", "张", "张", "张",
				"张", "张", "张", "陈", "陈", "陈", "陈", "陈", "陈", "陈", "陈", "陈",
				"陈", "陈", "陈", "陈", "陈", "朱", "秦", "尤", "许", "何", "吕", "施",
				"张", "孔", "曹", "严", "华", "金", "魏", "陶", "姜", "戚", "谢", "邹",
				"喻", "柏", "水", "窦", "章", "云", "苏", "潘", "葛", "奚", "范", "彭",
				"郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任", "袁",
				"柳", "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺", "倪",
				"汤", "滕", "殷", "罗", "毕", "郝", "邬", "安", "常", "乐", "于", "时",
				"傅", "皮", "卡", "齐", "康", "伍", "余", "元", "卜", "顾", "孟", "平",
				"黄", "和", "穆", "萧", "尹", "姚", "邵", "堪", "汪", "祁", "毛", "禹",
				"狄", "米", "贝", "明", "臧", "计", "伏", "成", "戴", "谈", "宋", "茅",
				"庞", "熊", "纪", "舒", "屈", "项", "祝", "董", "粱", "杜", "阮", "蓝",
				"闵", "席", "季", "麻", "强", "贾", "路", "娄", "危", "江", "童", "颜",
				"郭", "梅", "盛", "林", "刁", "钟", "徐", "邱", "骆", "高", "夏", "蔡",
				"田", "樊", "胡", "凌", "霍", "虞", "万", "支", "柯", "咎", "管", "卢",
				"莫", "经", "房", "裘", "缪", "干", "解", "应", "宗", "丁", "宣", "贲",
				"邓", "郁", "单", "杭", "洪", "包", "诸", "左", "石", "崔", "吉", "钮",
				"龚", "程", "嵇", "邢", "滑", "裴", "陆", "荣", "翁", "荀", "羊", "於",
				"惠", "甄", "魏", "家", "封", "芮", "羿", "储", "靳", "汲", "邴", "糜",
				"松", "井", "段", "富", "巫", "乌", "焦", "巴", "弓", "牧", "隗", "山",
				"谷", "车", "侯", "宓", "蓬", "全", "郗", "班", "仰", "秋", "仲", "伊",
				"宫", "宁", "仇", "栾", "暴", "甘", "钭", "厉", "戎", "祖", "武", "符",
				"刘", "景", "詹", "束", "龙", "司马", "上官", "欧阳", "夏侯", "诸葛", "东方",
				"尉迟", "公孙", "长孙", "慕容", "司徒", "西门" };

		String[] name2 = { "超", "媛", "念", "立", "思", "嘉", "雨", "伟", "权", "秋",
				"佩", "雅", "联", "如", "渠", "保", "室", "铜", "梧", "胤", "昱", "佳",
				"伊", "校", "诗", "节", "如", "阁", "耕", "宫", "古", "谷", "观", "桂",
				"贵", "国", "广", "冠", "汉", "翰", "航", "杭", "海", "豪", "浩", "皓",
				"和", "河", "贺", "恒", "弘", "虹", "宏", "红", "厚", "鹄", "虎", "华",
				"欢", "怀", "辉", "惠", "会", "奇", "吉", "骥", "嘉", "佳", "甲", "稼",
				"江", "坚", "剑", "锦", "经", "镜", "界", "竞", "介", "京", "建", "净",
				"精", "敬", "静", "靖", "津", "进", "菁", "景", "炯", "驹", "举", "炬",
				"君", "俊", "军", "骏", "郡", "峻", "恺", "楷", "康", "可", "克", "珂",
				"逵", "魁", "阔", "昆", "奎", "宽", "况", "乐", "雷", "岭", "廉", "霖",
				"麟", "灵", "利", "良", "联", "烈", "罗", "陵", "梁", "立", "礼", "力",
				"莉", "烁", "隆", "龙", "禄", "璐", "露", "律", "茂", "梦", "密", "铭",
				"明", "绵", "妙", "默", "木", "能", "年", "宁", "念", "怒", "庞", "佩",
				"培", "朋", "鹏", "屏", "平", "魄", "珀", "璞", "奇", "琦", "齐", "启",
				"谦", "乾", "茜", "倩", "芹", "琴", "青", "卿", "秋", "权", "求", "情",
				"渠", "全", "荃", "群", "泉", "然", "让", "仁", "任", "荣", "儒", "锐",
				"若", "瑞", "三", "瑟", "森", "韶", "绍", "尚", "商", "珊", "善", "生",
				"升", "声", "晟", "胜", "盛", "诗", "时", "石", "实", "凇", "慎", "设",
				"守", "随", "世", "寿", "仕", "余", "帅", "双", "朔", "硕", "水", "誓",
				"适", "书", "舒", "殊", "顺", "思", "嗣", "似", "松", "颂", "素", "岁",
				"棠", "泰", "腾", "添", "铁", "同", "桐", "童", "彤", "团", "涂", "图",
				"土", "万", "旺", "望", "王", "闻", "威", "薇", "嵬", "伟", "卫", "蔚",
				"文", "微", "巍", "玮", "为", "畏", "吾", "午", "西", "熙", "玺", "仙",
				"先", "孝", "湘", "祥", "行", "献", "享", "效", "兴", "夏", "宣", "协",
				"向", "校", "轩", "瑕", "衔", "筱", "羡", "相", "香", "贤", "翔", "杏",
				"新", "信", "幸", "心", "星", "绣", "秀", "欣", "鑫", "兴", "行", "雄",
				"许", "炫", "雪", "学", "旭", "璇", "勋", "萱", "迅", "亚", "雅", "扬",
				"耀", "彦", "延", "岩", "炎", "永", "砚", "演", "焱", "洋", "阳", "曜",
				"耀", "夜", "译", "逸", "伊", "义", "艺", "意", "异", "怡", "翼", "毅",
				"银", "瑛", "仪", "易", "寅", "印", "苡", "野", "业", "英", "璎", "盈",
				"颖", "影", "雍", "勇", "悠", "由", "游", "佑", "友", "瑜", "遇", "玉",
				"岳", "元", "宇", "愚", "钰", "裕", "郁", "于", };

		int len1 = name1.length - 1;
		int len2 = name2.length - 1;
		int random1 = (int) (Math.random() * len1);
		int random2 = (int) (Math.random() * len2);
		int random2_1 = (int) (Math.random() * len2);

		String name = "";
		if (random1 < 256) {
			int randomN = (int) (Math.random() * 2);
			if (randomN == 1) {
				name = name1[random1] + name2[random2];
			} else {
				name = name1[random1] + name2[random2] + name2[random2_1];
			}
		} else {
			name = name1[random1] + name2[random2] + name2[random2_1];
		}

		return name;
	}

	public static String check(String str) {
		if (str == null)
			return "";
		return str.replaceAll(".*([';]+|(--)+).*", "");
	}

	public static String getArg(String UserAgent, String name) {
		// 解决中文文件名乱码问题
		try {
			if (UserAgent.toLowerCase().indexOf("firefox") > 0) {

				name = new String(name.getBytes("ISO8859-1"), "UTF-8");// 谷歌
				// firefox浏览器
			} else if (UserAgent.toUpperCase().indexOf("CHROME") > 0) {
				name = new String(name.getBytes("ISO8859-1"), "UTF-8");// 谷歌
			} else {
				name = new String(name.getBytes("iso-8859-1"), "gbk");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;

	}

	/**
	 * 获取访问用户的客户端IP（适用于公网与局域网）.
	 */
	public static String getIpAddr(HttpServletRequest request) {

		String ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();

			// 这里主要是获取本机的ip,可有可无
			if (ipAddress.equals("127.0.0.1")
					|| ipAddress.endsWith("0:0:0:0:0:0:1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}

		}

		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		// 或者这样也行,对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		// return
		// ipAddress!=null&&!"".equals(ipAddress)?ipAddress.split(",")[0]:null;
		return ipAddress;

	}

	public List<Map<String, String>> getFiledsInfo(Object o) {

		Field[] fields = o.getClass().getDeclaredFields();
		String[] fieldNames = new String[fields.length];
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (int i = 0; i < fields.length; i++) {
			Map<String, String> infoMap = new HashMap<String, String>();

			infoMap.put("type", fields[i].getType().toString());
			infoMap.put(fields[i].getName() + "",
					getFieldValueByName(fields[i].getName(), o) + "");
			// System.out.println(fields[i].getName()+"|"+getFieldValueByName(fields[i].getName(),
			// o));
			infoMap.put("king", getName(o, fields[i].getName() + ""));
			list.add(infoMap);
		}

		// Field[] fields =o.getClass().getDeclaredFields();
		// //String[] fieldNames = new String[fields.length];
		// List list = new ArrayList();
		// for(Field field:fields){
		// // Annotation[] annotations=field.getDeclaredAnnotations();
		// //System.out.println(annotations.length);
		// // for(Annotation annotation:annotations){
		// //判断注解对象是不是SelfAnnotation类型的
		// // if(annotation.annotationType()==javax.persistence.Column.class){
		// //System.out.println(getName(o,field.getName()+"")+"|"+field.getName()+"|"+getFieldValueByName(field.getName(),
		// o));
		//
		// //String beanName=((javax.persistence.Column) annotation).name();
		// Map infoMap = new HashMap();
		// infoMap.put("type", field.getType().toString());
		// infoMap.put(field.getName(), getFieldValueByName(field.getName(),
		// o));
		// infoMap.put("king", getName(o,field.getName()+""));
		// list.add(infoMap);
		// //System.out.println(beanName);
		// //System.out.println(field.getName());
		// // }
		// // }
		//
		// }
		return list;
	}

	public String getName(Object o, String field) {

		if (o instanceof UserInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("name".equals(field))
				return "名称";
			else if ("pnum".equals(field))
				return "身份证";
			else if ("tel".equals(field))
				return "手机";
			else if ("pwd".equals(field))
				return "密码";
			else if ("sex".equals(field))
				return "性别";
			else if ("pid".equals(field))
				return "入录人";
			else if ("addDate".equals(field))
				return "入录时间";
			else if ("daId".equals(field))
				return "档案所在地";
			else if ("workTime".equals(field))
				return "参加工作时间";
			else if ("mz".equals(field))
				return "民族";
			else if ("zzmm".equals(field))
				return "政治面貌";
			else if ("school".equals(field))
				return "毕业院校";
			else if ("graduationTime".equals(field))
				return "毕业时间";
			else if ("major".equals(field))
				return "所学专业";
			else if ("degree".equals(field))
				return "文化程度";
			else if ("domicile".equals(field))
				return "户籍地";
			else if ("adr".equals(field))
				return "联系地址";
			else if ("gTel".equals(field))
				return "固定电话";
			else if ("email".equals(field))
				return "电子邮箱";
			else if ("household".equals(field))
				return "户籍性质";
			else if ("domicilePlace".equals(field))
				return "户籍所在地";
			else if ("bankId".equals(field))
				return "开户银行";
			else if ("bankNum".equals(field))
				return "银行帐号";
			else if ("technical".equals(field))
				return "技术职称";
			else if ("teLevel".equals(field))
				return "职业等级";
			else if ("job".equals(field))
				return "执（职）业资格";
			else if ("getTime".equals(field))
				return "获取时间";
			else if ("partyName".equals(field))
				return "党派";
			else if ("birthDate".equals(field))
				return "生日";
			else if ("remark".equals(field))
				return "备注";
			else if ("workName".equals(field))
				return "工作单位";
			else if ("placeName".equals(field))
				return "职位";
			else if ("partName".equals(field))
				return "部门";
			else if ("oldName".equals(field))
				return "曾用名";
			else if ("jgName".equals(field))
				return "籍贯";
			else if ("maritalStatus".equals(field))
				return "婚姻状况";
			else if ("imgUrl".equals(field))
				return "照片";
			else if ("qq".equals(field))
				return "qq";
			else if ("wx".equals(field))
				return "微信";
			else if ("delDate".equals(field))
				return "删除时间";
			else if ("mb1".equals(field))
				return "密保1";
			else if ("mbda1".equals(field))
				return "密保答案1";
			else if ("mb2".equals(field))
				return "密保2";
			else if ("mbda2".equals(field))
				return "密保答案2";
			else if ("mb3".equals(field))
				return "密保3";
			else if ("mbda3".equals(field))
				return "密保答案3";
			else if ("dPoint".equals(field))
				return "单位属性";
			else if ("zNo".equals(field))
				return "证书编号";
			else if ("zipCode".equals(field))
				return "邮政编码";
			else if ("formPlace".equals(field))
				return "单位所属地区";
			else if ("dpno".equals(field))
				return "档案编号";
			else if ("zDate".equals(field))
				return "时间";
			else if ("dState".equals(field))
				return "状态";
			else if ("errMsg".equals(field))
				return "错误信息";
		} else if (o instanceof OfficialInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("pLevel".equals(field))
				return "级别";
			else if ("pMethod".equals(field))
				return "评审方式";
			else if ("proZName".equals(field))
				return "专业技术资格名称";
			else if ("proName".equals(field))
				return "专业名称";
			else if ("departmentId".equals(field))
				return "审批部门";
			else if ("remark".equals(field))
				return "备注";
			else if ("pzNo".equals(field))
				return "批准文号";
			else if ("pzDate1".equals(field))
				return "批准日期";
			else if ("pDate".equals(field))
				return "入录时间";
			else if ("pUid".equals(field))
				return "入录人";
			else if ("delDate".equals(field))
				return "删除时间";
			else if ("uid".equals(field))
				return "用户id";

		} else if (o instanceof RewardsInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("uid".equals(field))
				return "用户id";
			else if ("rewardName".equals(field))
				return "奖惩名称";
			else if ("enName".equals(field))
				return "奖惩批准机关";
			else if ("pzDate".equals(field))
				return "奖惩批准日期";
			else if ("cxDate".equals(field))
				return "奖惩撤销日期";
			else if ("pDate".equals(field))
				return "入录时间";
			else if ("pUid".equals(field))
				return "入录人";
			else if ("delDate".equals(field))
				return "删除时间";

		} else if (o instanceof StudyInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("uid".equals(field))
				return "用户id";
			else if ("studyTypeId".equals(field))
				return "教育类别";
			else if ("schoolName".equals(field))
				return "学校名称";
			else if ("inDate".equals(field))
				return "入学日期";
			else if ("graduationDate".equals(field))
				return "毕业日期";
			else if ("education".equals(field))
				return "学历";
			else if ("degree".equals(field))
				return "学位";
			else if ("certificate".equals(field))
				return "证书名称";
			else if ("delDate".equals(field))
				return "删除时间";
			else if ("proName".equals(field))
				return "所学专业";
			else if ("xz".equals(field))
				return "学制";
			else if ("getMethod".equals(field))
				return "取得方式";
			else if ("activityId".equals(field))
				return "活动id";
			else if ("addDate".equals(field))
				return "入录时间";
			else if ("pid".equals(field))
				return "入录人";
		} else if (o instanceof StudyUpInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("uid".equals(field))
				return "用户id";
			else if ("trainingUnit".equals(field))
				return "培训单位";
			else if ("trainDate".equals(field))
				return "培训日期";
			else if ("outDate".equals(field))
				return "结业日期";
			else if ("trainNo".equals(field))
				return "证书编号";
			else if ("office".equals(field))
				return "发证机关";
			else if ("officeDate".equals(field))
				return "发证时间";
			else if ("delDate".equals(field))
				return "删除时间";
			else if ("studyTime".equals(field))
				return "学时";
			else if ("studyMethod".equals(field))
				return "学习形式";
			else if ("studyContent".equals(field))
				return "学习内容";
			else if ("activityId".equals(field))
				return "活动id";
			else if ("addDate".equals(field))
				return "入录时间";
			else if ("pid".equals(field))
				return "入录人";
		} else if (o instanceof UserMgInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("uid".equals(field))
				return "用户id";
			else if ("msgfrom".equals(field))
				return "最初信息来源";
			else if ("isState".equals(field))
				return "审核状态";
			else if ("smsg".equals(field))
				return "审核说明";
			else if ("dtype".equals(field))
				return "档案类别";
			else if ("dpno".equals(field))
				return "档案编号";
			else if ("isS".equals(field))
				return "是否派遣";
			else if ("bdUnit".equals(field))
				return "报道单位";
			else if ("spDate".equals(field))
				return "审批时间";
			else if ("unitAdr".equals(field))
				return "单位地址";
			else if ("bpno".equals(field))
				return "毕业证号";
			else if ("ctype".equals(field))
				return "从业工种";
			else if ("license".equals(field))
				return "上岗证";
			else if ("homeTel".equals(field))
				return "家庭电话";
			else if ("homeAdr".equals(field))
				return "家庭地址";
			else if ("homePost".equals(field))
				return "家庭住址邮编";
			else if ("myTel".equals(field))
				return "联系电话";
			else if ("myAdr".equals(field))
				return "通讯地址";
			else if ("myPost".equals(field))
				return "邮政编号";
			else if ("wifeName".equals(field))
				return "配偶姓名";
			else if ("wifeTel".equals(field))
				return "配偶联系电话";
			else if ("createDate".equals(field))
				return "建档时间";
			else if ("outDate".equals(field))
				return "退休时间";
			else if ("delDate".equals(field))
				return "删除时间";
			else if ("pointProxy".equals(field))
				return "单位代理";
			else if ("humanOut".equals(field))
				return "人事外包";
			else if ("isAd".equals(field))
				return "是否意向";
			else if ("pno".equals(field))
				return "系统编号";
			else if ("humanOut1".equals(field))
				return "人事外包单位";
			else if ("isS1".equals(field))
				return "是否派遣单位";
			else if ("pointProxy1".equals(field))
				return "单位代理单位";

		} else if (o instanceof WorkInfo) {
			if ("id".equals(field))
				return "序号";
			else if ("uid".equals(field))
				return "用户id";
			else if ("startDate".equals(field))
				return "起始时间";
			else if ("endDate".equals(field))
				return "终止时间";
			else if ("enterpriseId".equals(field))
				return "工作单位";
			else if ("departmentId".equals(field))
				return "所在部门";
			else if ("placeId".equals(field))
				return "岗位名称";
			else if ("addDate".equals(field))
				return "添加时间";
			else if ("pUid".equals(field))
				return "受理id";
			else if ("delDate".equals(field))
				return "删除时间";
			else if ("workAdr".equals(field))
				return "工作地点";
			else if ("workName".equals(field))
				return "从事工作";
			else if ("activityId".equals(field))
				return "活动id";
		}
		return "";
	}

	private Object getFieldValueByName(String fieldName, Object o) {
		try {
			String firstLetter = fieldName.substring(0, 1).toUpperCase();
			String getter = "get" + firstLetter + fieldName.substring(1);
			Method method = o.getClass().getMethod(getter, new Class[] {});
			Object value = method.invoke(o, new Object[] {});
			return value;
		} catch (Exception e) {
			// log.error(e.getMessage(),e);
			return null;
		}
	}

	public static String getStringNull(Object obj) {

		if (obj == null)
			return "";
		else
			return obj + "";
	}

}
