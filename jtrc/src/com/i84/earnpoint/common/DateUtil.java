package com.i84.earnpoint.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


public class DateUtil {
	public static final String DATE_SEPARATOR = "-/";
	static StringTokenizer sToken;
	public static final String dtLong                  = "yyyyMMddHHmmss";
	public DateUtil() {
	}
	 /**
     * 返回系统当前时间(精确到毫秒),作为一个唯一的订单编号
     * @return
     *      以yyyyMMddHHmmss为格式的当前系统时间
     */
	public  static String getOrderNum(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(dtLong);
		return df.format(date);
	}
	

	/**
	 * Date format: "YY"
	 */
	public static final String YY = "yy";

	/**
	 * Date format: "YYYY"
	 */
	public static final String YYYY = "yyyy";

	/**
	 * Date format: "MM"
	 */
	public static final String MM = "MM";

	/**
	 * Date format: "DD"
	 */
	public static final String DD = "dd";

	/**
	 * Date format: "MM/DD"
	 */
	public static final String MM_DD = "MM/dd";

	/**
	 * Date format: "YYYYMM"
	 */
	public static final String YYYYMM = "yyyyMM";

	public static final String YYYYMMDD = "yyyyMMdd";

	/**
	 * Date format: "YYYY/MM"
	 */
	public static final String YYYY_MM = "yyyy/MM";

	/**
	 * Date format: "YY/MM/DD"
	 */
	public static final String YY_MM_DD = "yy/MM/dd";

	/**
	 * Date format: "YYYY/MM/DD"
	 */
	public static final String YYYY_MM_DD = "yyyy/MM/dd";

	/**
	 * Date format: "YYYY-MM-DD"
	 */
	public static final String OYYYY_MM_DD = "yyyy-MM-dd";
	
	public static final String OYYYY_MM_DD_HH_MI_SS = "yyyy-MM-dd HH:mm:ss";
	public static final String OYYYY_MM_DD_HH_MI = "yyyy-MM-dd HH:mm";
	
	/**
	 * Date format: "YYYY-MM-DD"
	 */
	public static final String OYYYY_MM = "yyyy-MM";
	/**
	 * Date format: "HH:MI"
	 */
	public static final String HH_MI = "HH:mm";

	/**
	 * Date format: "HHMI"
	 */
	public static final String HHMI = "HHmm";

	/**
	 * Date format: "YY/MM/DD HH:MI"
	 */
	public static final String YY_MM_DD_HH_MI = "yy/MM/dd HH:mm";

	/**
	 * Date format: "YYYY/MM/DD HH:MI:SS"
	 */
	public static final String YYYY_MM_DD_HH_MI = "yyyy/MM/dd HH:mm";

	/**
	 * Date format: "YYYY/MM/DD HH:MI:SS"
	 */
	public static final String YYYY_MM_DD_HH_MI_SS = "yyyy/MM/dd HH:mm:ss";

	/**
	 * Date format: "HH:MI:SS"
	 */
	public static final String HH_MI_SS = "HH:mm:ss";

	/**
	 * Date format: "YYYYMMDDHHMISS"
	 */
	public static final String YYYYMMDDHHMI = "yyyyMMddHHmm";

	/**
	 * Date format: "YYYYMMDDHHMISS"
	 */
	public static final String YYYYMMDDHHMISS = "yyyyMMddHHmmss";

	/**
	 * Date format YYYY年MM月DD日
	 */
	public static final String YYYY$MM$DD$ = "yyyy年MM月dd日";

	/**
	 * Date format YYYY年MM月
	 */
	public static final String YYYY$MM$ = "yyyy年MM月";

	/**
	 * Date format MM月DD日
	 */
	public static final String MM$DD$ = "MM月dd日";

	/**
	 * Date format DD日
	 */
	public static final String DD$ = "dd日";

	/**
	 * Date format: "YYYY/MM/DD HH:MI:SS"
	 */
	public static final String YYYY$MM$DD$_HH_MI_SS = "yyyy年MM月dd日 HH:mm:ss";

	// modified 2004/06/10 詳細情報修正
	/**
	 * Date format: "ERAYYMMDD"
	 */
	public static final String ERAYYMMDD = "ERAYYMMDD";

	/**
	 * Date format: "ERAYYMM"
	 */
	public static final String ERAYYMM = "ERAYYMM";

	/**
	 * Date format: "HH"
	 */
	public static final String HH = "HH";

	/**
	 * Date format: "MI"
	 */
	public static final String MI = "mm";

	/**
	 * Field value: Year
	 */
	public static final int YEAR = 1;

	/**
	 * Field value: Month
	 */
	public static final int MONTH = 2;

	/**
	 * Field value: Day
	 */
	public static final int DAY = 3;

