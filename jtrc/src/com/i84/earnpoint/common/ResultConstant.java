package com.i84.earnpoint.common;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeUtility;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFileChooser;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang.ObjectUtils.Null;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.model.Page;
import com.i84.earnpoint.model.UserExpertInfoPickUp;

/**
 * ?????????
 * @author liu_quan
 *
 */
public class ResultConstant {

    /**????????????*/
    public static int success_flag=200;
    /**??????????????????session??????*/
    public static int warn_flag=601;
    /**?????????????????????*/
    public static int error_flag=602;
    /**????????????*/
    public static int other_flag=600;

    public static String smsUrl="";
    
    static {
        Properties p = new Properties();
        try {

            p.load(ResultConstant.class.getClassLoader().getResourceAsStream("config/sms_conf.properties"));
            smsUrl = p.getProperty("sms_address");



        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void result(String rs,HttpServletResponse response){
        response.setContentType("text/html;charset=gbk");
        OutputStream outPrint;
        try {
            outPrint = response.getOutputStream();
            outPrint.write(rs.getBytes());
            outPrint.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static void write(HttpServletResponse response,Object o){
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out;
        try {
            out=response.getWriter();
            out.println(o.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    /**
     * ?????????json????????????
     * @param code
     * @param message
     * @param data
     * @return
     */
    public static  String buildRs(int code, String message, String  data){
        StringBuilder strb = new StringBuilder("{\"head\":");
        strb.append("{").append("\"code\":").append(code)
        .append(",\"message\":\"").append(null == message ? "" : message).append("\"}")
        .append(",\"data\":").append(null == data ? "{}" :"{"+data+"}")
        .append("}");
        return strb.toString();


    }

    public  String buildRs2(int code, String message, Object  data){
        StringBuilder strb = new StringBuilder("{\"head\":");
        strb.append("{").append("\"code\":").append(code)
        .append(",\"message\":\"").append(null == message ? "" : message).append("\"}")
        .append(",\"data\":").append(null == data ? "{}" :""+data+"")
        .append("}");
        return strb.toString();


    }

    /**
     * ?????????????????????
     * @param request
     * @return
     */
    public Map<?,?> getData(HttpServletResponse response,HttpServletRequest request){
        Map<?, ?> m = null;
        Map<?, ?> headMap = null;
        String rs="";
        try{
            String requestData=request.getParameter("requestData");
            m=JsonUtil.getMap4Json(requestData);
            headMap=JsonUtil.getMap4Json(requestData);

            m=JsonUtil.getMap4Json(m.get("data").toString());
            headMap=JsonUtil.getMap4Json(headMap.get("head").toString());
            osPlatform=headMap.get("osPlatform")==null?"":headMap.get("osPlatform").toString();
            if(StringUtils.isEmpty(osPlatform)){
                rs=buildRs(warn_flag, "???????????????????????????????????????????????????", null);
                result(rs, response);

            }
        }catch (Exception e) {
            e.printStackTrace();
            rs=buildRs(error_flag, "???????????????????????????", rs);
            System.out.println(rs);
            result(rs, response);

        }
        return m;


    }

    /**
     * ???????????????
     * @param charCount:????????????
     * @return
     */
    public static String getRandNum(int charCount) {
        String charValue = "";
        for (int i = 0; i < charCount; i++) {
            char c = (char) (randomInt(0, 10) + '0');
            charValue += String.valueOf(c);
        }
        return charValue;
    }
    public static int randomInt(int from, int to) {
        Random r = new Random();
        return from + r.nextInt(to - from);
    }


    /**
     * ??????session???????????????
     * @param response
     * @param request
     * @param sessionName:session??????
     * @param sessionObj???session???
     */
    public void setSession(HttpServletResponse response,HttpServletRequest request,String sessionName,Object sessionObj){
        HttpSession session = request.getSession();
        session.setAttribute(sessionName, sessionObj);


    }
    /** ???????????????(0,1????????????,?????????o,l??????) */
    private static final char[] r=new char[]{'q', 'w', 'e', '8', 'a', 's', '2', 'd', 'z', 'x', '9', 'c', '7', 'p', '5', 'i', 'k', '3', 'm', 'j', 'u', 'f', 'r', '4', 'v', 'y', 'l', 't', 'n', '6', 'b', 'g', 'h'};

    /** (?????????????????????????????????) */
    private static final char b='o';

    /** ???????????? */
    private static final int binLen=r.length;

    /** ?????????????????? */
    private static final int s=6;

    /**???????????????
     * @param id
     * @return
     */
    public static String toSerialCode(long id) {
        char[] buf=new char[32];
        int charPos=32;

        while((id / binLen) > 0) {
            int ind=(int)(id % binLen);
            buf[--charPos]=r[ind];
            id /= binLen;
        }
        buf[--charPos]=r[(int)(id % binLen)];
        String str=new String(buf, charPos, (32 - charPos));
        // ?????????????????????????????????
        if(str.length() < s) {
            StringBuilder sb=new StringBuilder();
            sb.append(b);
            Random rnd=new Random();
            for(int i=1; i < s - str.length(); i++) {
                sb.append(r[rnd.nextInt(binLen)]);
            }
            str+=sb.toString();
        }
        return str;
    }

    /**?????????id
     * @param code
     * @return
     */
    public static long codeToId(String code) {
        char chs[]=code.toCharArray();
        long res=0L;
        for(int i=0; i < chs.length; i++) {
            int ind=0;
            for(int j=0; j < binLen; j++) {
                if(chs[i] == r[j]) {
                    ind=j;
                    break;
                }
            }
            if(chs[i] == b) {
                break;
            }
            if(i > 0) {
                res=res * binLen + ind;
            } else {
                res=ind;
            }
            // System.out.println(ind + "-->" + res);
        }
        return res;
    }

    /**??????????????????
     * @param format
     * @return
     * @throws Exception
     */
    public static String curDate(String format)throws Exception{
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        String nowdate = dateFormat.format(now); //??????????????????
        return nowdate;

    }

    /**??????????????????
     * @param days
     * @return
     */
    public static String addDay(int days){
        Calendar   cal   =   Calendar.getInstance();
        cal.add(Calendar.DATE,   days);
        String date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
        return date;

    }

    /**??????????????????????????????????????????????????????
     * @param dateTime
     * @param format
     * @return
     * @throws Exception
     */
    public static String formatDate(String dateTime,String format)throws Exception{
        Date date=null;
        date = new SimpleDateFormat(format).parse(dateTime);
        dateTime = new SimpleDateFormat(format).format(date);
        return dateTime;
    }
    /**
     * ???String ???????????????Date?????? ???????????????
     * 
     * @param str
     * @return
     */
    public static Date parseDateTime(String str,String formatStr) {
        if(formatStr == null || formatStr.equals("")){
            if(str.length()==8){
                if(str.contains(":")){
                    formatStr = "HH:mm:ss";
                }else{
                    formatStr = "yyyyMMdd";
                }
            }
            else if(str.contains("-")){
                if(str.contains(":")){
                    formatStr = "yyyy-MM-dd HH:mm:ss";
                }
                else{
                    formatStr = "yyyy-MM-dd";
                }
            }else if(str.contains("/")){
                if(str.contains(":")){
                    formatStr = "yyyy/MM/dd HH:mm:ss";
                }
                else{
                    formatStr = "yyyy/MM/dd";
                }
            }
        }

        Date data = null;
        SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
        try {
            data = sdf.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    /**??????????????????????????????????????????
     * @param imgStr
     * @param imgFilePath
     * @return
     * @throws Exception
     */
    public static boolean GenerateImage(String imgStr,String imgFilePath)throws Exception
    { //??????????????????????????????Base64?????????????????????
        if (imgStr == null || null == imgFilePath) {
            return false;
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try
        {
            //Base64??????
            byte[] b = decoder.decodeBuffer(imgStr);
            for(int i=0;i<b.length;++i)
            {
                if(b[i]<0)
                {//??????????????????
                    b[i]+=256;
                }
            }
            //??????jpeg??????
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b,0,b.length);
            out.flush();
            out.close();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }


    //??????????????? base64?????????
    public static String ImageConverteStr(String imgStr) throws IOException
    { //??????????????????????????????Base64?????????????????????
        if (imgStr == null) {
            return "";
        }
        BASE64Encoder encoder = new BASE64Encoder();
        FileInputStream inputStream = new FileInputStream(new File(imgStr));
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] by = new byte[1024];
        int len = 0;
        while((len=inputStream.read(by))!=-1){
            output.write(by, 0, len);
        }
        output.flush();
        output.close();
        String str = encoder.encode(output.toByteArray());
        return str;
    }

    /**
     * ??????classes??????, eg:
     * G:/workspace/FNFramework/WebRoot/WEB-INF/classes/
     * 
     * @return
     */
    private static String getClassesPath() {
        String s = ResultConstant.class.getResource("/").getPath();
        // System.out.println("============>>>>>getClassesPath222222222222222222 " + s);
        // linux
        if (File.separator.equals("/")) {

        }
        else {
            if (s.startsWith("/")) {
                s = s.substring(1);
            }
            s = s.replaceAll("%20", " ");
        }
        return s;
    }

    /**
     * ??????WEB_ROOT??????, eg: G:/workspace/FNFramework/WebRoot/xxxx/
     * 
     * @return
     */
    public static String getWEB_ROOTPath() {
        String classes = getClassesPath();
        int last = classes.lastIndexOf("WEB-INF/classes/");
        // System.out.println("===============>>>> last=" + last);
        String webroot = classes;
        if (last >= 0) {
            webroot = classes.substring(0, last);
        }
        else {
            last = classes.lastIndexOf("lib/");
            webroot = classes.substring(0, last) + "webapps/jtrc/";
        }
        // linux
        if (File.separator.equals("/")) {
            webroot = "/"+webroot;
        }
        // System.out.println("===============>>>> webroot=" + webroot);
        return webroot;
    }
    /**
     * post??????
     * @param mobile:?????????
     * @param content:??????
     * @return
     * @throws Exception
     */
    public static String postHttp(String mobile,String content) throws Exception {
        String responseMsg = "";

        HttpClient httpClient=new HttpClient();
        httpClient.getParams().setContentCharset("UTF-8");

        PostMethod postMethod=new PostMethod(smsUrl);
        postMethod.addRequestHeader("Content-Type",
                "application/x-www-form-urlencoded; charset=UTF-8");
        postMethod.addParameter("mobile", mobile);
        postMethod.addParameter("content", content);

        try {
            httpClient.executeMethod(postMethod);//200

            //5.????????????
            responseMsg = postMethod.getResponseBodyAsString().trim();
            System.out.println("???????????????????????????????????????");
            System.out.println(responseMsg);


        } catch (HttpException e) {
            e.printStackTrace();
            throw e;
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            //7.????????????
            postMethod.releaseConnection();
        }
        return responseMsg;
    }


    /**????????????
     * @param phone
     * @param code
     * @return
     */
    public static Map<String,Object> sendMsg(String title,String phone,String code)throws Exception{
        Map<String,Object> map=new HashMap<String, Object>();
        String rs="";
        String msg=postHttp(phone, code);
        Map<String, Object> msgMap=JsonUtil.getMap4Json(msg);
        if(msgMap!=null){
            Boolean success= (Boolean) msgMap.get("success");
            if(success==true){
                rs=buildRs(success_flag, title+"??????", rs);
                map.put("success", true);
                map.put("msg", rs);

            }
            else{
                String result=msgMap.get("msg").toString();
                if(result.trim().equals("40001")){
                    result="?????????????????????";
                }else if(result.trim().equals("40002")){
                    result="?????????????????????";
                }else if(result.trim().equals("50001")){
                    result="?????????????????????";
                }
                rs=buildRs(error_flag, title+"??????:???????????????????????????"+result, null);
                map.put("success", false);
                map.put("msg", rs);
            }
        }else{
            rs=buildRs(error_flag, title+"??????????????????", null);
            map.put("success", false);
            map.put("msg", rs);

        }

        return map;

    }

    /**
     *?????????????????????
     */

    public static String osPlatform="";
    public String decode(Object value) throws Exception{

        if(osPlatform.contains("IOS")){
            return URLDecoder.decode(new String(value.toString().getBytes("ISO-8859-1"),"UTF-8"),"UTF-8");
        }else{
            return URLDecoder.decode(value.toString(),"UTF-8");
        }

    }

    /**
     * @param ResultRows:???????????????
     * @param total:?????????
     * @param flag:????????????
     * @param cause???????????????
     * @return
     */
    public static  Map<String, Object> resultMap(Object ResultRows,Long total,boolean flag,String cause){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("rows", ResultRows);
        resultMap.put("total", total);
        resultMap.put("flag", flag);
        resultMap.put("cause", cause);
        return resultMap;

    }
    /**
     * @param ResultRows:???????????????
     * @param total:?????????
     * @param flag:????????????
     * @param dateFlag:??????????????????????????? ???true:???
     * @param cause???????????????
     * @return
     */
    public static  Map<String, Object> resultMap(Object ResultRows,Long total,boolean flag,String dateFlag,String cause){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("rows", ResultRows);
        resultMap.put("total", total);
        resultMap.put("flag", flag);
        resultMap.put("dateFlag", dateFlag);
        resultMap.put("cause", cause);
        return resultMap;

    }

    /**
     * @param ResultRows:???????????????
     * @param flag:????????????
     * @param cause???????????????
     * @return
     */
    public static  Map<String, Object> resultMap(Object ResultRows,boolean flag,String cause){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("rows", ResultRows);
        resultMap.put("flag", flag);
        resultMap.put("cause", cause);
        return resultMap;

    }
    /**
     * @param flag:????????????
     * @param cause???????????????
     * @return
     */
    public static Map<String, Object> resultMap(boolean flag,String cause){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("flag", flag);
        resultMap.put("cause", cause==null?"":cause);
        return resultMap;

    }

    /**????????????
     * @param request
     * @param response
     * @param filePath:webroot??????????????? ??????temp/hygsgl/down/
     * @param fileName???????????????
     * @param newfileName:????????????
     * @throws Exception
     */
    public static void fileDownload(HttpServletRequest request, HttpServletResponse response,String filePath, String fileName,String newfileName) throws Exception{

        //?????????????????????
        // String filename = request.getParameter("filename");
        System.out.println(fileName);

        //????????????MIME??????
        response.setContentType("application/octet-stream;charset=UTF-8");
        //??????Content-Disposition
        if(StringUtils.isNotEmpty(newfileName)){
            response.setHeader("Content-Disposition", "attachment;"+encodeFilename2(request,newfileName));
        }else{
            response.setHeader("Content-Disposition", "attachment;"+encodeFilename2(request,fileName));
        }
        //???????????????????????????response??????????????????????????????
        //?????????????????????????????????
        String fullFileName =getWEB_ROOTPath()+filePath+"/" + fileName;
        //System.out.println(fullFileName);
        //????????????
        InputStream in = new FileInputStream(fullFileName);
        OutputStream out = response.getOutputStream();
        //?????????
        int b;
        while((b=in.read())!= -1)
        {
            out.write(b);
        }

        in.close();
        out.close();

    }
    /**?????????????????????
     * @param fileName:?????????
     * @return
     * @throws IOException
     */
    public static OutputStream outputStream(HttpServletRequest request, HttpServletResponse response,String fileName) throws IOException{
        //????????????MIME??????
        response.setContentType("application/octet-stream;charset=UTF-8");
        //??????Content-Disposition
        response.setHeader("Content-Disposition", "attachment;"+encodeFilename2(request,fileName));
        OutputStream out = response.getOutputStream();
        return out;
    }


    /**????????????
     * @param request
     * @param response
     * @param filePath
     * @return
     * @throws Exception
     */
    public static File fileupload(HttpServletRequest request, HttpServletResponse response,String filePath,String newFileName) throws Exception{
        try {
            //???????????????
            CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
            //?????????????????????
            if(resolver.isMultipart(request)){
                //????????????
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)(request);
                //????????????????????????
                Iterator<String> it = multiRequest.getFileNames();
                while(it.hasNext()){
                    //???????????????????????????
                    MultipartFile file = multiRequest.getFile(it.next());
                    String fileName = file.getOriginalFilename();//????????????
                    System.out.println(fileName);
                    //String newFileName=ResultConstant.getRandNum(32)+".xlsx";

                    //??????????????????????????????,????????????
                    String tempPath = ResultConstant.getWEB_ROOTPath() +filePath;
                    File tmpFile = new File(tempPath);
                    if (!tmpFile.exists()) {//???????????????????????????
                        //??????????????????
                        tmpFile.mkdir();

                    }
                    String localPath ="";
                    if(StringUtils.isEmpty(newFileName)) {
                        localPath=ResultConstant.getWEB_ROOTPath() +filePath+ fileName;
                    }
                    else {
                        localPath=ResultConstant.getWEB_ROOTPath() +filePath+ newFileName;
                    }

                    File newFile = new File(localPath);
                    //?????????????????????????????????????????????
                    if(!newFile.isDirectory()) {
                        newFile.mkdir();
                    }

                    //??????????????????????????????????????????
                    file.transferTo(newFile);
                    return newFile;


                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }



    /**?????????????????????
     * @param request
     * @param fileName
     * @return
     */
    public static String encodeFilename2(HttpServletRequest request, String fileName) {
        String userAgent = request.getHeader("User-Agent");
        String newFileName="";
        try {
            fileName = URLEncoder.encode(fileName, "UTF8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        if (userAgent != null) {
            userAgent = userAgent.toLowerCase();
            // IE????????????????????????URLEncoder??????
            if (userAgent.indexOf("msie") != -1) {
                newFileName = "filename=\"" + fileName;
            }
            // Opera?????????????????????filename*
            else if (userAgent.indexOf("opera") != -1) {
                newFileName = "filename*=UTF-8''" + fileName;
            }
            // Safari????????????????????????ISO?????????????????????
            else if (userAgent.indexOf("safari") != -1) {
                try {
                    newFileName = "filename=\""
                            + new String(fileName.getBytes("UTF-8"), "ISO8859-1");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
            // Chrome????????????????????????MimeUtility?????????ISO?????????????????????
            else if (userAgent.indexOf("applewebkit") != -1) {
                try {
                    fileName = MimeUtility.encodeText(fileName, "UTF8", "B");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                newFileName = "filename=\"" + fileName;
            }
            // FireFox????????????????????????MimeUtility???filename*???ISO?????????????????????
            else if (userAgent.indexOf("mozilla") != -1) {
                newFileName = "filename*=UTF-8''" + fileName;
            }
        }

        return newFileName;

    }

    /**???????????????
     * @param s
     * @return
     */
    public static String replaceTrim(String s){
        if(StringUtils.isNotEmpty(s)) {
            s=s.replaceAll("\\s*", "").trim();
        }
        return s;


    }
    /**???????????????????????????????????????????????????
     * @param str
     * @param flag
     * @return
     */
    public static String lastIndexOf(String str,String flag){
        return str.substring(str.lastIndexOf(flag)+1);

    }

    /**??????????????????
     * @param request
     * @return
     */
    public static void pageSet(Map<String,Object> page){
        PageHelper.startPage(Integer.valueOf(page.get("page").toString()),Integer.valueOf(page.get("rows").toString()));

    }


    /**??????????????????
     * @param request
     * @return
     */
    public static Map<String,Object> paramSet(HttpServletRequest request){
        Map<String,Object> paramMap=new HashMap<String, Object>();
        String param=request.getParameter("param");
        //????????????????????????
        if(StringUtils.isNotBlank(param)){
            param=param.replace("&quot;", "\"");
            List<Page> list=JsonUtil.getList4Json(param, Page.class);
            if(list!=null &&  list.size()>0){
                for(int i=0;i<list.size();i++){
                    Page p= list.get(i);
                    if(StringUtils.isNotBlank(p.getValue())) {
                        paramMap.put(p.getName(), p.getValue());
                    }
                }
            }
        }
        //????????????????????????
        int page = TextUtil.getInt(request.getParameter("page"));
        if (page == 0) {
            page = 1;
        }
        int rows = TextUtil.getInt(request.getParameter("rows"));
        if (rows == 0) {
            rows = 10;
        }
        paramMap.put("page", page);
        paramMap.put("rows", rows);

        return paramMap;


    }
    /**??????????????????
     * @param request
     * @return
     */
    public static Map<String,Object> paramSetAdd(HttpServletRequest request){
        Map<String,Object> paramMap=new HashMap<String, Object>();
        String param=request.getParameter("param");
        //????????????????????????
        if(StringUtils.isNotBlank(param)){
            List<Page> list=JsonUtil.getList4Json(param, Page.class);
            if(list!=null &&  list.size()>0){
                for(int i=0;i<list.size();i++){
                    Page p= list.get(i);
                    if(StringUtils.isNotBlank(p.getValue())) {
                        paramMap.put(p.getName(), p.getValue());
                    }
                }
            }
        }


        return paramMap;


    }
    /**???javabean???????????????map???????????????????????????map????????????
     * @param obj
     * @return
     */
    public static Map<String, Object> beanToMap(Object obj) {
        Map<String, Object> params = new HashMap<String, Object>(0);
        try {
            PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean();
            PropertyDescriptor[] descriptors = propertyUtilsBean.getPropertyDescriptors(obj);
            for (int i = 0; i < descriptors.length; i++) {
                String name = descriptors[i].getName();
                if (!"class".equals(name)) {
                    params.put(name, propertyUtilsBean.getNestedProperty(obj, name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return params;
    }

    /** ??????1
     * ????????? Map ????????????????????? JavaBean
     * @param type ??????????????????
     * @param map ?????????????????? map
     * @return ??????????????? JavaBean ??????
     */
    public static Object mapToObject(Map<String, Object> map, Class<?> beanClass) throws Exception {
        if (map == null) {
            return null;
        }

        Object obj = beanClass.newInstance();

        BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
        for (PropertyDescriptor property : propertyDescriptors) {
            Method setter = property.getWriteMethod();
            if (setter != null) {
                setter.invoke(obj, map.get(property.getName()));
            }
        }

        return obj;
    }

    /**??????2
     * @param map
     * @param beanClass
     * @return
     * @throws Exception
     */
    public static Object mapToObject2(Map<String, Object> map, Class<?> beanClass) throws Exception {
        if (map == null) {
            return null;
        }

        Object obj = beanClass.newInstance();

        Field[] fields = obj.getClass().getDeclaredFields();
        for (Field field : fields) {
            int mod = field.getModifiers();
            if(Modifier.isStatic(mod) || Modifier.isFinal(mod)){
                continue;
            }

            field.setAccessible(true);
            field.set(obj, map.get(field.getName()));
        }

        return obj;
    }

    /**
     * 
     * map??????json.
     * <br>????????????
     * @param map ??????
     * @return
     * @return String json?????????
     * @throws
     */
    public static String mapToJson(Map<String, Object> map) {
        Set<String> keys = map.keySet();
        String key = "";
        Object value = "";
        StringBuffer jsonBuffer = new StringBuffer();
        jsonBuffer.append("{");
        for (Iterator<String> it = keys.iterator(); it.hasNext();) {
            key = it.next();
            value = map.get(key);
            jsonBuffer.append(key + ":" +"\""+ value+"\"");
            if (it.hasNext()) {
                jsonBuffer.append(",");
            }
        }
        jsonBuffer.append("}");
        return jsonBuffer.toString();
    }

    /**map???????????????
     * @param map
     * @param key
     * @return
     */
    public static Map<String, Object>mapToDate( Map<String, Object>map,String key)throws Exception{
        if(map!=null&&map.get(key)!=null){
            String date=DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, (Date) map.get(key));
            map.put(key, date);
        }

        return map;
    }

    public static Map<String, Object>mapToDate( String Format, Map<String, Object>map,String key)throws Exception{
        if(map!=null&&map.get(key)!=null){
            String date=DateUtil.getFormatDate(Format, (Date) map.get(key));
            map.put(key, date);
        }

        return map;



    }
    /**????????? .serialize()?????????????????????map
     * @param request
     * @return
     */
    public static Map<String,Object> fmSeriToMap(String param){
        Map<String,Object> paramMap=new HashMap<String, Object>();
        String[] array = param.split("&");
        for (String aa : array) {
            int index = aa.indexOf("=");
            String key = aa.substring(0,index);
            String val = aa.substring(index+1);
            paramMap.put(key, val);
        }
        return paramMap;
    }
    /**????????? .serialize()?????????????????????map
     * @param request
     * @return
     * @throws Exception
     */
    public static Map<String,Object> fmSeriDecodeToMap(String param) throws Exception{
        String paramsTrans = new String(param.getBytes("ISO-8859-1"),"UTF-8");
        String deParams = java.net.URLDecoder.decode(paramsTrans , "UTF-8");
        Map<String,Object> paramMap=new HashMap<String, Object>();
        String[] array = deParams.split("&");
        for (String aa : array) {
            int index = aa.indexOf("=");
            String key = aa.substring(0,index);
            String val = aa.substring(index+1);
            paramMap.put(key, val);
        }
        return paramMap;
    }
    /**??????????????????id
     * @param request
     * @return
     */
    /*public static String uid(HttpSession session){

		//????????????id
		String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();
		return uid;



	}*/
    /**
     * ?????????????????? ??????????????????YYYY-MM-dd???
     * 2004-2-30 ????????????
     * 2003-2-29 ????????????
     * @param sDate
     * @return
     */
    public static boolean isValidDate(String str) {
        //String str = "2007-01-02";
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try{
            Date date = formatter.parse(str);
            return str.equals(formatter.format(date));
        }catch(Exception e){
            return false;
        }
    }
    /**
     * ?????????????????????????????????
     * 
     * @param str
     * @return
     */
    public static String StringFilter(String str) {
        String regEx = "[\r\n\t\'??????|\"???]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.replaceAll("").trim();
    }

    /**??????????????????????????????
     * @param str
     * @return
     */
    public static boolean isNumberOrNull(String str){

        try {
            if(StringUtils.isNotEmpty(str)){
                Double.valueOf(str);
                return true;
            }else{
                return true;
            }

        } catch (Exception e) {
            return false;
        }

    }

    /**??????tomcat???webapps??????
     * @return
     */
    public static String getWebApps(){
        //????????????????????????=???path = request.getSession().getServletContext().getRealPath("upload");
        return System.getProperty("user.dir").replace("bin", "webapps");

    }

    /**??????????????????????????????
     * @param name
     * @return
     * @throws Exception
     */
    public static List<Map<String,Object>> getDataItemValueByName(String attName) throws Exception{
        List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
        File xmlFile = new File(ResultConstant.getWEB_ROOTPath() + "WEB-INF/classes/config/dictionary-configuration.xml"); // new File("src/book.xml");
        DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder  builder = builderFactory.newDocumentBuilder();
        Document doc = builder.parse(xmlFile);
        doc.getDocumentElement().normalize();
        System.out.println("Root element: "+doc.getDocumentElement().getNodeName());
        NodeList nList = doc.getElementsByTagName("group");


        for(int i = 0 ; i<nList.getLength();i++){
            String nodeName = nList.item(i).getAttributes().getNamedItem("name").getNodeValue();
            if(StringUtils.isNotEmpty(attName)&&nodeName.equals(attName.trim())){
                Node node = nList.item(i);
                Element ele = (Element)node;
                Integer optionLen=null;
                if(ele.getElementsByTagName("option")!=null){
                    optionLen=ele.getElementsByTagName("option").getLength();
                    for(int j=0;j<optionLen;j++){
                        String name= ele.getElementsByTagName("option").item(j).getAttributes().getNamedItem("name").getNodeValue();
                        String value= ele.getElementsByTagName("option").item(j).getAttributes().getNamedItem("value").getNodeValue();
                        Map<String,Object> m=new HashMap<String, Object>();
                        m.put("name", name);
                        m.put("value", value);
                        list.add(m);
                        m=null;

                    }
                }

            }
            //		    Node node = nList.item(i);
            //		    System.out.println("Node name: "+ node.getNodeName());
            //		    Element ele = (Element)node;
            //		    System.out.println(ele.getElementsByTagName("option").getLength());
            //		    System.out.println("----------------------------");
            //		    if(node.getNodeType() == Element.ELEMENT_NODE){
            //
            //		    System.out.println("??????: "+ ele.getElementsByTagName("option").item(i).getAttributes().getNamedItem("name").getNodeValue());


            //		    System.out.println("title name: "+ ele.getElementsByTagName("title").item(0).getTextContent());
            //
            //		    System.out.println("author name: "+ele.getElementsByTagName("author").item(0).getTextContent());
            //
            //		    System.out.println("year :"+ele.getElementsByTagName("year").item(0).getTextContent());
            //
            //		    System.out.println("price : "+ele.getElementsByTagName("price").item(0).getTextContent());

            //		    System.out.println("-------------------------");
            //		    }

        }
        return list;


    }

    /**
     * ??????
     */
    public static void printer(String fileName){
        JFileChooser fileChooser = new JFileChooser(); // ??????????????????
        File file = new File(fileName); // ?????????????????????
        // ???????????????????????????
        HashPrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
        // ?????????????????????????????????????????????????????????autosense
        DocFlavor flavor = DocFlavor.INPUT_STREAM.AUTOSENSE;
        // ???????????????????????????
        PrintService defaultService = PrintServiceLookup.lookupDefaultPrintService();
        InputStream fis = null;
        try {
            DocPrintJob job = defaultService.createPrintJob(); // ??????????????????
            fis = new FileInputStream(file); // ???????????????????????????
            DocAttributeSet das = new HashDocAttributeSet();
            Doc doc = new SimpleDoc(fis, flavor, das);
            job.print(doc, pras);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**???list?????????????????????
     * @return
     * @Title: createRandomList
     * @Description: TODO
     * @param list
     * @param i
     * @return void
     * @throws
     */
    public static List createRandomList(List list, int n) {
        // TODO Auto-generated method stub
        Map map = new HashMap();
        List listNew = new ArrayList();
        if(list.size()<=n){
            return list;
        }else{
            while(map.size()<n){
                int random = (int) (Math.random() * list.size());
                if (!map.containsKey(random)) {
                    map.put(random, "");
                    System.out.println(random+"==========="+list.get(random));
                    listNew.add(list.get(random));
                }
            }
            return listNew;
        }
    }

    /**????????????list??????????????????????????????????????????????????????????????????????????????????????????
     * @return
     * @Title: createRandomList
     * @Description: TODO
     * @param list
     * @param i
     * @return void
     * @throws
     */
	public static List createRandomListExpert(List<Map<String,Object>> list, List<String> companyList, int n, int m,
			int x) {
		// TODO Auto-generated method stub
		/**
		*	??????
		*
		*/
		int all = m * n;
		int countAge = 0;// ??????????????????????????????45????????????????????????????????????1/3
		int countSelectedAndEffected = 0;
		int flagOfSelected = 1;
		int flagOfCompanyLimited = 1;
		int needToPick = 0;
		int noNeedNumber = 0;
		Random rand = new Random();
		List<Integer> selected = new ArrayList();// ?????????
		List<Integer> CompanyCountlist = new ArrayList();
		List<Map<String,Object>> listNew = new ArrayList();
		List<Integer> countEffected = new ArrayList();
		//??????
		
		CompanyCountlist=PickExpert.fillCompanyList(companyList);
		countAge= PickExpert.countAge(list, all);
		countSelectedAndEffected=PickExpert.whetherFirst(list,selected);
		selected = PickExpert.whetherFirstList(list, selected);
		countEffected=PickExpert.findLastTime(list, countEffected);
		List<Integer> listNumber = PickExpert.noNeedNumberJudge(list,countEffected, all,countSelectedAndEffected);
		noNeedNumber=listNumber.get(0);
		needToPick = listNumber.get(1);
		
		listNew=PickExpert.pickExpert1(countEffected, selected, CompanyCountlist, list, companyList, flagOfCompanyLimited, noNeedNumber, x, countAge, needToPick, all);
		return listNew;

	}    
    
	 /**????????????list?????????????????????,??????????????????????????????
     * @return
     * @Title: createRandomListNormal
     * @Description: TODO
     * @param list
     * @param i
     * @return void
     * @throws
     */
	  public static List createRandomListNormal(List<Map<String,Object>> list, int n,int m) {
	        // TODO Auto-generated method stub
	        Map map = new HashMap();
	        int all=m*n;
	        List listNew = new ArrayList();
	        if(list.size()<=all){
	            return list;
	        }else{
	            while(map.size()<all){
	                int random = (int) (Math.random() * list.size());
	                if (!map.containsKey(random)) {
	                    map.put(random, "");
	                    System.out.println(random+"==========="+list.get(random));
	                    listNew.add(list.get(random));
	                }
	            }
	            return listNew;
	        }
	    }
    
	  /**?????????????????????
	   	*
	     */
	  public static String judgePro_type(String pro_type) {
		  switch (pro_type) {
			case SystemContant.director:
				pro_type=SystemContant.directorAll;
				break;
			case SystemContant.roadAndBridge:
				pro_type=SystemContant.roadAndBridgeAll;
				break;
			case SystemContant.portAndChannel:
				pro_type=SystemContant.portAndChannelAll;
				break;
			case SystemContant.roadBuildingMachine:
				pro_type=SystemContant.roadBuildingMachineAll;
				break;
			case SystemContant.portAndChannelMachine:
				pro_type=SystemContant.portAndChannelMachineAll;
				break;
			case SystemContant.trafficMechatronics:
				pro_type=SystemContant.trafficMechatronicsAll;
				break;
			case SystemContant.transportation:
				pro_type= SystemContant.transportationAll;
				break;
			}
		  return pro_type;
	}
	  
    
    /**????????????
     * @param dateOfBirth
     * @return
     */
    public static int getAge(Date dateOfBirth) {
        int age = 0;
        Calendar born = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        if (dateOfBirth != null) {
            now.setTime(new Date());
            born.setTime(dateOfBirth);
            if (born.after(now)) {
                // throw new IllegalArgumentException("??????????????????????????????");
                return 0;
            }
            age = now.get(Calendar.YEAR) - born.get(Calendar.YEAR);
            int nowDayOfYear = now.get(Calendar.DAY_OF_YEAR);
            int bornDayOfYear = born.get(Calendar.DAY_OF_YEAR);
            System.out.println("nowDayOfYear:" + nowDayOfYear + " bornDayOfYear:" + bornDayOfYear);
            if (nowDayOfYear < bornDayOfYear) {
                age -= 1;
            }
        }
        return age;
    }

    /**
     * ???String????????????,???????????????2011-11-11????????????2011???11???11???,???StringPattern("2011-11-11","yyyy-MM-dd","yyyy???MM???dd???").
     * @param date String ????????????????????????
     * @param oldPattern String ???????????????????????????????????????
     * @param newPattern String ??????????????????????????????
     * @return String
     */
    public static String StringPattern(String date, String oldPattern, String newPattern) {
        if (date == null || oldPattern == null || newPattern == null) {
            return "";
        }
        SimpleDateFormat sdf1 = new SimpleDateFormat(oldPattern) ;        // ?????????????????????
        SimpleDateFormat sdf2 = new SimpleDateFormat(newPattern) ;        // ?????????????????????
        Date d = null ;
        try{
            d = sdf1.parse(date) ;   // ?????????????????????????????????????????????
        }catch(Exception e){            // ???????????????????????????????????????????????????????????????
            e.printStackTrace() ;       // ??????????????????
        }
        return sdf2.format(d);
    }

    //??????????????????????????????
    public static int yearDateDiff(String startDate,String endDate){
        Calendar calBegin = Calendar.getInstance(); //??????????????????
        Calendar calEnd = Calendar.getInstance();
        calBegin.setTime(stringTodate(startDate,"yyyy")); //??????????????????????????????????????????
        calEnd.setTime(stringTodate(endDate,"yyyy"));
        return calEnd.get(Calendar.YEAR) - calBegin.get(Calendar.YEAR);
    }
    //??????????????????????????????????????????
    public static Date stringTodate(String dateStr, String formatStr) {
        // ???????????????????????????????????????
        Date date = null;
        SimpleDateFormat format = new SimpleDateFormat(formatStr);
        if (dateStr != null && !dateStr.equals("")) {
            String time = "";
            try {
                Date dateTwo = format.parse(dateStr);
                time = format.format(dateTwo);
                date = format.parse(time);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        } else {
            String timeTwo = format.format(new Date());
            try {
                date = format.parse(timeTwo);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return date;
    }

    public static void main(String[] args) throws Exception {
        //		try {
        //			String s=ResultConstant.ImageConverteStr("e:\\1.jpg");
        //			ResultConstant.GenerateImage(s, "e:\\2.png");
        //		} catch (IOException e) {
        //			e.printStackTrace();
        //		}


        //postHttp("1111111", "");
        // System.out.println( ResultConstant.isValidDate(""));
        //ResultConstant.readXmlFile();


    }
    
    
}
