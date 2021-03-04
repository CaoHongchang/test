package com.i84.earnpoint.common;

public class SystemContant {

	// 正式
	//public static String ip = "222.76.215.8";
	public static String ip = "127.0.0.1";
	//public static int port = 3306;
    //public static int port = 52058;
	//public static String dbip = "10.221.40.195";
	
	//测试
	//public static String ip = "114.55.40.252";
	public static int port = 3306;
	
	//public static String ip = "203.195.183.64";
    //public static String dbip = "203.195.183.64";
	//public static String dbip = "122.114.94.12";
	//public static String ip = "118.192.93.222";
	public static String PRIVILEGES = "pri";

	public static int JQR=1;
	public static int CC_20=20;
	public static int CC_50=50;
	public static int CC_100=100;
	public static int CC_200=200;
	public static int CC_300=300;
	public static int CC_400=400;
	public static int CC_500=500;
	public static int CC_600=600;
	public static int CC_1000=1000;
	
	
	
	//班级状态：待报名、成绩录入、执行情况录入、结束培训
	public static int CLASS_STATE_DBM = 1;
	public static int CLASS_STATE_CJ = 2;
	public static int CLASS_STATE_ZX = 3;
	public static int CLASS_STATE_END = 4;
	
	//报名表状态：待审核、审核成功、审核失败
	public static int BG_STATE_NEW = 0;
	public static int BG_STATE_SUCC = 1;
	public static int BG_STATE_FAIL = 2;
	public static int BG_STATE_SCORE = 3;
	public static int BG_STATE_END = 4;
	
	
	//组别简称与组别全称
	public static final String director = "主任委员库";
	public static final String directorAll = "主任";
	public static final String roadAndBridge = "路桥组";
	public static final String roadAndBridgeAll = "道路与桥梁、隧道工程（含地质勘测）";
	public static final String portAndChannel = "港航组";
	public static final String portAndChannelAll = "港口及航道工程（含地质勘测、航标）";
	public static final String roadBuildingMachine = "筑路机械组组";
	public static final String roadBuildingMachineAll = "筑养路设备应用与管理";
	public static final String portAndChannelMachine = "港航机械组";
	public static final String portAndChannelMachineAll = "港航设备应用与管理";
	public static final String trafficMechatronics = "交通机电组";
	public static final String trafficMechatronicsAll = "交通机电";
	public static final String transportation = "交通运输工程组";
	public static final String transportationAll = "交通运输工程";
	
	
	/** 可用 */
	public final static String STATUS_USABLE = "0";
	
	/** 逻辑删除 */
	public final static String STATUS_DELETE = "1";
}