	/**
	 * Field value: Hour
	 */
	public final static int HOUR = 10;

	/**
	 * Field value: Hour of Day
	 */
	public final static int HOUR_OF_DAY = 11;

	/**
	 * Field value: Minute
	 */
	public final static int MINUTE = 12;

	/**
	 * Field value: Second
	 */
	public final static int SECOND = 13;

	
	/**
	 * Date format: "YYMM"
	 */
	public static final String YYMM = "yyMM";


	
	/**
	 * Get current date
	 * 
	 * @return current date
	 */
	public static Date getCurrent() {
		Date currentDate = new Date();
		return currentDate;
	}

	/**
	 * Get current date
	 * 
	 * @return current date
	 */
	public static Date getCurrentdate() {
		String currentDate = DateUtil.getFormatDate(DateUtil.YYYYMMDD, new Date());
		Date date = DateUtil.getDate(DateUtil.YYYYMMDDHHMISS, currentDate + "000000");
		return date;
	}

	/**
	 * Function : Get current date end,such as 23:59:59
	 * 
	 * @return current date end
	 */
	public static Date getCurrentdateEnd() {
		String currentDate = DateUtil.getFormatDate(DateUtil.YYYYMMDD, new Date());
		Date date = DateUtil.getDate(DateUtil.YYYYMMDDHHMISS, currentDate + "235959");
		return date;
	}



	/**
	 * Get current month's first day
	 * 
	 * @return current month's first day
	 * 
	 */
	public static Date getCurrentMonth() {
		return getMonthFirstDay(new Date());
	}

	/**
	 * get the first day of month the date
	 * 
	 * @param date
	 * @return
	 */
	public static Date getMonthFirstDay(Date date) {
		String month = getFormatDate(DateUtil.YYYYMM, date) + "01";
		Date firstday = null;

		firstday = getDate(DateUtil.YYYYMMDD, month);

		return firstday;
	}

	/**
	 * get the end day of month the date
	 * 
	 * @param date
	 * @return
	 */
	public static Date getMonthEndDay(Date date) {
		Date endday = DateUtil.dateAdd(DateUtil.DAY, -1, DateUtil.dateAdd(DateUtil.MONTH, 1, getMonthFirstDay(date)));
		return endday;
	}


	/**
	 * 
	 * @param month
	 * @return
	 */
	public static Date getSelectMonth(String month) {
		SimpleDateFormat sdf;
		Date time = new Date();
		sdf = new SimpleDateFormat("yyyy");
		String date = sdf.format(time);
		date = date + "-" + month + "-01 00:00:00.0";
		sdf.applyPattern("yyyy-MM");
		Date curDate = null;
		try {
			curDate = sdf.parse(date);
		} catch (ParseException e) {
		}

		return curDate;
	}

	/**
	 * 
	 * @param birthday
	 * @return
	 */
	public static String getAge(String birthday) {
		if (birthday == null || "".equals(birthday))
			return "0";
		Date timenow = new Date();
		Date birth = null;

		birth = getDate(DateUtil.YYYYMMDD, birthday);
		int byear = Integer.parseInt(getFormatDate(DateUtil.YYYY, birth));
		int nyear = Integer.parseInt(getFormatDate(DateUtil.YYYY, timenow));
		int bmonth = Integer.parseInt(getFormatDate(DateUtil.MM, birth));
		int nmonth = Integer.parseInt(getFormatDate(DateUtil.MM, timenow));
		int age = nyear - byear;
		if (age < 0)
			return "0";
		if (nmonth < bmonth)
			age--;
		return String.valueOf(age);

	}

	/**
	 * 
	 * @param birthday
	 * @return
	 */
	public static String getAge(Date birthday) {

		if (birthday == null)
			return "0";
		Date timenow = new Date();
		int byear = Integer.parseInt(getFormatDate(DateUtil.YYYY, birthday));
		int nyear = Integer.parseInt(getFormatDate(DateUtil.YYYY, timenow));
		int bmonth = Integer.parseInt(getFormatDate(DateUtil.MM, birthday));
		int nmonth = Integer.parseInt(getFormatDate(DateUtil.MM, timenow));
		int age = nyear - byear;
		if (age < 0)
			return "0";
		if (nmonth < bmonth)
			age--;
		return String.valueOf(age);

	}

	/**
	 * 
	 * @param birthday
	 * @return
	 */
	public static String getAge(Date birthday, Date curDate) {

		if (birthday == null)
			return "0";
		Date timenow = curDate;
		int byear = Integer.parseInt(getFormatDate(DateUtil.YYYY, birthday));
		int nyear = Integer.parseInt(getFormatDate(DateUtil.YYYY, timenow));
		int bmonth = Integer.parseInt(getFormatDate(DateUtil.MM, birthday));
		int nmonth = Integer.parseInt(getFormatDate(DateUtil.MM, timenow));
		int age = nyear - byear;
		if (age < 0)
			return "0";
		if (nmonth < bmonth)
			age--;
		return String.valueOf(age);

	}

