package com.i84.earnpoint.rsdlgl.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.model.TypeInfo;
import com.i84.earnpoint.rsdlgl.service.TypeInfoService;

/**
 * 分类管理
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/typeInfo")
public class TypeInfoController {
    @Autowired
    private TypeInfoService typeInfoService;

    @RequestMapping("/menu")
    public void menu(HttpServletResponse response,HttpServletRequest request) throws Exception{
        String parentId = request.getParameter("parentId");//父id默认0
        List<TypeInfo> typeInfoList = typeInfoService.selectListByPrimaryKey(null);
        JSONArray jsonArray = getAuthsByParentId(typeInfoList,parentId);
        ResultConstant.write(response,jsonArray);
    }

    @RequestMapping("/getNextPno")
    public void getNextPno(HttpServletResponse response,HttpServletRequest request) throws Exception{
        String pno = typeInfoService.getNextPno();
        ResultConstant.write(response,pno);
    }

    @RequestMapping("/typeInfoList")
    public  @ResponseBody Map<String, Object> typeInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
        int page = TextUtil.getInt(request.getParameter("page"));
        if (page == 0) {
            page = 1;
        }
        int rows = TextUtil.getInt(request.getParameter("rows"));
        //判断是否是子节点（1子节点 其他：父节点）
        String parentId = request.getParameter("parentId");
        TypeInfo record=new TypeInfo();
        record.setPage(page);
        record.setRows(rows);
        if(StringUtils.isNotBlank(parentId)){
            record.setParentId(Integer.parseInt(parentId));
        }
        String pno = request.getParameter("pno");
        String name = request.getParameter("name");
        if(StringUtils.isNotBlank(pno)){
            record.setPno(pno.trim());
        }
        if(StringUtils.isNotBlank(name)){
            record.setName(name.trim());
        }
        List<TypeInfo> list = typeInfoService.selectListByPrimary(record);
        PageInfo<TypeInfo> pageinfo=new PageInfo<TypeInfo>(list);
        return resultMap(list, pageinfo.getTotal(), true, null);
    }

    @RequestMapping("/typeInfoListJson")
    public  @ResponseBody void typeInfoListJson(HttpServletResponse response,HttpServletRequest request) throws Exception{
        List<TypeInfo> list = typeInfoService.loadTypeInfo();
        String jsonList = JSONArray.fromObject(list).toString();
        System.out.println(jsonList);
        ResultConstant.write(response, jsonList);
    }

    @RequestMapping("/del")
    public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
        String ids = request.getParameter("ids");
        typeInfoService.deleteByPrimaryKeys(ids,response);
    }

    @RequestMapping("/save")
    public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
        TypeInfo typeInfo = new TypeInfo();
        String pno = request.getParameter("pno");
        String name = request.getParameter("name");
        typeInfo.setPno(pno);
        typeInfo.setName(name);
        typeInfo.setParentId(0);
        typeInfo.setIsValid("1");
        typeInfo.setTypeId(5);
        typeInfoService.insert(typeInfo,response);
    }

    @RequestMapping("/update")
    public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
        TypeInfo typeInfo = new TypeInfo();
        String id = request.getParameter("id");
        String pno = request.getParameter("pno");
        String name = request.getParameter("name");
        typeInfo.setPno(pno);
        typeInfo.setName(name);
        typeInfo.setId(Integer.parseInt(id));
        typeInfo.setParentId(0);
        typeInfo.setTypeId(5);
        typeInfo.setIsValid("1");
        typeInfoService.updateByPrimaryKey(typeInfo,response);
    }

    @RequestMapping("/childTypeInfoList")
    public  @ResponseBody Map<String, Object> childTypeInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
        int page = TextUtil.getInt(request.getParameter("page"));
        if (page == 0) {
            page = 1;
        }
        int rows = TextUtil.getInt(request.getParameter("rows"));
        String parentId = request.getParameter("parentId");
        String id = request.getParameter("id");
        TypeInfo record=new TypeInfo();
        record.setPage(page);
        record.setRows(rows);
        if(StringUtils.isNotBlank(parentId)){
            record.setParentId(Integer.parseInt(parentId));
        }
        if(StringUtils.isNotBlank(id)){
            record.setId(Integer.parseInt(id));
        }

        String pno = request.getParameter("pno");
        String name = request.getParameter("name");
        if(StringUtils.isNotBlank(pno)){
            record.setPno(pno.trim());
        }
        if(StringUtils.isNotBlank(name)){
            record.setName(name.trim());
        }
        List<TypeInfo> list = typeInfoService.selectChildListByPrimary(record);
        PageInfo<TypeInfo> pageinfo=new PageInfo<TypeInfo>(list);
        return resultMap(list, pageinfo.getTotal(), true, null);
    }

    @RequestMapping("/delChild")
    public  @ResponseBody void delChild(HttpServletResponse response,HttpServletRequest request) throws Exception{
        String ids = request.getParameter("ids");
        String childIds = request.getParameter("childIds");
        typeInfoService.deleteChildByPrimaryKeys(ids,childIds,response);
    }

    @RequestMapping("/saveChild")
    public  @ResponseBody void saveChild(HttpServletResponse response,HttpServletRequest request) throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        TypeInfo typeInfo = new TypeInfo();
        RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
        String pno = request.getParameter("pno");
        String name = request.getParameter("ywmcname");
        String parentId = request.getParameter("parentId");
        String sDirect = request.getParameter("sDirect");
        String remark = request.getParameter("remark");
        //		String pic0 = request.getParameter("pic0");
        //		String pic1 = request.getParameter("pic1");
        //		String pic2 = request.getParameter("pic2");
        String pic = request.getParameter("pic");
        rsBusinessInfo.setPic1("");
        rsBusinessInfo.setPic2("");
        rsBusinessInfo.setPic3("");
        if(StringUtils.isNotBlank(pic)){
            String[] picArray = pic.split(",");
            for(int i=0;i<picArray.length;i++){
                if(i == 0){
                    rsBusinessInfo.setPic1(picArray[0]);
                }else if(i == 1){
                    rsBusinessInfo.setPic2(picArray[1]);
                }else if(i == 2){
                    rsBusinessInfo.setPic3(picArray[2]);
                }
            }
        }
        typeInfo.setPno(pno);
        typeInfo.setName(name);
        typeInfo.setParentId(Integer.parseInt(parentId));
        typeInfo.setRemark(remark);
        rsBusinessInfo.setsDirect(sDirect);
        rsBusinessInfo.setPno(pno);
        //		System.out.println("-------------------" + request.getSession().getAttribute("sessionUserId"));
        rsBusinessInfo.setUid(0);
        rsBusinessInfo.setRemark(remark);
        rsBusinessInfo.setAddDate(sdf.format(new Date()));
        rsBusinessInfo.setSstate(0);
        //		if(StringUtils.isNotBlank(pic0) && !"undefined".equals(pic0)){
        //			rsBusinessInfo.setPic1(pic0);
        //		}else{
        //			rsBusinessInfo.setPic1("");
        //		}
        //		if(StringUtils.isNotBlank(pic1) && !"undefined".equals(pic1)){
        //			rsBusinessInfo.setPic2(pic1);
        //		}else{
        //			rsBusinessInfo.setPic2("");
        //		}
        //		if(StringUtils.isNotBlank(pic2) && !"undefined".equals(pic2)){
        //			rsBusinessInfo.setPic3(pic2);
        //		}else{
        //			rsBusinessInfo.setPic3("");
        //		}
        rsBusinessInfo.setParentId(0);
        typeInfoService.insertChild(typeInfo,rsBusinessInfo,response);
    }

    @RequestMapping("/updateChild")
    public  @ResponseBody void updateChild(HttpServletResponse response,HttpServletRequest request) throws Exception{
        TypeInfo typeInfo = new TypeInfo();
        RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
        String id = request.getParameter("id");
        String childId = request.getParameter("childId");
        //		String businessId = request.getParameter("businessId");
        String pno = request.getParameter("pno");
        String name = request.getParameter("name");
        String parentId = request.getParameter("parentId");
        String sDirect = request.getParameter("sDirect");
        String remark = request.getParameter("remark");
        String sstate = request.getParameter("sstate");
        if(StringUtils.isNotBlank(sstate) && sstate.equals("2")){
            rsBusinessInfo.setSstate(0);
        }
        typeInfo.setId(Integer.parseInt(id));
        typeInfo.setPno(pno);
        typeInfo.setName(name);
        typeInfo.setParentId(Integer.parseInt(parentId));
        typeInfo.setIsValid("1");
        typeInfo.setTypeId(5);
        rsBusinessInfo.setId(Integer.parseInt(childId));
        rsBusinessInfo.setsDirect(sDirect);
        rsBusinessInfo.setPno(pno);
        rsBusinessInfo.setUid(0);
        rsBusinessInfo.setParentId(0);
        String pic = request.getParameter("pic");
        rsBusinessInfo.setPic1("");
        rsBusinessInfo.setPic2("");
        rsBusinessInfo.setPic3("");
        if(StringUtils.isNotBlank(pic)){
            String[] picArray = pic.split(",");
            for(int i=0;i<picArray.length;i++){
                if(i == 0){
                    rsBusinessInfo.setPic1(picArray[0]);
                }else if(i == 1){
                    rsBusinessInfo.setPic2(picArray[1]);
                }else if(i == 2){
                    rsBusinessInfo.setPic3(picArray[2]);
                }
            }
        }
        rsBusinessInfo.setRemark(remark);
        typeInfoService.updateChildByPrimaryKey(typeInfo,rsBusinessInfo,response);
    }

    @RequestMapping("/savePic")
    public  @ResponseBody void savePic(HttpServletResponse response,HttpServletRequest request) throws Exception{
        response.setCharacterEncoding("UTF-8");
        String realDir = request.getSession().getServletContext().getRealPath("");
        String contextpath = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + contextpath + "/";

        try {
            String filePath = "uploadfiles";
            String realPath = realDir+"\\"+filePath;
            //判断路径是否存在，不存在则创建
            File dir = new File(realPath);
            if(!dir.isDirectory()) {
                dir.mkdir();
            }

            if(ServletFileUpload.isMultipartContent(request)){

                DiskFileItemFactory dff = new DiskFileItemFactory();
                dff.setRepository(dir);
                dff.setSizeThreshold(1024000);
                ServletFileUpload sfu = new ServletFileUpload(dff);
                FileItemIterator fii = null;
                fii = sfu.getItemIterator(request);
                String title = "";   //图片标题
                String url = "";    //图片地址
                String fileName = "";
                String state="SUCCESS";
                String realFileName="";
                while(fii.hasNext()){
                    FileItemStream fis = fii.next();

                    try{
                        if(!fis.isFormField() && fis.getName().length()>0){
                            fileName = fis.getName();
                            Pattern reg=Pattern.compile("[.]jpg|png|jpeg|gif$");
                            Matcher matcher=reg.matcher(fileName);
                            if(!matcher.find()) {
                                state = "文件类型不允许！";
                                break;
                            }
                            realFileName = new Date().getTime()+fileName.substring(fileName.lastIndexOf("."),fileName.length());
                            url = realPath+"\\"+realFileName;

                            BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流
                            FileOutputStream a = new FileOutputStream(new File(url));
                            BufferedOutputStream output = new BufferedOutputStream(a);
                            Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
                        }else{
                            String fname = fis.getFieldName();

                            if(fname.indexOf("pictitle")!=-1){
                                BufferedInputStream in = new BufferedInputStream(fis.openStream());
                                byte c [] = new byte[10];
                                int n = 0;
                                while((n=in.read(c))!=-1){
                                    title = new String(c,0,n);
                                    break;
                                }
                            }
                        }

                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
                response.setStatus(200);
                String retxt ="{src:'"+basePath+filePath+"/"+realFileName+"',status:success}";
                response.getWriter().print(retxt);
            }
        }catch(Exception ee) {
            ee.printStackTrace();
        }

    }

    /**@RequestParam
     * 这里这里用的是MultipartFile[] myfiles参数,所以前台就要用<input type="file" name="myfiles"/>
     * 上传文件完毕后返回给前台[0`filepath],0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
     */
    @RequestMapping("/fileUpload")
    public  @ResponseBody String fileUpload(@RequestParam MultipartFile[] idFile,HttpServletResponse response,HttpServletRequest request) throws Exception{
        //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
        //这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
        System.out.println("--------------------------------------");
        String realDir = request.getSession().getServletContext().getRealPath("");
        String filePath = "uploadfiles";
        String realPath = realDir+"\\"+filePath;
        //判断路径是否存在，不存在则创建
        File dir = new File(realPath);
        if(!dir.isDirectory()) {
            dir.mkdir();
        }
        //设置响应给前台内容的数据格式
        response.setContentType("text/plain; charset=UTF-8");
        //设置响应给前台内容的PrintWriter对象
        PrintWriter out = response.getWriter();
        //上传文件的原名(即上传前的文件名字)
        String originalFilename = null;
        //如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
        //如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
        //上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
        for(MultipartFile myfile : idFile){
            if(myfile.isEmpty()){
                out.print("1`请选择文件后上传");
                out.flush();
                return null;
            }else{
                originalFilename = myfile.getOriginalFilename();
                System.out.println("文件原名: " + originalFilename);
                System.out.println("文件名称: " + myfile.getName());
                System.out.println("文件长度: " + myfile.getSize());
                System.out.println("文件类型: " + myfile.getContentType());
                if(myfile.getSize() > 2097152){
                    System.out.println("上传的附件大小不能超过2M！");
                    out.print("上传的附件大小不能超过2M！");
                    out.flush();
                    return null;
                }
                String url = realPath+"\\"+originalFilename;
                System.out.println("存放路径 ：" + url);
                System.out.println("========================================");
                try {
                    //这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
                    //此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
                    //					FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));
                    BufferedInputStream in = new BufferedInputStream(myfile.getInputStream());//获得文件输入流
                    FileOutputStream a = new FileOutputStream(new File(url));
                    BufferedOutputStream output = new BufferedOutputStream(a);
                    Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
                } catch (IOException e) {
                    System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
                    e.printStackTrace();
                    out.print("1`文件上传失败，请重试！！");
                    out.flush();
                    return null;
                }
            }
        }
        //此时在Windows下输出的是[D:\Develop\apache-tomcat-6.0.36\webapps\AjaxFileUpload\\upload\愤怒的小鸟.jpg]
        //System.out.println(realPath + "\\" + originalFilename);
        //此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
        //System.out.println(request.getContextPath() + "/upload/" + originalFilename);
        //不推荐返回[realPath + "\\" + originalFilename]的值
        //因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img src="D:/aa.jpg">firefox是不认的
        response.setStatus(200);
        String retxt = "0`" + realPath+"\\"+originalFilename;
        response.getWriter().print(retxt);
        //		out.print("0`" + request.getContextPath() + "/upload/" + originalFilename);
        //		out.flush();
        return null;
    }

    @RequestMapping("/getPicByPath")
    public  @ResponseBody void getPicByPath(HttpServletResponse response,HttpServletRequest request) throws Exception{
        String realDir = request.getSession().getServletContext().getRealPath("");
        String filePath = "uploadfiles";
        String path = request.getParameter("path");//前台传来的存图片路径实体类的主键id
        if(StringUtils.isNotBlank(path)){
            path = new String(path.getBytes("iso8859-1"),"UTF-8");
        }
        System.out.println("------------------" + realDir + "\\" + filePath + "\\" + path);
        if(path != null && !"".equals(path)&& !"null".equals(path)){
            FileInputStream is;
            try {
                is = new FileInputStream(realDir + "\\" + filePath + "\\" + path);
                int i = is.available(); // 得到文件大小
                byte data[] = new byte[i];
                is.read(data); // 读数据
                is.close();
                response.setContentType("image/*"); // 设置返回的文件类型
                OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
                toClient.write(data); // 输出数据
                toClient.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/downloadPic")
    public  @ResponseBody void downloadPic(HttpServletResponse response,HttpServletRequest request) throws Exception{
        //		String realDir = request.getSession().getServletContext().getRealPath("");
        //		String filePath = "uploadfiles";
        //		String path = request.getParameter("path");//前台传来的存图片路径实体类的主键id
        //		if(StringUtils.isNotBlank(path)){
        //			path = new String(path.getBytes("iso8859-1"),"UTF-8");
        //		}
        //		System.out.println("------------------" + realDir + "\\" + filePath + "\\" + path);
        //		URL url = null;
        //		if(path != null && !"".equals(path)){
        //			url = new URL(realDir + "\\" + filePath + "\\" + path);
        //			DataInputStream dataInputStream = new DataInputStream(url.openStream());
        //			String imageName = path;
        //			FileOutputStream fileOutputStream = new FileOutputStream(new File(imageName));
        //
        //			byte[] buffer = new byte[1024];
        //			int length;
        //
        //			while ((length = dataInputStream.read(buffer)) > 0) {
        //				fileOutputStream.write(buffer, 0, length);
        //			}
        //
        //			dataInputStream.close();
        //			fileOutputStream.close();
        //		}
        String filePath = request.getSession().getServletContext().getRealPath("") + "\\uploadfiles";
        String path = request.getParameter("path");//前台传来的存图片路径实体类的主键id
        if(StringUtils.isNotBlank(path)){
            path = new String(path.getBytes("iso8859-1"),"UTF-8");
        }
        System.out.println("------------------" + filePath + "\\" + path);
        String fileNameString = filePath  + "\\" + path;
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        OutputStream os = null;
        FileInputStream fs = null;
        try {
            response.setContentType("image/jpeg;charset=utf-8");
            response.setHeader("Content-disposition", "attachment; " + "filename=demo.jpg");

            fs = new FileInputStream(fileNameString);
            bis = new BufferedInputStream(fs);
            os = response.getOutputStream();
            bos = new BufferedOutputStream(os);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            os.flush();
            response.flushBuffer();

        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            try {
                if (bis != null) {
                    bis.close();
                }
                if (bos != null) {
                    bos.close();
                }
                if (os != null) {
                    os.close();
                }
                if (fs != null) {
                    fs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }



    public JSONArray getAuthsByParentId(List<TypeInfo> typeInfoList,String parentId)throws Exception{
        JSONArray jsonArray=this.getAuthByParentId(typeInfoList,parentId);
        for(int i=0;i<jsonArray.size();i++){
            JSONObject jsonObject=jsonArray.getJSONObject(i);
            //			jsonObject.put("children", getAuthsByParentId(typeInfoList,jsonObject.getString("id")));
        }
        return jsonArray;
    }

    public JSONArray getAuthByParentId(List<TypeInfo> typeInfoLists,String parentId)throws Exception{
        JSONArray jsonArray=new JSONArray();
        if(typeInfoLists!=null&&typeInfoLists.size()>0){
            for(int i=0;i<typeInfoLists.size();i++){
                TypeInfo typeInfo = typeInfoLists.get(i);
                if(typeInfo.getParentId().toString().equals(parentId)){
                    JSONObject jsonObject=new JSONObject();
                    jsonObject.put("id", typeInfo.getId());
                    jsonObject.put("text", typeInfo.getName());
                    jsonObject.put("state", "open");
                    jsonArray.add(jsonObject);
                }
            }
        }
        return  jsonArray;
    }


    public JSONArray getTreeGridAuthByParentId(String parentId)throws Exception{
        JSONArray jsonArray = new JSONArray();
        TypeInfo typeInfo = new TypeInfo();
        typeInfo.setParentId(Integer.valueOf(parentId));
        List<TypeInfo> typeInfoList = typeInfoService.selectListByPrimaryKey(typeInfo);
        if(typeInfoList!=null && typeInfoList.size()>0){
            for(int i=0;i<typeInfoList.size();i++){
                TypeInfo type = typeInfoList.get(i);
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", type.getId());
                jsonObject.put("text", type.getName());
                jsonObject.put("pno", type.getPno());
                jsonObject.put("typeId", type.getTypeId());
                jsonObject.put("typeValue", type.getTypeValue());
                jsonObject.put("remark",type.getRemark());
                jsonObject.put("isValid", type.getIsValid());
                jsonObject.put("seq", type.getSeq());
                jsonObject.put("parentId", type.getParentId());
                jsonArray.add(jsonObject);
            }
        }
        return jsonArray;
    }

    /**
     * @param ResultRows:结果集对象
     * @param total:总页数
     * @param flag:是否成功
     * @param cause：失败原因
     * @return
     */
    public  Map<String, Object> resultMap(Object ResultRows,Long total,boolean flag,String cause){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("rows", ResultRows);
        resultMap.put("total", total);
        resultMap.put("flag", flag);
        resultMap.put("cause", cause);
        return resultMap;

    }
    
    @RequestMapping("/businessTypeStatistics")
    public  @ResponseBody List<Map<String,Object>> businessTypeStatistics(String year1,String year2){
    	List<Map<String, Object>> lists = typeInfoService.businessTypeStatistics(year1, year2);
		return lists;
    }
    
    
    @RequestMapping("/handle")
    public  @ResponseBody List<Map<String,Object>> handle(String year1,String year2,String timeType){
    	List<Map<String, Object>> lists = typeInfoService.handle(year1, year2,timeType);
		return lists;
    }
    
    

}