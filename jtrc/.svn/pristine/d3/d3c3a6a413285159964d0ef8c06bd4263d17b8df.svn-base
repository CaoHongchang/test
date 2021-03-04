package com.i84.earnpoint.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.FileUtil;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.AdverInfo;
import com.i84.earnpoint.model.AdverTypeInfo;
import com.i84.earnpoint.service.AdverInfoService;
import com.i84.earnpoint.service.AdverTypeInfoService;

/**
 * 图片管理
 * 
 * @author CHEN
 * 
 */
@Controller
@RequestMapping("/tpgl")
public class AdverManageController {
    @Autowired
    private AdverTypeInfoService adverTypeInfoService;
    @Autowired
    private AdverInfoService adverInfoService;

    /**
     * 插入图片类别
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/insertAdverTypeInfo")
    public void insertAdverTypeInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        // String code=request.getParameter("code");
        String title = request.getParameter("title");
        String size1 = request.getParameter("size1");
        String size2 = request.getParameter("size2");
        String imageType = request.getParameter("imageType");
        AdverTypeInfo adverTypeInfo = new AdverTypeInfo();
        List<AdverTypeInfo> adverTypeInfos = adverTypeInfoService
                .listAdverTypeInfo(adverTypeInfo);
        adverTypeInfo
        .setpCode(String.format("%05d", adverTypeInfos.size() + 1));
        adverTypeInfo.setTitle(title);
        adverTypeInfo.setWidth(Float.valueOf(size1));
        adverTypeInfo.setHeight(Float.valueOf(size2));
        adverTypeInfo.setSeq(Integer.valueOf(imageType));
        int count = adverTypeInfoService.insertAdverTypeInfo(adverTypeInfo);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("插入图片分类失败");
        }
    }

    /**
     * 分页列出图片类别
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/listAdverTypeInfo")
    public void listAdverTypeInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int page = TextUtil.getInt(request.getParameter("page"));
        int rows=TextUtil.getInt(request.getAttribute("rows"));
        // int rows=TextUtil.getInt(request.getParameter("rows"));
        AdverTypeInfo adverTypeInfo = new AdverTypeInfo();
        String selectCode = request.getParameter("selectCode");
        String selectTitle = request.getParameter("selectTitle");
        String selectImageType = request.getParameter("selectImageType");
        if (selectCode != null && !selectCode.trim().isEmpty()) {
            adverTypeInfo.setpCode("%" + selectCode + "%");
        }
        if (selectTitle != null && !selectTitle.trim().isEmpty()) {
            adverTypeInfo.setTitle("%" + selectTitle + "%");
        }
        if (selectImageType != null && !selectImageType.trim().isEmpty()) {
            if (Integer.valueOf(selectImageType) != 0) {
                adverTypeInfo.setSeq(Integer.valueOf(selectImageType));
            }
        }
        PageHelper.startPage(page, rows);
        List<AdverTypeInfo> adverTypeInfos = adverTypeInfoService
                .listAdverTypeInfo(adverTypeInfo);
        PageInfo<AdverTypeInfo> pageinfo = new PageInfo<AdverTypeInfo>(
                adverTypeInfos);
        JSONArray jArray = new JSONArray();
        JSONObject objs = new JSONObject();
        for (int i = 0; i < adverTypeInfos.size(); i++) {
            adverTypeInfo = adverTypeInfos.get(i);
            JSONObject jobj = new JSONObject();
            jobj.put("id1", adverTypeInfo.getId());
            jobj.put("code", adverTypeInfo.getpCode());
            jobj.put("title", adverTypeInfo.getTitle());
            jobj.put(
                    "size",
                    adverTypeInfo.getWidth() + "	X	"
                            + adverTypeInfo.getHeight());
            jobj.put("imageType", adverTypeInfo.getSeq());
            jArray.add(jobj);
        }
        objs.put("rows", jArray);
        objs.put("total", pageinfo.getTotal());
        objs.put("flag", true);
        objs.put("cause", null);
        response.getWriter().write(objs.toString());
        // return resultMap(adverTypeInfos, pageinfo.getTotal(), true, null);
    }

    /**
     * @param ResultRows
     *            :结果集对象
     * @param total
     *            :总页数
     * @param flag
     *            :是否成功
     * @param cause
     *            ：失败原因
     * @return
     */
    public Map<String, Object> resultMap(Object ResultRows, Long total,
            boolean flag, String cause) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("rows", ResultRows);
        resultMap.put("total", total);
        resultMap.put("flag", flag);
        resultMap.put("cause", cause);
        return resultMap;

    }

    @RequestMapping("/deleteAdverTypeInfo")
    public void deleteTypeInfoByIds(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String ids = request.getParameter("ids");
        response.setCharacterEncoding("utf-8");
        int count = adverTypeInfoService.deleteAdverTypeInfoByIdArray(ids);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("删除图片分类失败！");
        }
    }

    @RequestMapping("/updateAdverTypeInfo")
    public void updateAdverTypeInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String code = request.getParameter("code");
        String title = request.getParameter("title");
        String size1 = request.getParameter("size1");
        String size2 = request.getParameter("size2");
        String imageType = request.getParameter("imageType");
        AdverTypeInfo adverTypeInfo = new AdverTypeInfo();
        adverTypeInfo.setId(Integer.valueOf(id));
        adverTypeInfo.setpCode(code);
        adverTypeInfo.setTitle(title);
        adverTypeInfo.setWidth(Float.valueOf(size1));
        adverTypeInfo.setHeight(Float.valueOf(size2));
        adverTypeInfo.setSeq(Integer.valueOf(imageType));
        int count = adverTypeInfoService
                .updateAdverTypeInfoBySelective(adverTypeInfo);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("更新图片分类失败！");
        }
    }

    /**
     * 分页列出图片类别树
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/listAdverTypeInfoTree")
    public void listAdverTypeInfoTree(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        AdverTypeInfo adverTypeInfo = new AdverTypeInfo();
        List<AdverTypeInfo> adverTypeInfos = adverTypeInfoService
                .listAdverTypeInfo(adverTypeInfo);
        JSONArray jArray = new JSONArray();
        for (int i = 0; i < adverTypeInfos.size(); i++) {
            adverTypeInfo = adverTypeInfos.get(i);
            JSONObject jobj = new JSONObject();
            jobj.put("id", adverTypeInfo.getId());
            jobj.put("text", adverTypeInfo.getTitle());
            jobj.put("children", new JSONArray());
            jobj.put("imageType", adverTypeInfo.getSeq());
            jArray.add(jobj);
        }

        response.getWriter().write(jArray.toString());
    }

    @RequestMapping("/insertAdverInfo")
    public void insertAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int size =1024*1024;
        String code = adverInfoService.generateFlowNum();
        // 发布人需要获取当前操作的用户
        String orderNo = request.getParameter("orderNo");
        String picTitle = request.getParameter("picTitle");
        Integer typeId = TextUtil.getInt(request.getParameter("typeId"));
        String imageType = request.getParameter("imageType");
        String url = request.getParameter("url");
        String useTime = request.getParameter("useTime");
        String disableTime = request.getParameter("disableTime");
        String createTime = request.getParameter("createTime");
        try{
            MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
            MultipartFile file = mrequest.getFile("file");

            AdverInfo adverInfo = new AdverInfo();
            adverInfo.setPno(code);
            adverInfo.setAdverTypeId(typeId);
            adverInfo.setTypeName(imageType);
            adverInfo.setLink(url);
            adverInfo.setSeq(Integer.valueOf(orderNo));
            adverInfo.setName(picTitle);
            adverInfo.setAddDate(DateUtil.stringToDate(createTime, "yyyy-MM-dd HH:mm:ss"));
            adverInfo.setdDate(DateUtil.stringToDate(disableTime, "yyyy-MM-dd HH:mm:ss"));
            adverInfo.setpDate(DateUtil.stringToDate(useTime, "yyyy-MM-dd HH:mm:ss"));

            String filename = FileUtil.savePicture(file, request);
            System.out.println(filename);
            if (filename != null) {
                // 文件上传到后台
                adverInfo.setAdr(request.getContextPath() + filename);
            }
            if(file.getSize()>size)
            {
            	response.getWriter().write("图片大小应小于1M");
            }
            else{
	            int count = adverInfoService.insertAdverInfo(adverInfo);
	            if (count > 0) {
	                response.getWriter().write("1");
	            } else {
	                response.getWriter().write("添加图片失败！");
	            }
            }
        }catch(Exception e){
            response.getWriter().write(e.getMessage());
        }
    }

    @RequestMapping("/updateAdverInfo")
    public void updateAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int size = 1024*1024;
        Integer id = TextUtil.getInt(request.getParameter("id"));
        String code = request.getParameter("code");
        // 发布人需要获取当前操作的用户
        String orderNo = request.getParameter("orderNo");
        String picTitle = request.getParameter("picTitle");
        Integer typeId = TextUtil.getInt(request.getParameter("typeId"));
        String imageType = request.getParameter("imageType");
        String url = request.getParameter("url");
        String useTime = request.getParameter("useTime");
        String disableTime = request.getParameter("disableTime");
        String createTime = request.getParameter("createTime");
        
        try{
            MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
            MultipartFile file = mrequest.getFile("file");
            
            AdverInfo adverInfo = adverInfoService.selectAdverInfoById(id);
            if(adverInfo==null){
             adverInfo =new AdverInfo();
            }
            adverInfo.setId(id);
            adverInfo.setPno(code);
            adverInfo.setAdverTypeId(typeId);
            adverInfo.setTypeName(imageType);
            adverInfo.setLink(url);
            adverInfo.setSeq(Integer.valueOf(orderNo));
            adverInfo.setName(picTitle);
            adverInfo.setAddDate(DateUtil.stringToDate(createTime, "yyyy-MM-dd HH:mm:ss"));
            adverInfo.setdDate(DateUtil.stringToDate(disableTime, "yyyy-MM-dd HH:mm:ss"));
            adverInfo.setpDate(DateUtil.stringToDate(useTime, "yyyy-MM-dd HH:mm:ss"));
            
            String filename = FileUtil.savePicture(file, request);
            if (filename.substring(filename.lastIndexOf(".") + 1) != null && !filename.substring(filename.lastIndexOf(".") + 1).equals("")) {
                // 文件上传到后台
                adverInfo.setAdr(request.getContextPath() + filename);
            }
            else if(filename == null){
                response.getWriter().write("修改图片失败！");
                return;
            }
            if(file.getSize()>size)
            {
            	response.getWriter().write("图片大小应小于1M");
            }
            else {
                int count = adverInfoService.updateAdverInfo(adverInfo);
                if (count > 0) {
                    response.getWriter().write("1");
                } else {
                    response.getWriter().write("修改图片失败！");
                }
			}
        }catch(Exception e){
            response.getWriter().write(e.getMessage());
        }

    }

    @RequestMapping("/listAdverInfo")
    public void listAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int page = TextUtil.getInt(request.getParameter("page"));
        page = page == 0 ? 1 : page;
        int rows=TextUtil.getInt(request.getParameter("rows"));
        // int rows=TextUtil.getInt(request.getParameter("rows"));
        String selectCode = request.getParameter("selectCode");
        String selectTypeTitle = request.getParameter("selectTypeTitle");
        String selectImageType = request.getParameter("selectImageType");
        String selectPicTitle = request.getParameter("selectPicTitle");
        String selectCreateTime = request.getParameter("selectCreateTime");
        String selectUseTime = request.getParameter("selectUseTime");
        String selectDisableTime = request.getParameter("selectDisableTime");
        AdverInfo adverInfo = new AdverInfo();
        if (selectCode != null && !selectCode.trim().isEmpty()) {
            adverInfo.setPno("%"+selectCode+"%");
        }
        if (selectTypeTitle != null && !selectTypeTitle.trim().isEmpty()) {
            adverInfo.setAdverTypeId(Integer.valueOf(selectTypeTitle));
        }
        if (selectImageType != null && !selectImageType.trim().isEmpty()) {
            if(!selectImageType.equals("0")){
                adverInfo.setTypeName(selectImageType);
            }
        }
        if (selectPicTitle != null && !selectPicTitle.trim().isEmpty()) {
            adverInfo.setName("%"+selectPicTitle+"%");
        }
        if (selectCreateTime != null && !selectCreateTime.trim().isEmpty()) {
            adverInfo.setAddDate(DateUtil.stringToDate(selectCreateTime, "yyyy-MM-dd"));
        }
        if (selectUseTime != null && !selectUseTime.trim().isEmpty()) {
            adverInfo.setpDate(DateUtil.stringToDate(selectUseTime, "yyyy-MM-dd"));
        }
        if (selectDisableTime != null && !selectDisableTime.trim().isEmpty()) {
            adverInfo.setdDate(DateUtil.stringToDate(selectDisableTime, "yyyy-MM-dd"));
        }
        PageHelper.startPage(page, rows);
        List<AdverInfo> adverInfos = adverInfoService.listAdverInfo(adverInfo);
        PageInfo<AdverInfo> pageInfo=new PageInfo<AdverInfo>(adverInfos);
        JSONObject objs = new JSONObject();
        JSONArray jArray = new JSONArray();
        for (int i = 0; i < adverInfos.size(); i++) {
            JSONObject jobj = new JSONObject();
            AdverInfo mi = adverInfos.get(i);
            jobj.put("id1", mi.getId());
            jobj.put("code", mi.getPno());
            jobj.put(
                    "typeTitle",
                    adverTypeInfoService.selectAdverTypeInfoById(
                            mi.getAdverTypeId()).getTitle());
            jobj.put("picTitle", mi.getName());
            jobj.put("typeId", mi.getTypeName());
            jobj.put("tid", mi.getAdverTypeId());
            jobj.put("createTime",
                    mi.getAddDate()!=null?new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(mi.getAddDate()):"");
            jobj.put("useTime",
                    mi.getpDate()!=null?new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(mi.getpDate()):"");
            jobj.put("disableTime",
                    mi.getdDate()!=null?new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(mi.getdDate()):"");
            jobj.put("orderNo", mi.getSeq());
            jobj.put("url", mi.getLink());
            jobj.put("adr", mi.getAdr());
            jArray.add(jobj);
        }
        objs.put("rows", jArray);
        objs.put("total", pageInfo.getTotal());
        objs.put("flag", true);
        objs.put("cause", null);
        response.getWriter().write(objs.toString());

    }

    @RequestMapping("/deleteAdverInfo")
    public void deleteAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        String ids = request.getParameter("ids");
        int count = adverInfoService.deleteAdverInfo(ids);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("刪除图片失败");
        }
    }
    @RequestMapping("/pullofAdverInfo")
    public void pullofAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        String id=request.getParameter("id");
        String disableTime=request.getParameter("disableTime");
        AdverInfo adverInfo=new AdverInfo();
        adverInfo.setId(Integer.valueOf(id));
        adverInfo.setdDate(DateUtil.stringToDate(disableTime, "yyyy-MM-dd"));
        int count=adverInfoService.updateAdverInfo(adverInfo);
        if(count>0){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("下架图片失败！");
        }
    }
    @RequestMapping("/generatePno")
    public void generateAdverInfoPno(HttpServletRequest request,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(adverInfoService.generateFlowNum());
        response.getWriter().flush();
    }

}