	/**
	 * Get formatted date through custom format
	 * 
	 * @param sFormat
	 *            Format
	 * @param date
	 *            Date which need to be formatted
	 * @return Formatted date
	 */
	public static String getFormatDate(String sFormat, Date date) {
		if (date == null) {
			return null;
		}
		/*
		 * if (sFormat == DateUtil.YY || sFormat == DateUtil.YYYY || sFormat ==
		 * DateUtil.MM || sFormat == DateUtil.DD || sFormat == DateUtil.MM_DD ||
		 * sFormat == DateUtil.YYYYMM || sFormat == DateUtil.YYYYMMDD || sFormat
		 * == DateUtil.YYYY_MM || sFormat == DateUtil.YY_MM_DD || sFormat ==
		 * DateUtil.YYYY_MM_DD || sFormat == DateUtil.OYYYY_MM_DD || sFormat ==
		 * DateUtil.HH_MI || sFormat == DateUtil.HHMI || sFormat ==
		 * DateUtil.YY_MM_DD_HH_MI || sFormat == DateUtil.YYYY_MM_DD_HH_MI_SS ||
		 * sFormat == DateUtil.YYYYMMDDHHMISS || sFormat == DateUtil.YYYY$MM$DD$
		 * || sFormat == DateUtil.YYYY$MM$ || sFormat == DateUtil.MM$DD$ ||
		 * sFormat == DateUtil.DD$ || sFormat == DateUtil.HH || sFormat ==
		 * DateUtil.MI || sFormat == DateUtil.HH_MI_SS || sFormat ==
		 * DateUtil.YYYY_MM_DD_HH_MI || sFormat ==
		 * DateUtil.YYYY$MM$DD$_HH_MI_SS) { SimpleDateFormat formatter = new
		 * SimpleDateFormat(sFormat); return formatter.format(date); } else {
		 * return null; }
		 */
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(sFormat);
			return formatter.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Date getDate(String sFormat, String date) {
		if (date == null || "".equals(date)|| "null".equals(date)) {
			return null;
		}

		/*
		 * if (sFormat == DateUtil.YY || sFormat == DateUtil.YYYY || sFormat ==
		 * DateUtil.MM || sFormat == DateUtil.DD || sFormat == DateUtil.MM_DD ||
		 * sFormat == DateUtil.YYYYMM || sFormat == DateUtil.YYYYMMDD || sFormat
		 * == DateUtil.YYYY_MM || sFormat == DateUtil.YY_MM_DD || sFormat ==
		 * DateUtil.YYYY_MM_DD || sFormat == DateUtil.OYYYY_MM_DD || sFormat ==
		 * DateUtil.HH_MI || sFormat == DateUtil.YY_MM_DD_HH_MI || sFormat ==
		 * DateUtil.YYYY_MM_DD_HH_MI || sFormat == DateUtil.YYYY_MM_DD_HH_MI_SS
		 * || sFormat == DateUtil.YYYYMMDDHHMI || sFormat ==
		 * DateUtil.YYYYMMDDHHMISS || sFormat == DateUtil.YYYY$MM$DD$ || sFormat
		 * == DateUtil.YYYY$MM$ || sFormat == DateUtil.MM$DD$ || sFormat ==
		 * DateUtil.DD$ || sFormat == DateUtil.HH || sFormat == DateUtil.MI ||
		 * sFormat == DateUtil.YYYY$MM$DD$_HH_MI_SS) { SimpleDateFormat
		 * formatter = new SimpleDateFormat(sFormat); try { return
		 * formatter.parse(date); } catch (ParseException e) {
		 * 
		 * e.printStackTrace(); } }
		 */

		try {
			SimpleDateFormat formatter = new SimpleDateFormat(sFormat);
			return formatter.parse(date);
		} catch (ParseException e) {
			// e.printStackTrace();
			return null;
		}

	}

	/**
	 * 月末日取得
	 * 
	 * @return
	 */
	public static Date getLastDay(Date date) {
		if (date == null) {
			return null;
		} else {
			return dateAdd(DateUtil.DAY, -1, dateAdd(DateUtil.MONTH, 1, date));
		}
	}

	/**
	 * Get current formatted date through custom format
	 * 
	 * @param sFormat
	 *            Format
	 * @return Formatted date
	 */
	public static String getFormatDate(String sFormat) {
		return getFormatDate(sFormat, getCurrent());
	}

	/**
	 * Add value on special field of date
	 * 
	 * @param iField
	 *            Field which need add value
	 * @param iValue
	 *            Value which will be added
	 * @param date
	 *            Basic date
	 * @return New date
	 */
	public static Date dateAdd(int iField, int iValue, Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		switch (iField) {
		case DateUtil.YEAR:
			cal.add(Calendar.YEAR, iValue);
			break;
		case DateUtil.MONTH:
			cal.add(Calendar.MONTH, iValue);
			break;
		case DateUtil.DAY:
			cal.add(Calendar.DATE, iValue);
			break;
		case DateUtil.HOUR:
			cal.add(Calendar.HOUR, iValue);
			break;
		case DateUtil.HOUR_OF_DAY:
			cal.add(Calendar.HOUR_OF_DAY, iValue);
			break;
		case DateUtil.MINUTE:
			cal.add(Calendar.MINUTE, iValue);
			break;
		case DateUtil.SECOND:
			cal.add(Calendar.SECOND, iValue);
			break;
		default:
			break;
		}
		return cal.getTime();
	}
    public static long sendDiff(Date startDate, Date endDate){
    	long a = endDate.getTime()-startDate.getTime();
         return a/1000;
    }
	/**
	 * Date diff
	 * 
	 * @param iField
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static long dateDiff(int iField, Date startDate, Date endDate) {
		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		// long startTime = startDate.getTime();
		// long endTime = endDate.getTime();
		// long diffTime = endTime - startTime;
		int startYear = Integer.parseInt(getFormatDate(YYYY, startDate));
		int endYear = Integer.parseInt(getFormatDate(YYYY, endDate));
		int startMonth = Integer.parseInt(getFormatDate(MM, startDate)) - 1;
		int endMonth = Integer.parseInt(getFormatDate(MM, endDate)) - 1;
		int startDay = Integer.parseInt(getFormatDate(DD, startDate));
		int endDay = Integer.parseInt(getFormatDate(DD, endDate));
		int startHour = Integer.parseInt(getFormatDate(HH, startDate));
		int endHour = Integer.parseInt(getFormatDate(HH, endDate));
		int startMinute = Integer.parseInt(getFormatDate(MI, startDate));
		int endMinute = Integer.parseInt(getFormatDate(MI, endDate));

		switch (iField) {
		case DateUtil.YEAR:
			return endYear - startYear;
		case DateUtil.MONTH:
			long yearDiff = endYear - startYear;
			long monthDiff = endMonth - startMonth;
			return yearDiff * 12 + monthDiff;
		case DateUtil.DAY:
			start.set(startYear, startMonth, startDay, 0, 0, 0);
			end.set(endYear, endMonth, endDay, 0, 0, 0);
			return (end.getTimeInMillis() - start.getTimeInMillis()) / (1000 * 60 * 60 * 24);
		case DateUtil.HOUR:
			start.set(startYear, startMonth, startDay, startHour, 0, 0);
			end.set(endYear, endMonth, endDay, endHour, 0, 0);
			return (end.getTimeInMillis() - start.getTimeInMillis()) / (1000 * 60 * 60);
		case DateUtil.HOUR_OF_DAY:
			start.set(startYear, startMonth, startDay, startHour, 0, 0);
			end.set(endYear, endMonth, endDay, endHour, 0, 0);
			return (end.getTimeInMillis() - start.getTimeInMillis()) / (1000 * 60 * 60);
		case DateUtil.MINUTE:
			start.set(startYear, startMonth, startDay, startHour, startMinute, 0);
			end.set(endYear, endMonth, endDay, endHour, endMinute, 0);
			return (end.getTimeInMillis() - start.getTimeInMillis()) / (1000 * 60);
		default:
			break;
		}
		return end.getTimeInMillis() - start.getTimeInMillis();
	}

	/**
	 * Add value on special field of current date
	 * 
	 * @param iField
	 *            iField Field which need add value
	 * @param iValue
	 *            Value which will be added
	 * @return New date
	 */
	public static Date dateAdd(int iField, int iValue) {
		return dateAdd(iField, iValue, getCurrent());
	}

	/**
	 * Trunc the date
	 * 
	 * @param date
	 * @return
	 */
	public static Date dateTrunc(Date date) {

		return DateUtil.getDate(DateUtil.YYYYMMDD, DateUtil.getFormatDate(DateUtil.YYYYMMDD, date));

	}

	/**
	 * Get the day count of the month
	 * 
	 * @param date
	 * @return
	 */
	public static long getMonthDayCount(Date date) {
		Date start = getMonthFirstDay(date);
		Date end = getMonthEndDay(date);
		return DateUtil.dateDiff(DateUtil.DAY, start, end) + 1;
	}

	/**
	 * Function: return date by specified year,month,day,hour,minute,second<br>
	 * 
	 * @param hour
	 * @param minute
	 * @param second
	 * @param month
	 * @param day
	 * @param year
	 * @return - Date
	 */
	public static Date mktime(int hour, int minute, int second, int month, int day, int year) {

		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day, hour, minute, second);
		return cal.getTime();

	}

