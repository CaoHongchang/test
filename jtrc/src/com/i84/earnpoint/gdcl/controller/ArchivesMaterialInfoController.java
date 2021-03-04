package com.i84.earnpoint.gdcl.controller;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.gdcl.service.ArchivesMaterialInfoService;
import com.i84.earnpoint.model.ArchivesMaterialInfo;
import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;
/**
 * 履历材料
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesMaterialInfoController extends ResultConstant{
    @Autowired
    private ArchivesMaterialInfoService archivesMaterialInfoService;

    /**附件列表
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/clfjList")
    public  @ResponseBody Map<String, Object> clfjList(HttpServletResponse response,HttpServletRequest request){
        boolean flag=false;
        String cause="";
        List<Map<String,Object>> list=null;
        try {
            String aid=request.getParameter("aid");
            String fileType=request.getParameter("fileType");
            if(StringUtils.isNotBlank(aid)){
                List<Map<String,Object>> fjlist=new ArrayList<Map<String,Object>>();
                Map<String, Object> m1=	new HashMap<String, Object>();
                m1.put("aid", aid);
                m1.put("fileType", fileType);//材料类型（1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
                list=archivesMaterialInfoService.selectByClFjList(m1);
                if(list!=null &&list.size()>0){
                    for(Map<String, Object> fjMap:list){
                        Map<String, Object> fjMap2=new HashMap<String, Object>();
                        fjMap2.put("url", fjMap.get("file_url"));
                        fjMap2.put("name", fjMap.get("file_name"));
                        fjMap2.put("aid", fjMap.get("aid"));
                        fjMap2.put("id", fjMap.get("id"));
                        //fjMap.put("fjUrl", fjMap.get("fjUrl"));
                        fjlist.add(fjMap2);

                    }
                }
                return ResultConstant.resultMap(fjlist,flag,cause);

            }
            return ResultConstant.resultMap(null,flag,cause);

        }catch (Exception e) {
            e.printStackTrace();
            flag=false;
            cause="数据异常";
        }
        return ResultConstant.resultMap(list,flag,cause);

    }
    /**附件下载
     * @param response
     * @param request
     */
    @RequestMapping("/downFj")
    @ResponseBody
    public void downFj(HttpServletResponse response,HttpServletRequest request){
        try {
            String id=request.getParameter("id");

            if(StringUtils.isNotEmpty(id)){
                ArchivesMaterialOtherInfo a=archivesMaterialInfoService.selectByPrimaryKey(Integer.valueOf(id));
                ResultConstant.fileDownload(request, response, "",a.getFileUrl() ,a.getFileName());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
      
    /**添加附件
     * @param response
     * @param request
     */
    @RequestMapping("/fjUpload")
    public  void fjUpload(HttpServletResponse response,HttpServletRequest request){
        boolean flag=false;
        String cause="";
        String dpno=request.getParameter("dpno");
        if(dpno!=null){
            try {

                //获取解析器
                CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
                //判断是否是文件
                if(resolver.isMultipart(request)){
                    //进行转换
                    MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)(request);
                    //获取所有文件名称
                    Iterator<String> it = multiRequest.getFileNames();
                    while(it.hasNext()){
                        //根据文件名称取文件
                        MultipartFile file = multiRequest.getFile(it.next());
                        String fileName = file.getOriginalFilename();//原文件名
                        String ext = ResultConstant.lastIndexOf(fileName, ".").toLowerCase();
                        if(!ext.equals("png")&&!ext.equals("jpg")&&!ext.equals("jpeg")){
                            cause="只允许上传 png、jpg、jpeg格式文件";
                            JSONObject jsonObject=new JSONObject();
                            jsonObject.put("flag", false);
                            jsonObject.put("cause", cause);
                            ResultConstant.write(response, jsonObject);
                            break;
                        }
                        System.out.println(fileName);
                        //上传时生成的临时文件保存目录
                        String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/daxxgl/upload/";
                        File tmpFile = new File(tempPath);
                        if (!tmpFile.exists()) {
                            //创建临时目录
                            tmpFile.mkdirs();

                        }
                        String newFileName=dpno+"+"+ResultConstant.getRandNum(32)+"."+ResultConstant.lastIndexOf(fileName, ".");
                        String localPath =ResultConstant.getWEB_ROOTPath() +"temp/daxxgl/upload/"+ newFileName;
                        File newFile = new File(localPath);
                        System.out.println("临时文件保存路径："+localPath);
                        //上传的文件写入到指定的文件中
                        file.transferTo(newFile);
                        Map<String, Object>map=new HashMap<String, Object>();
                        map.put("name", fileName);
                        map.put("url", "temp/daxxgl/upload/"+newFileName);
                        map.put("flag", true);

                        JSONObject jsonObject=new JSONObject();
                        jsonObject.put("flag", true);
                        jsonObject.put("rows", map);
                        jsonObject.put("cause", cause);
                        ResultConstant.write(response, jsonObject);
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
                flag=false;
                cause="数据上传异常";
            }
        }else{
            flag=false;
            cause="数据上传异常";
        }
        //return ResultConstant.resultMap(flag,cause);
    }

    /**图片查看
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/getImgView")
    public  @ResponseBody Map<String, Object> getImgView(HttpServletResponse response,HttpServletRequest request){
        boolean flag=false;
        String cause="";
        try {
            String id=request.getParameter("id")==null?"":request.getParameter("id").toString();
            if(StringUtils.isNotBlank(id)){
                ArchivesMaterialOtherInfo a=archivesMaterialInfoService.selectByPrimaryKey(Integer.valueOf(id));
                Map<String, Object> map=ResultConstant.beanToMap(a);
                return ResultConstant.resultMap(map,true,cause);
            }

        }catch (Exception e) {
            e.printStackTrace();
            flag=false;
            cause="数据加载异常";
        }
        return ResultConstant.resultMap(null,flag,cause);


    }


    /**
     * 保存和修改履历材料
     * @param param
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/saveArchivesMaterialInfo")
    public void saveArchivesMaterialInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
        JSONObject object=new JSONObject();response.setCharacterEncoding("utf-8");
        String type=(String)param.get("type");
        String pname=(String)param.get("pname");
        String uploadFile=request.getParameter("uploadFile");
        String pdate=(String)param.get("pdate");
        String remark=(String)param.get("remark");
        String pno=(String)param.get("pno");
        String fjparam=request.getParameter("fjParam");
        String ptype=(String)param.get("ptype");

        String staff=(String) request.getSession().getAttribute("uid");
        ArchivesMaterialInfo record=new ArchivesMaterialInfo();
        //材料名称
        if(pname!=null&&!pname.trim().isEmpty()){
            record.setpName(pname);
        }
        String pagenum=(String)param.get("page_num");
        if(pagenum!=null&&!pagenum.trim().isEmpty()){
            record.setPageNum(TextUtil.getInt(pagenum));
        }
        //真实时间
        if(pdate!=null&&!pdate.trim().isEmpty()){
            record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
        }else{
        	record.setpDate(null);
        }
        //档案号
        if(pno!=null&&!pno.trim().isEmpty()){
            record.setpNo(pno);
        }
        //备注
        if(remark!=null){
            record.setRemark(remark);
        }
        //录入人
        if(staff!=null&&!staff.trim().isEmpty()){
            record.setStuff(Integer.valueOf(staff));
        }
        //录入时间
        record.setAddDate(new Date());
        try{
            if (uploadFile != null && !"".equals(uploadFile)) {
                String suffix=uploadFile.substring(uploadFile.lastIndexOf("."));
                String upsufix=suffix.toUpperCase();
                System.out.println(upsufix);
                if(!".JPG".equals(upsufix)&&!".JPEG".equals(upsufix)&&!".PNG".equals(upsufix)&&!".TIFF".equals(upsufix)){
                    object.put("flag", false);
                    object.put("cause", "文件格式需为JPG，JPEG，PNG，TIFF格式！");
                    write(response, object);
                    return;
                }
                String newFilename=ResultConstant.getRandNum(32)+suffix;
                // 上传文件
                File upload = fileupload(request, response, "upload/archives/",
                        newFilename);
                if (upload != null) {

                    FileInputStream stream=new FileInputStream(upload);
                    long size=stream.getChannel().size();
                    if(size/1024/1024>3){//判断文件大小是否大于3M，删除文件
                        object.put("flag", false);
                        object.put("cause", "文件大小不能大于3M！");
                        write( response,object);
                        stream.close();
                        upload.delete();
                        return ;
                    }
                    stream.close();
                    // 设置文件名
                    record.setFileName(newFilename);
                    // 设置文件路径
                    record.setpUrl("/upload/archives/" + newFilename);
                    // 设置文件编码
                    record.setFileCode(new SimpleDateFormat(
                            DateUtil.YYYYMMDDHHMISS).format(new Date()));
                }else{
                    object.put("flag", false);
                    object.put("cause", "文件上传失败！");
                    write( response,object);
                    return;
                }
            }

            //插入
            if(type!=null&&type.trim().equals("")){
                // 设置文件编码
                record.setFileCode(new SimpleDateFormat(
                        DateUtil.YYYYMMDDHHMISS).format(new Date()));
                int count= archivesMaterialInfoService.insertArchivesMaterialInfoSelective(record,fjparam,ptype);
                if(count>0){
                    object.put("flag", true);
                    object.put("cause", "保存履历材料成功！");
                }else{
                    object.put("flag", false);
                    object.put("cause", "保存履历材料失败！");
                }

            }else{//修改
                record.setId(TextUtil.getInt(type));
                int count= archivesMaterialInfoService.updateArchivesMaterialInfoSelective(record,fjparam,ptype);
                if(count>0){
                    object.put("flag", true);
                    object.put("cause", "修改履历材料成功！");
                }else{
                    object.put("flag", false);
                    object.put("cause", "修改履历材料失败！");
                }
            }
            write( response,object);
        }catch(Exception e){
            e.printStackTrace();
            object.put("flag", false);
            object.put("cause", e.getMessage());
            write( response,object);
        }
    }

    @RequestMapping("/queryArchivesMaterialInfo")
    public @ResponseBody Map<String,Object> queryArchivesMaterialInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{

        String pno=(String)param.get("pno");
        int page=TextUtil.getInt(param.get("page"));
        page=page==0?1:page;
        int rows=TextUtil.getInt(param.get("rows"));
        PageHelper.startPage(page, rows);
        ArchivesMaterialInfo record=new ArchivesMaterialInfo();
        record.setpNo(pno);
        List<Map<String,Object>> list= archivesMaterialInfoService.listArchivesMaterialInfos(record);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    /**
     * 导出材料清单
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportMaterials")
    public void exportMaterials(HttpServletRequest request,HttpServletResponse response)throws Exception{
        String pnos=request.getParameter("pnos");
        archivesMaterialInfoService.exportMaterialList(pnos, response);
    }
    /**
     * 下载文件
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/downFileFromUrlCheck")
    public void downFileFromUrlCheck(HttpServletRequest request,HttpServletResponse response)throws Exception{
        String pname = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
        System.out.println(pname);
        String filename=request.getParameter("filename");
        JSONObject object=new JSONObject();
        if("null".equals(filename)){
            object.put("flag", 2);
            write(response,object);
            return;
        }
        String suffix=filename.substring(filename.lastIndexOf("."));
        String path=getWEB_ROOTPath()+"/upload/archives/"+filename;

        try{
            File f = new File(path);
            if(f.exists()){
                object.put("flag", 1);
                write(response,object);
            }else{
                object.put("flag", 2);
                write(response,object);
            }

        }catch(Exception e){
            object.put("flag", 3);
            write(response,object);
        }
    }
    /**
     * 下载文件
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/downFileFromUrl")
    public void downFileFromUrl(HttpServletRequest request,HttpServletResponse response)throws Exception{
        String pname = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
        System.out.println(pname);
        String filename=request.getParameter("filename");
        String suffix=filename.substring(filename.lastIndexOf("."));
        String path=getWEB_ROOTPath()+"/upload/archives/"+filename;
        try{
            File f = new File(path);
            if(f.exists()){
                InputStream is=new FileInputStream(f);

                OutputStream out=outputStream(request, response, pname+new SimpleDateFormat(DateUtil.YYYYMMDDHHMISS).format(new Date())+suffix);
                byte [] buff=new byte [1024];
                while(is.read(buff)!=-1){
                    out.write(buff);
                }
                is.close();
                out.close();
            }else{
                write(response,"<script>window.history.back();alert('还未上传附件不能下载！');</script>");
            }

        }catch(Exception e){
            write(response,"<script>alert('文件已被删除！');window.history.go(-1);</script>");
        }
    }
    /**附件下载
     * @param response
     * @param request
     */
    @RequestMapping("/down_Fj")
    @ResponseBody
    public void down_Fj(HttpServletResponse response,HttpServletRequest request){
        try {
            ResultConstant.fileDownload(request, response, "",request.getParameter("url"),"缺失材料.jpg");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
        /**
         * 把服务器中照片旋转一定角度，在保存到服务器
     
         * @return
         
         * @throws IOException */
        @RequestMapping("/rotatePhoto")
        public @ResponseBody Map<String, Object> rotatePhoto(HttpServletRequest request,HttpServletResponse response) throws IOException{
            String fhz="旋转同步成功";
            boolean flag=true;
            String src = request.getParameter("src").replaceAll("/jtrc/", "");
            String angle1 = request.getParameter("angle1");
            int degree =90;
            try {//从服务器读取照片

                
       
                 int x; // 原点横坐标
                 int y; // 原点纵坐标
                  File file = new File(ResultConstant.getWEB_ROOTPath() +src);
                  if (!file.isFile()) {
                	  flag=true;
                      throw new Exception("ImageDeal>>>" + file + " 不是一个图片文件!");
                  }
                 BufferedImage bi = ImageIO.read(file); // 读取该图片
 
                 BufferedImage des = rotate(bi, degree); 
              	
                  int t = src.indexOf(".");
                  
                  File sf = new File(ResultConstant.getWEB_ROOTPath() +src);
                  ImageIO.write(des,src.substring(t+1), sf); // 保存图片
        }catch(Exception e){
        	fhz = "同步异常!";
        	flag=true;
        	e.printStackTrace();
        }
            return ResultConstant.resultMap(null,flag,fhz);
        }
       
    	/**
    	 * 调整图片角度
    	 * make by dongxh 2017年11月1日下午3:51:08
    	 * @param src
    	 * @param angel
    	 * @return
    	 */
    	public  BufferedImage rotate(Image src, int angel) {  
            int src_width = src.getWidth(null);  
            int src_height = src.getHeight(null);  
            // calculate the new image size  
            Rectangle rect_des = CalcRotatedSize(new Rectangle(new Dimension(  
                    src_width, src_height)), angel);  
      
            BufferedImage res = null;  
            res = new BufferedImage(rect_des.width, rect_des.height,  
                    BufferedImage.TYPE_INT_RGB);  
            Graphics2D g2 = res.createGraphics();  
            // transform  
            g2.translate((rect_des.width - src_width) / 2,  
                    (rect_des.height - src_height) / 2);  
            g2.rotate(Math.toRadians(angel), src_width / 2, src_height / 2);  
      
            g2.drawImage(src, null, null);  
            return res;  
        }
    	/**
    	 * 计算旋转参数
    	 * make by dongxh 2017年11月1日下午3:51:29
    	 * @param src
    	 * @param angel
    	 * @return
    	 */
        public static Rectangle CalcRotatedSize(Rectangle src, int angel) {  
            // if angel is greater than 90 degree, we need to do some conversion  
            if (angel >= 90) {  
                if(angel / 90 % 2 == 1){  
                    int temp = src.height;  
                    src.height = src.width;  
                    src.width = temp;  
                }  
                angel = angel % 90;  
            }  
      
            double r = Math.sqrt(src.height * src.height + src.width * src.width) / 2;  
            double len = 2 * Math.sin(Math.toRadians(angel) / 2) * r;  
            double angel_alpha = (Math.PI - Math.toRadians(angel)) / 2;  
            double angel_dalta_width = Math.atan((double) src.height / src.width);  
            double angel_dalta_height = Math.atan((double) src.width / src.height);  
      
            int len_dalta_width = (int) (len * Math.cos(Math.PI - angel_alpha  
                    - angel_dalta_width));  
            int len_dalta_height = (int) (len * Math.cos(Math.PI - angel_alpha  
                    - angel_dalta_height));  
            int des_width = src.width + len_dalta_width * 2;  
            int des_height = src.height + len_dalta_height * 2;  
            return new Rectangle(new Dimension(des_width, des_height));  
        }  
}