	/**
	 * 
	 * Function: SUNDAY or SATURDAY return true
	 * 
	 * @param date
	 * @return
	 */
	public static boolean isWeekend(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		int weekday = calendar.get(Calendar.DAY_OF_WEEK);
		if (weekday == Calendar.SUNDAY || weekday == Calendar.SATURDAY)
			return true;
		return false;
	}

	/**
	 * 
	 * Function: get the date's weekday
	 * 
	 * @param date
	 * @return
	 */
	public static int getWeekday(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		return calendar.get(Calendar.DAY_OF_WEEK);
	}

	/**
	 * 
	 * Function: get LastDay
	 * 
	 * @param date
	 * @return
	 */
	public static Date getLastDayOfYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		Calendar lastDay = new GregorianCalendar(year, Calendar.DECEMBER, 31);
		return lastDay.getTime();
	}

	/**
	 * 
	 * Function: get Year firstDay
	 * 
	 * @param createDate
	 * @return
	 */
	public static Date getFirstDayOfYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		Calendar firstDay = new GregorianCalendar(year, Calendar.JANUARY, 1);
		return firstDay.getTime();
	}

	/**
	 * 
	 * Function : get Formated Date
	 * 
	 * Product describe:
	 * 
	 * @param sFormat
	 * @param date
	 * @return
	 */
	public static Date getDate(String sFormat, Date date) {
		String dateStr = DateUtil.getFormatDate(sFormat, date);
		return DateUtil.getDate(sFormat, dateStr);
	}
	

	public static String nowDate() {
		String date = (new Date()).toLocaleString();
		String out = "";
		String xArr[] = date.split(" ");
		String yArr[] = xArr[0].split("-");
		out = (new StringBuffer(String.valueOf(yArr[0]))).append("\u5E74").append(yArr[1]).append("\u6708").append(yArr[2]).append("\u65E5").toString();
		return out;
	}

	public static String now() {
		String date = (new Date()).toLocaleString();
		String out = "";
		String xArr[] = date.split("-");
		out = (new StringBuffer(String.valueOf(xArr[0]))).append("\u5E74").append(xArr[1]).append("\u6708").append(xArr[2]).toString();
		String yArr[] = out.split(":");
		out = (new StringBuffer(String.valueOf(yArr[0]))).append("\u65F6").append(yArr[1]).append("\u5206").append(yArr[2]).toString();
		String zArr[] = out.split(" ");
		out = (new StringBuffer(String.valueOf(zArr[0]))).append("\u65E5 ").append(zArr[1]).append("\u79D2").toString();
		return out;
	}


	public static String nowDateNDay() {
		Date d = new Date();
		String date = d.toLocaleString();
		String out = "";
		String xArr[] = date.split(" ");
		String yArr[] = xArr[0].split("-");
		out = (new StringBuffer(String.valueOf(yArr[0]))).append("\u5E74").append(yArr[1]).append("\u6708").append(yArr[2]).append("\u65E5").toString();
		int w = d.getDay();
		String week = "";
		switch (w) {
		case 0: // '\0'
			week = " \u661F\u671F\u5929";
			break;

		case 1: // '\001'
			week = " \u661F\u671F\u4E00";
			break;

		case 2: // '\002'
			week = " \u661F\u671F\u4E8C";
			break;

		case 3: // '\003'
			week = " \u661F\u671F\u4E09";
			break;

		case 4: // '\004'
			week = " \u661F\u671F\u56DB";
			break;

		case 5: // '\005'
			week = " \u661F\u671F\u4E94";
			break;

		case 6: // '\006'
			week = " \u661F\u671F\u516D";
			break;

		default:
			week = "";
			break;
		}
		out = (new StringBuffer(String.valueOf(out))).append(" ").append(week).toString();
		return out;
	}

	public static String dateToString(Date date) {
		String d = date.toLocaleString();
		String out = "";
		String xArr[] = d.split(" ");
		String yArr[] = xArr[0].split("-");
		out = (new StringBuffer(String.valueOf(yArr[0]))).append("\u5E74").append(yArr[1]).append("\u6708").append(yArr[2]).append("\u65E5").toString();
		return out;
	}

	public static String regularize(String input) {
		String out = "";
		String arr[] = input.split("-");
		if (arr[1].length() < 2)
			arr[1] = (new StringBuffer("0")).append(arr[1]).toString();
		if (arr[2].length() < 2)
			arr[2] = (new StringBuffer("0")).append(arr[2]).toString();
		out = (new StringBuffer(String.valueOf(arr[0]))).append(arr[1]).append(arr[2]).toString();
		return out;
	}


	public static String yesterday() {
		Date td = new Date();
		Date tmr = new Date(td.getTime() - 86400000L);
		String tomorrow = tmr.toLocaleString().split(" ")[0];
		String tArr[] = tomorrow.split("-");
		if (tArr[1].length() < 2)
			tArr[1] = (new StringBuffer("0")).append(tArr[1]).toString();
		if (tArr[2].length() < 2)
			tArr[2] = (new StringBuffer("0")).append(tArr[2]).toString();
		return (new StringBuffer(String.valueOf(tArr[0]))).append("-").append(tArr[1]).append("-").append(tArr[2]).toString();
	}

	
	public static String tomorrow() {
		Date td = new Date();
		Date tmr = new Date(td.getTime() + 86400000L);
		String tomorrow = tmr.toLocaleString().split(" ")[0];
		String tArr[] = tomorrow.split("-");
		if (tArr[1].length() < 2)
			tArr[1] = (new StringBuffer("0")).append(tArr[1]).toString();
		if (tArr[2].length() < 2)
			tArr[2] = (new StringBuffer("0")).append(tArr[2]).toString();
		return (new StringBuffer(String.valueOf(tArr[0]))).append("-").append(tArr[1]).append("-").append(tArr[2]).toString();
	}
	

	public static String dateToDateCN(String in) {
		String tmp[] = in.split("-");
		return (new StringBuffer(String.valueOf(tmp[0]))).append("\u5E74").append(tmp[1]).append("\u6708").append(tmp[2]).append("\u65E5").toString();
	}

	
	public static String dateToDateEN(String in) {
		return in.replaceAll("\u5E74", "-").replaceAll("\u6708", "-").replaceAll("\u65E5", "");
	}

	
	public static GregorianCalendar parse2Cal(String pDateStr) {
		sToken = new StringTokenizer(pDateStr, "-/");
		int vYear = Integer.parseInt(sToken.nextToken());
		int vMonth = Integer.parseInt(sToken.nextToken()) - 1;
		int vDayOfMonth = Integer.parseInt(sToken.nextToken());
		return new GregorianCalendar(vYear, vMonth, vDayOfMonth);
	}

	
	public static int monthsBetween(String pFormerStr, String pLatterStr) {
		GregorianCalendar vFormer = parse2Cal(pFormerStr);
		GregorianCalendar vLatter = parse2Cal(pLatterStr);
		return monthsBetween(vFormer, vLatter);
	}

	public static int monthsBetween(GregorianCalendar pFormer, GregorianCalendar pLatter) {
		GregorianCalendar vFormer = pFormer;
		GregorianCalendar vLatter = pLatter;
		boolean vPositive = true;
		if (pFormer.before(pLatter)) {
			vFormer = pFormer;
			vLatter = pLatter;
		} else {
			vFormer = pLatter;
			vLatter = pFormer;
			vPositive = false;
		}
		int vCounter;
		for (vCounter = 0; vFormer.get(1) != vLatter.get(1) || vFormer.get(2) != vLatter.get(2); vCounter++)
			vFormer.add(2, 1);

		if (vPositive)
			return vCounter;
		else
			return -vCounter;
	}


	public static int getMonth(String pFormattedDate) {
		StringTokenizer vSt = new StringTokenizer(pFormattedDate, "-");
		vSt.nextToken();
		int val = Integer.parseInt(vSt.nextToken());
		return val;
	}


	public static int getYear(String pFormattedDate) {
		StringTokenizer vSt = new StringTokenizer(pFormattedDate, "-");
		int val = Integer.parseInt(vSt.nextToken());
		return val;
	}
	
	
	public static int dayOfWeek(String pFormerStr) {
		GregorianCalendar vTodayCal = parse2Cal(pFormerStr);
		return vTodayCal.get(7);
	}

	
	public static int dayOfWeek(Date date) {
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(date);
		return gc.get(7);
	}
	

	public static final Date stringToDate(String date, String pattern) throws ParseException {
		if (date == null || pattern == null) {
			return null;
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.parse(date);
		}
	}
	
	
	public static final String convDateToString(Date date, String pattern) {
		if (date == null || pattern == null) {
			return null;
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}
	}

	
	public static String calcMonday(String queryDate) {
		String result = null;
		if (queryDate != null) {
			GregorianCalendar gc = new GregorianCalendar();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				gc.setTime(df.parse(queryDate));
				gc.add(5, -1);
				for (; gc.get(7) != 1; gc.add(5, -1))
					;
				gc.add(5, 1);
				result = (new StringBuffer(String.valueOf(df.format(gc.getTime())))).append(" 00:00:00").toString();
			} catch (ParseException e) {
				System.out.print(e.getMessage());
			}
		}
		return result;
	}
	
	
	public static String calcSunday(String queryDate) {
		String result = null;
		if (queryDate != null) {
			GregorianCalendar gc = new GregorianCalendar();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				gc.setTime(df.parse(queryDate));
				gc.add(5, -1);
				for (; gc.get(7) != 7; gc.add(5, 1))
					;
				gc.add(5, 1);
				result = (new StringBuffer(String.valueOf(df.format(gc.getTime())))).append(" 23:59:59").toString();
			} catch (ParseException e) {
				System.out.print(e.getMessage());
			}
		}
		return result;
	}

	
	public static Date calcBeginMonth(String queryDate) {
		Date result = null;
		if (queryDate != null) {
			GregorianCalendar gc = new GregorianCalendar();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				gc.setTime(df.parse(queryDate));
				for (int i = gc.get(2); gc.get(2) != (i != 0 ? i - 1 : 11); gc.add(5, -1))
					;
				gc.add(5, 1);
				result = gc.getTime();
			} catch (ParseException e) {
				System.out.print(e.getMessage());
			}
		}
		return result;
	}

	
	public static Date calcEndMonth(String queryDate) {
		Date result = null;
		if (queryDate != null) {
			GregorianCalendar gc = new GregorianCalendar();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				gc.setTime(df.parse(queryDate));
				for (int i = gc.get(2); gc.get(2) != (i != 11 ? i + 1 : 0); gc.add(5, 1))
					;
				gc.add(5, -1);
				result = gc.getTime();
			} catch (ParseException e) {
				System.out.print(e.getMessage());
			}
		}
		return result;
	}

	private static String getWeekString(int week) {
		String weeks[] = { "\u661F\u671F\u65E5", "\u661F\u671F\u4E00", "\u661F\u671F\u4E8C", "\u661F\u671F\u4E09", "\u661F\u671F\u56DB", "\u661F\u671F\u4E94", "\u661F\u671F\u516D" };
		return weeks[week - 1];
	}
	
	
	public static boolean isDateBefore(String date1, String date2) {
		try {
			return stringToDate(date1, "yyyy-MM-dd HH:mm:ss").before(stringToDate(date2, "yyyy-MM-dd HH:mm:ss"));
		} catch (ParseException e) {
			System.out.print(e.getMessage());
		}
		return false;
	}

	
	public static boolean isDateBefore(Date date1, Date date2) {
		try {
			return date1.before(date2);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return false;
	}
	
	public static Date getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(5, now.get(5) + day);
		return now.getTime();
	}

	
	public static Date getDateBeforeHour(Date d, int hour) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(10, now.get(10) + hour);
		return now.getTime();
	}


	public static String getYear() {
		Date date = Calendar.getInstance().getTime();
		String sDate = convDateToString(date, "yyyy");
		return sDate;
	}

	public static String getMon() {
		Date date = Calendar.getInstance().getTime();
		String sDate = convDateToString(date, "MM");
		return sDate;
	}
	
	public static String getDaily() {
		Date date = Calendar.getInstance().getTime();
		String sDate = convDateToString(date, "dd");
		return sDate;
	}

	public static String getNow() {
		Date date = Calendar.getInstance().getTime();
		String sDate = convDateToString(date, "yyyy-MM-dd");
		return sDate;
	}

	public static String getNowTime() {
		Date date = Calendar.getInstance().getTime();
		String sDate = convDateToString(date, "yyyy-MM-dd HH:mm:ss");
		return sDate;
	}

	public static Date getDate() {
		Date date = Calendar.getInstance().getTime();
		return date;
	}
	
	public static String getDateString() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String str = sdf.format(date);
		return str;
	}
	
	public static String getNextDay(String dateStr) {
		Calendar calendar = new GregorianCalendar();
		String format = "yyyy-MM-dd";
		if (dateStr != null && dateStr.trim().length() == 7) {
			format = "yyyy-MM";
		}
		SimpleDateFormat bartDateFormat = new SimpleDateFormat(format);
		try {
			Date date = bartDateFormat.parse(dateStr);
			calendar.setTime(date);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		calendar.add(Calendar.DATE, +1);
		return bartDateFormat.format(calendar.getTime()).toString();
	}
	
	public static String getExpirationDate(String date){
		
		if(date!=null && !"".equals(date)){
		
			if(date.startsWith("(")){
				date = date.replaceAll("\\(", "");
			}
			else if(date.startsWith("（")){
				date = date.replaceAll("\\（", "");
			}
			if(date.endsWith(")")){
				date = date.replaceAll("\\)", "");
			}
			else if(date.endsWith("）")){
				date = date.replaceAll("\\）", "");
			}
			if(date.indexOf("至")!=-1){
				  // xx-xx-xx~xx-xx-xx
				String[] dates = date.split("至");
				if(dates.length==2)
			       date = dates[1];
				
			}else if(date.indexOf("到")!=-1){
				  // xx-xx-xx~xx-xx-xx
				String[] dates = date.split("到");
				if(dates.length==2)
			       date = dates[1];
				
			}else if(date.indexOf(".")!=-1&&date.indexOf("-")!=-1){
				   // xx.xx.xx-xx.xx.xx
			       String[] dates = date.split("-");
			       date = dates[1];       
				
			}else if(date.indexOf("年")!=-1&&date.indexOf("-")!=-1){
				  // xx年xx月xx日-xx年xx月xx日
				String[] dates = date.split("-");
			       date = dates[1]; 
			}else if(date.indexOf("~")!=-1){
				  // xx-xx-xx~xx-xx-xx
				String[] dates = date.split("~");
			       date = dates[1]; 
			}else if(date.indexOf("-")!=-1){
				  // xx-xx-xx~xx-xx-xx
				String[] dates = date.split("-");
				if(dates.length==2)
			       date = dates[1];
				
			}else if(date.indexOf("—")!=-1){
				  // xx-xx-xx~xx-xx-xx
				String[] dates = date.trim().split("—");
				//if(dates.length==2)
			       date = dates[dates.length-1];
				
			}else if(date.indexOf("—")!=-1){
				  // xx-xx-xx~xx-xx-xx
				String[] dates = date.split("—");
				if(dates.length==2)
			       date = dates[1];
				
			}else if(date.indexOf("--")!=-1){
				String[] dates = date.split("--");
				if(dates.length==2)
			       date = dates[1];
			}

			if(date.indexOf("截止日期：")!=-1){
				date = date.replaceAll("截止日期：","");
			}else if(date.indexOf("截止至")!=-1){
				date = date.replaceAll("截止至","");
			}else if(date.indexOf("合作截至日期：")!=-1){
				date = date.replaceAll("合作截至日期：","");
			}
			
		   return doWithEndDate(date);
		}
		
		return "";
	}
	public static  String doWithEndDate(String date){
		
		if(date!=null && !"".equals(date)){
			if(date.indexOf("长期")!=-1){
				return "";
			}else if(date.indexOf(".")!=-1){
				String[] dates = date.split("\\.");
				if(dates.length==2)
					return dates[0].replaceAll("\\s{1,}", "")+"-"+dates[1].replaceAll("\\s{1,}", "")+"-01";
				else if(dates.length==3)
					return dates[0].replaceAll("\\s{1,}", "")+"-"+dates[1].replaceAll("\\s{1,}", "")+"-"+dates[2].replaceAll("\\s{1,}", "");
			}else if(date.indexOf("-")!=-1){
				String[] dates = date.split("-");
				if(dates.length==2){
				
					return date.replaceAll("\\s{1,}", "")+"-01";
				}else if(dates.length==3){
					
					return date.replaceAll("\\s{1,}", "");
				}
					
			}else if(date.indexOf("年")!=-1&&date.indexOf("月")!=-1&&date.indexOf("日")!=-1){
				    
				    return date.replaceAll("年", "-").replaceAll("月", "-").replaceAll("日", "").replaceAll("\\s{1,}", "").trim();
			}else if(date.indexOf("年")!=-1&&date.indexOf("月")!=-1){
				    
				    return date.replaceAll("年", "-").replaceAll("月", "-").replaceAll("\\s{1,}", "").trim()+"-01";
			}else if(date.length()==8){
				
				    return date.substring(0,4).replaceAll("\\s{1,}", "")+"-"+date.substring(4,6).replaceAll("\\s{1,}", "")+"-"+date.substring(6).replaceAll("\\s{1,}", "");    
			}else if(date.length()==6){
				
			    return date.substring(0,4).replaceAll("\\s{1,}", "")+"-"+date.substring(4).replaceAll("\\s{1,}", "")+"-01";    
		}
		}
		return "";
	}
	public static void main(String args[]) throws ParseException {
		//System.out.println(stringToDate("2008-12-12 06:30", "yy-MM-dd"));
		//String s=" a 1 b 2 c 3 d 4 a1b2c3d4 ";   
	    //String t=s.replaceAll("\\s{1,}", "");   
		//System.out.println(t);  
		//System.out.println(getDaily());
		System.out.println(isDateBefore("2017-03-01 00:00:00", "2017-02-01 00:00:00"));
	}	
	//检验日期合法性
	 public static boolean valid(String dateFormat, String dateStr){
		 DateFormat formatter = new SimpleDateFormat(dateFormat);
	     try{
	         Date date = (Date)formatter.parse(dateStr);
	         return dateStr.equals(formatter.format(date));
	     }catch(Exception e){
	        return false;
	     }
	 } 
}
