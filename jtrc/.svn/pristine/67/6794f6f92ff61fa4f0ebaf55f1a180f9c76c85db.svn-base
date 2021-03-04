package com.i84.earnpoint.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MenuNode;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.DepartmentInfo;
import com.i84.earnpoint.model.MsgInfo;
import com.i84.earnpoint.model.TypeInfo;
import com.i84.earnpoint.model.User;
import com.i84.earnpoint.service.DepartmentInfoService;
import com.i84.earnpoint.service.MsgInfoService;
import com.i84.earnpoint.service.ZxTypeInfoService;
import com.i84.earnpoint.system.service.UserService;

@Controller
@RequestMapping("/zxgl")
public class ZixunManageController extends ResultConstant{

    @Autowired
    private ZxTypeInfoService zxTypeInfoService;
    @Autowired
    private MsgInfoService msgInfoService;

    @Autowired
    private DepartmentInfoService departmentInfoService;


    /**
     * 添加资讯类别
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/addTypeInfo")
    public void addTypeInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String parentId = request.getParameter("parentId");
        TypeInfo typeInfo = zxTypeInfoService
                .selectTypeInfoByPrimaryKey(parentId == null ? -1 : Integer
                        .valueOf(parentId));
        int seq = zxTypeInfoService
                .selectMaxSeqByParentId(parentId == null ? -1 : Integer
                        .valueOf(parentId)) + 1;
        String pno = typeInfo == null ? String.format("%02d", seq) : typeInfo
                .getPno() + String.format("%02d", seq);
        String name = request.getParameter("typeName");
        typeInfo = new TypeInfo();
        typeInfo.setName(name);
        typeInfo.setSeq(seq);
        typeInfo.setPno(pno);
        typeInfo.setParentId(parentId == null ? -1 : Integer.valueOf(parentId));
        int result = zxTypeInfoService.insertTypeInfo(typeInfo);
        if (result > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("fail");
        }

    }

    /**
     * 修改资讯类别
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateTypeInfo")
    public void updateTypeInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        String name = request.getParameter("typeName");
        TypeInfo typeInfo = zxTypeInfoService
                .selectTypeInfoByPrimaryKey(Integer.valueOf(id));
        typeInfo.setName(name);
        int result = zxTypeInfoService.updateTypeInfo(typeInfo);
        if (result > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("fail");
        }

    }

    /**
     * 删除资讯类别
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/deleteTypes")
    public void deleteTypes(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String ids = request.getParameter("ids");
        zxTypeInfoService.deleteTypeInfoByPrimaryKeys(ids, response);
        ;

    }

    @RequestMapping("/getTypeInfo")
    public void getTypeInfoById(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        TypeInfo typeInfo = zxTypeInfoService
                .selectTypeInfoByPrimaryKey(id == null ? -1 : Integer
                        .valueOf(id));
        TypeInfo parent = zxTypeInfoService
                .selectTypeInfoByPrimaryKey(typeInfo == null ? -1 : typeInfo
                        .getParentId());
        JSONObject obj = new JSONObject();
        obj.put("pName", parent == null ? "root" : parent.getName());
        obj.put("orderNo", typeInfo.getSeq());
        obj.put("typeCode", typeInfo.getPno());
        obj.put("typeName", typeInfo.getName());
        response.getWriter().write(obj.toString());
    }

    /**
     * 根据ajax请求设置资讯类别对话框的内容
     * 
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/setTypeInfoByAjax")
    public void setTypeInfoByAjax(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        TypeInfo typeInfo = zxTypeInfoService
                .selectTypeInfoByPrimaryKey(id == null ? -1 : Integer
                        .valueOf(id));
        int seq = zxTypeInfoService.selectMaxSeqByParentId(id == null ? -1
                : Integer.valueOf(id)) + 1;
        JSONObject obj = new JSONObject();
        if (seq <= 99) {
            obj.put("result", 1);
            obj.put("pName", typeInfo == null ? "root" : typeInfo.getName());
            obj.put("orderNo", seq);
            obj.put("typeCode", typeInfo == null ? String.format("%02d", seq)
                    : typeInfo.getPno() + String.format("%02d", seq));
            response.getWriter().write(obj.toString());
        } else {
            obj.put("result", "当前节点序号超过限制");
        }
    }

    @RequestMapping("/listTypeInfoTree")
    public void listTypeInfoTree(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String parent_id = request.getParameter("parent_id");
        response.setContentType("text/html;charset=utf-8");
        long start=System.currentTimeMillis();
        List<MenuNode> nodes = listMenuNodeByParentId(parent_id != null && !parent_id.isEmpty() ? Integer
                .valueOf(parent_id) : -1);
        response.getWriter().write(JSONArray.fromObject(nodes).toString());
        long end=System.currentTimeMillis();
        System.out.println(end-start);

    }

    @RequestMapping("/listTypeInfo")
    public @ResponseBody
    Map<String, Object> listTypeInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int page = TextUtil.getInt(request.getParameter("page"));
        page = (page == 0 ? 1 : page);
        int rows = TextUtil.getInt(request.getParameter("rows"));
        String parentId = request.getParameter("pid");
        TypeInfo typeInfo = new TypeInfo();
        typeInfo.setPage(page);
        typeInfo.setRows(rows);
        String selectTypeCode = request.getParameter("selectTypeCode");
        String selectTypeName = request.getParameter("selectTypeName");
        if (selectTypeName != null && !selectTypeName.trim().isEmpty()) {
            typeInfo.setName("%" + selectTypeName + "%");
        }
        if (selectTypeCode != null && !selectTypeCode.trim().isEmpty()) {
            typeInfo.setPno(selectTypeCode);
        }
        typeInfo.setParentId(parentId != null ? Integer.valueOf(parentId)
                : null);
        PageHelper.startPage(page, rows);
        List<TypeInfo> typeInfos = zxTypeInfoService.queryZxTypeInfos(typeInfo);
        PageInfo<TypeInfo> pageinfo = new PageInfo<TypeInfo>(typeInfos);
        return resultMap(typeInfos, pageinfo.getTotal(), true, null);
    }

    /**
     * 根据父节点生成菜单树
     * 
     * @param parentid
     * @return
     */
    public List<MenuNode> listMenuNodeByParentId(Integer parentid) {
        List<TypeInfo> typeInfos = zxTypeInfoService
                .listTypeInfoByParentid(parentid);
        /**List<MenuNode> nodes = new ArrayList<MenuNode>();
		if (typeInfos != null && typeInfos.size() > 0) {
			for (int i = 0; i < typeInfos.size(); i++) {
				TypeInfo typeInfo = typeInfos.get(i);
				MenuNode node = new MenuNode();
				Integer id=typeInfo.getId();
				node.setId(String.valueOf(id));
				node.setText(typeInfo.getName());
				node.setState("open");
				boolean flag=zxTypeInfoService.getChildTypeInfoIfExists(typeInfo.getPno(), typeInfo.getId())!=null?true:false;
				if(flag){
				  node.setChildren(listMenuNodeByParentId(id));
				}
				nodes.add(node);
			}
		}
         */

        /**
         * 迭代方式
         */
        //初始化root
        List<MenuNode> roots=new ArrayList<MenuNode>();
        List<MenuNode> temp=new ArrayList<MenuNode>();
        for(int i=0;i<typeInfos.size();i++){
            TypeInfo typeInfo=typeInfos.get(i);
            MenuNode node=new MenuNode();
            node.setId(""+typeInfo.getId());
            node.setText(typeInfo.getName());
            node.setState("open");
            node.setPid(""+typeInfo.getChildCount());
            roots.add(node);
            temp.add(node);
        }
        while(!roots.isEmpty()){
            MenuNode root=roots.get(0);
            List<MenuNode> children=new ArrayList<MenuNode>();
            if(!root.getPid().equals("0")){
                List<TypeInfo> list=zxTypeInfoService.listTypeInfoByParentid(Integer.parseInt(root.getId()));
                for(int i=0;i<list.size();i++){
                    TypeInfo typeInfo=list.get(i);
                    MenuNode node=new MenuNode();
                    node.setId(""+typeInfo.getId());
                    node.setText(typeInfo.getName());
                    node.setState("open");
                    node.setPid(""+typeInfo.getChildCount());
                    children.add(node);
                }
            }
            root.setChildren(children);
            roots.remove(0);
            roots.addAll(children);
        }
        return temp;

    }




    @RequestMapping("/insertMsgInfo")
    public void insertMsgInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        Integer typeId = TextUtil.getInt(request.getParameter("typeIdId"));
        String typeName = request.getParameter("msgType");
        String fjParam = request.getParameter("fjParam");
        String departm = request.getParameter("departm");
        String publishDate = request.getParameter("publishDate");
        String content = request.getParameter("content");
        //		Integer seq = msgInfoService.selectMaxSeqByTypeId(typeId) + 1;
        Integer seq = TextUtil.getInt(request.getParameter("orderNo"));
        if(msgInfoService.hasMsgInfoSeq(null,typeId,seq)){
            response.getWriter().write("序号已存在");
            response.getWriter().flush();
            return;
        }
        MsgInfo msgInfo = new MsgInfo();
        msgInfo.setTitle(title);
        msgInfo.setTypeInfoId(typeId);
        msgInfo.setAddDate(DateUtil.stringToDate(publishDate, "yyyy-MM-dd HH:mm:ss"));
        msgInfo.setSeq(seq);
        msgInfo.setTypeName(typeName);
        msgInfo.setDepartment(departm);
        // 信息展示：.信息展示（标题+内容（可含图片）
        if (typeName.equals("1")) {
            // 发布人需要获取当前操作的用户
            String creator = request.getParameter("creator");
            User user = userService.selectByUserName(creator);
            if (user == null) {
                response.getWriter().write("账号或密码错误！");
                response.getWriter().flush();
                return;
            }
            msgInfo.setUid(user != null ? user.getUserid() : 0);
            msgInfo.setHtml(content);

        }// 新闻：标题+发布人+发布时间+内容（可含图片）
        else if (typeName.equals("2")) {
            // 发布人需要获取当前操作的用户
            String creator = request.getParameter("creator");
            User user = userService.selectByUserName(creator);
            if (user == null) {
                response.getWriter().write("账号或密码错误！");
                response.getWriter().flush();
                return;
            }
            msgInfo.setUid(user != null ? user.getUserid() : 0);
            msgInfo.setHtml(content);

        } // 链接：只有标题，点击跳转
        else if (typeName.equals("3")) {
            String creator = request.getParameter("creator");
            User user = userService.selectByUserName(creator);
            if (user == null) {
                response.getWriter().write("账号或密码错误！");
                response.getWriter().flush();
                return;
            }
            msgInfo.setUid(user != null ? user.getUserid() : 0);
            String url = request.getParameter("url");
            msgInfo.setUrl(url);

        }// 下载：只有标题，点击下载附件
        if (!typeName.equals("3")) {
            //			MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
            //			MultipartFile file = mrequest.getFile("file");
            //			if (file != null && file.getSize() / 1024 / 1024 > 2
            //					&& typeName.equals("4")) {
            //				response.getWriter().write("上传文件大小不能大于10M");
            //				response.getWriter().flush();
            //				return;
            //			}
            //
            //			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //			String now = format.format(new Date());
            //			String dstPath = new File(getClass().getClassLoader()
            //					.getResource("").getPath()).getParentFile().getParentFile()
            //					.getPath()
            //					+ "/upload/msginfos/" + now;
            //
            //			String filename = FileUtil.upload(file, dstPath);
            //			if (filename != null) {
            //				// 文件上传到后台
            //				msgInfo.setOther(request.getContextPath() + "/upload/msginfos/"
            //						+ now + "/" + filename);
            //			}

        }
        int count = msgInfoService.insertMsgInfo(msgInfo,fjParam);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("添加资讯信息失败！");
        }

    }

    @RequestMapping("/updateMsgInfo")
    public void updateMsgInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        Integer id = TextUtil.getInt(request.getParameter("id"));
        response.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        String fjParam = request.getParameter("fjParam");
        Integer typeId = TextUtil.getInt(request.getParameter("typeIdId"));
        String typeName = request.getParameter("msgType");
        String departm = request.getParameter("departm");
        String publishDate = request.getParameter("publishDate");
        String content = request.getParameter("content");
        //		Integer seq = msgInfoService.selectMaxSeqByTypeId(typeId) + 1;
        Integer seq = Integer.parseInt(request.getParameter("orderNo"));
        if(msgInfoService.hasMsgInfoSeq(id,typeId,seq)){
            response.getWriter().write("序号已存在");
            response.getWriter().flush();
            return;
        }
        MsgInfo msgInfo = new MsgInfo();
        msgInfo.setId(id);
        msgInfo.setTitle(title);
        msgInfo.setTypeInfoId(typeId);
        msgInfo.setDepartment(departm);
        msgInfo.setAddDate(DateUtil.stringToDate(publishDate, "yyyy-MM-dd HH:mm:ss"));
        msgInfo.setSeq(seq);
        msgInfo.setTypeName(typeName);
        // 信息展示：.信息展示（标题+内容（可含图片）
        if (typeName.equals("1")) {
            String creator = request.getParameter("creator");
            User user = userService.selectByUserName(creator);
            if (user == null) {
                response.getWriter().write("账号或密码错误！");
                response.getWriter().flush();
                return;
            }
            msgInfo.setUid(user != null ? user.getUserid() : 0);
            msgInfo.setHtml(content);

        }// 新闻：标题+发布人+发布时间+内容（可含图片）
        else if (typeName.equals("2")) {
            // 发布人需要获取当前操作的用户
            String creator = request.getParameter("creator");
            User user = userService.selectByUserName(creator);
            if (user == null) {
                response.getWriter().write("账号或密码错误！");
                response.getWriter().flush();
                return;
            }
            msgInfo.setUid(user != null ? user.getUserid() : 0);
            msgInfo.setHtml(content);

        } // 链接：只有标题，点击跳转
        else if (typeName.equals("3")) {
            String creator = request.getParameter("creator");
            User user = userService.selectByUserName(creator);
            if (user == null) {
                response.getWriter().write("账号或密码错误！");
                response.getWriter().flush();
                return;
            }
            msgInfo.setUid(user != null ? user.getUserid() : 0);
            String url = request.getParameter("url");
            msgInfo.setUrl(url);

        }// 下载：只有标题，点击下载附件
        if (!typeName.equals("3")) {
            //			MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
            //			MultipartFile file = mrequest.getFile("file");
            //			if (file != null && file.getSize() / 1024 / 1024 > 2
            //					&& typeName.equals("4")) {
            //				response.getWriter().write("上传文件大小不能大于10M");
            //				response.getWriter().flush();
            //				return;
            //			}
            //
            //			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            //			String now = format.format(new Date());
            //			String dstPath = new File(getClass().getClassLoader()
            //					.getResource("").getPath()).getParentFile().getParentFile()
            //					.getPath()
            //					+ "/upload/msginfos/" + now;
            //
            //			String filename = FileUtil.upload(file, dstPath);
            //			if (filename != null) {
            //				// 文件上传到后台
            //				msgInfo.setOther(request.getContextPath() + "/upload/msginfos/"
            //						+ now + "/" + filename);
            //			}

        }
        int count = msgInfoService.updateMsgInfo(msgInfo,fjParam);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("修改资讯信息失败！");
        }

    }

    @RequestMapping("/listMsgInfo")
    public void listMsgInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int page = TextUtil.getInt(request.getParameter("page"));
        String orderNo = request.getParameter("selectOrderNo");
        String title = request.getParameter("selectTitle");
        String creator = request.getParameter("selectCreator");
        String msgType = request.getParameter("selectMsgType");
        String publishDateStar = request.getParameter("selectPublishDateStar");
        String publishDateEnd = request.getParameter("selectPublishDateEnd");
        int rows = TextUtil.getInt(request.getParameter("rows"));
        // int rows=TextUtil.getInt(request.getParameter("rows"));
        String typeId = request.getParameter("pid");
        MsgInfo msgInfo = new MsgInfo();
        if (typeId != null && !typeId.trim().isEmpty()) {
            msgInfo.setTypeInfoId(Integer.valueOf(typeId));
        }
        if (orderNo != null && !orderNo.trim().isEmpty()) {
            msgInfo.setSeq(TextUtil.getInt(orderNo));
        }
        if (title != null && !title.trim().isEmpty()) {
            msgInfo.setTitle(title);
        }
        if (creator != null && !creator.trim().isEmpty()) {
            msgInfo.setUid(TextUtil.getInt(creator));
        }
        if (msgType != null && !msgType.trim().isEmpty()) {
            if (!msgType.equals("0")) {
                msgInfo.setTypeName(msgType);
            }
        }

        if(publishDateStar !=null&&!publishDateStar.trim().isEmpty()){
            msgInfo.setPublishDateStar(publishDateStar);
        }

        if(publishDateEnd !=null&&!publishDateEnd.trim().isEmpty()){
            msgInfo.setPublishDateEnd(publishDateEnd);
        }
        // msgInfo.setAddDate();
        PageHelper.startPage(page, rows);
        List<MsgInfo> msgInfos = msgInfoService.listMsgInfo(msgInfo);
        PageInfo<MsgInfo> pageInfo = new PageInfo<MsgInfo>(msgInfos);
        JSONObject objs = new JSONObject();
        JSONArray jArray = new JSONArray();
        for (int i = 0; i < msgInfos.size(); i++) {
            JSONObject jobj = new JSONObject();
            MsgInfo mi = msgInfos.get(i);
            jobj.put("id1", mi.getId());
            TypeInfo typeInfo = zxTypeInfoService.selectTypeInfoByPrimaryKey(mi
                    .getTypeInfoId());
            jobj.put("typeId", typeInfo != null ? typeInfo.getName() : "");
            jobj.put("typeIdId", typeInfo != null ? typeInfo.getId() : 0);
            jobj.put("orderNo", mi.getSeq());
            jobj.put("msgType", mi.getTypeName());
            Integer uid = mi.getUid();
            User user = userService.selectByPrimaryKey(uid == null ? 1 : uid);
            jobj.put("creator", user != null ? user.getUsername() : "");
            jobj.put("publishDate",
                    mi.getAddDate() == null ? "" : new SimpleDateFormat(
                            "yyyy-MM-dd HH:mm:ss").format(mi.getAddDate()));
            jobj.put("title", mi.getTitle());
            jobj.put("html", mi.getHtml());
            jobj.put("other", mi.getOther());
            jobj.put("url", mi.getUrl());
            jArray.add(jobj);
        }
        objs.put("rows", jArray);
        objs.put("total", pageInfo.getTotal());
        objs.put("flag", true);
        objs.put("cause", null);
        response.getWriter().write(objs.toString());

    }

    @Autowired
    private UserService userService;

    @RequestMapping("/deleteMsgInfo")
    public void deleteMsgInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        String ids = request.getParameter("ids");
        int count = msgInfoService.deleteMsgInfo(ids);
        if (count > 0) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("刪除资讯失败");
        }
    }
    @RequestMapping("/uploadImage")
    public void uploadContentImage(@RequestParam("upload") CommonsMultipartFile uploadFile,HttpServletRequest request,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        // CKEditor提交的很重要的一个参数
        String callback = request.getParameter("CKEditorFuncNum");
        String expandedName = ""; // 文件扩展名
        DiskFileItem item= (DiskFileItem)uploadFile.getFileItem();
        File upload=item.getStoreLocation();
        String uploadContentType=item.getContentType();
        if (uploadContentType.equals("image/pjpeg")
                || uploadContentType.equals("image/jpeg")) {
            // IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
            expandedName = ".jpg";
        } else if (uploadContentType.equals("image/png")
                || uploadContentType.equals("image/x-png")) {
            // IE6上传的png图片的headimageContentType是"image/x-png"
            expandedName = ".png";
        } else if (uploadContentType.equals("image/gif")) {
            expandedName = ".gif";
        } else if (uploadContentType.equals("image/bmp")) {
            expandedName = ".bmp";
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
            out.println("</script>");
            return;
        }
        if (upload.length() > 600 * 1024) {
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件大小不得大于600k');");
            out.println("</script>");
            return;
        }

        InputStream is = new FileInputStream(upload);
        //图片上传路径
        String uploadPath =getWEB_ROOTPath()+"/upload/images/";
        String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
        fileName += expandedName;
        File file = new File(uploadPath);
        if (!file.exists()) { // 如果路径不存在，创建
            file.mkdirs();
        }
        File toFile = new File(uploadPath, fileName);
        OutputStream os = new FileOutputStream(toFile);
        byte[] buffer = new byte[1024];
        int length = 0;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
        is.close();
        os.close();

        // 返回"图像"选项卡并显示图片  request.getContextPath()为web项目名
        out.println("<script type=\"text/javascript\">");
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                + ",'" + request.getContextPath() + "/upload/images/" + fileName + "','')");
        out.println("</script>");

    }

    @ResponseBody
    @RequestMapping("/selectMaxSeqByTypeId")
    public Object selectMaxSeqByTypeId(HttpServletRequest request,HttpServletResponse response){
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("result_code",1);
        result.put("result_msg","获取成功");
        int maxSeq;
        try {
            Integer typeId = Integer.parseInt(request.getParameter("typeInfoId"));
            maxSeq = msgInfoService.selectMaxSeqByTypeId(typeId);
            result.put("result_data",++maxSeq);
        } catch (Exception e) {
            result.put("result_code",0);
            result.put("result_msg",e.getLocalizedMessage());
        }
        return result;
    }

    //获取部门信息
    @ResponseBody
    @RequestMapping("/getDepartment")
    public Object getDepartment(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Map<String,Object> result = new HashMap<String,Object>();

        response.setCharacterEncoding("utf-8");
        Integer id = TextUtil.getInt(request.getParameter("id"));
        response.setCharacterEncoding("utf-8");
        String type = request.getParameter("type");
        DepartmentInfo departmentInfo=new DepartmentInfo();
        List<DepartmentInfo> ld=null;
        List<MsgInfo> lm=null;
        if("1".equals(type)){
            User user = userService.selectByPrimaryKey(id);
            departmentInfo.setId(user.getDepartmentId());
            ld=departmentInfoService.listDepartmentInfo(departmentInfo);
        }else{
            MsgInfo msgInfo=new MsgInfo();
            msgInfo.setId(id);
            lm = msgInfoService.listMsgInfo(msgInfo);
        }

        if(ld!=null && ld.size()>0){
            result.put("result_code",1);
            result.put("result_msg","获取成功");
            result.put("rows", ld.get(0));
        }else if(lm!=null && lm.size()>0){
            result.put("result_code",1);
            result.put("result_msg","获取成功");
            result.put("rows", lm.get(0));
        }
        else {
            result.put("result_code",0);
        }

        return result;
    }


    /**添加附件
     * @param response
     * @param request
     */
    @RequestMapping("/zxUpload")
    public  void zxUpload(HttpServletResponse response,HttpServletRequest request){
        boolean flag=false;
        String cause="";

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
                    System.out.println(fileName);
                    //上传时生成的临时文件保存目录
                    String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/zxgl/upload/";
                    File tmpFile = new File(tempPath);
                    if (!tmpFile.exists()) {
                        //创建临时目录
                        tmpFile.mkdir();

                    }
                    String newFileName=ResultConstant.getRandNum(32)+"."+ResultConstant.lastIndexOf(fileName, ".");
                    String localPath =ResultConstant.getWEB_ROOTPath() +"temp/zxgl/upload/"+ newFileName;
                    File newFile = new File(localPath);
                    System.out.println("临时文件保存路径："+localPath);
                    //上传的文件写入到指定的文件中
                    file.transferTo(newFile);
                    Map<String, Object>map=new HashMap<String, Object>();
                    map.put("name", fileName);
                    map.put("url", "temp/zxgl/upload/"+newFileName);
                    map.put("flag", true);
                    //return ResultConstant.resultMap(map,true,cause);
                    //						Map<String, Object> resultMap = new HashMap<String, Object>();
                    //				    	resultMap.put("rows", map);
                    //						resultMap.put("flag", true);
                    //						resultMap.put("cause", cause);

                    //String json=ResultConstant.mapToJson(map);
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
        //return ResultConstant.resultMap(flag,cause);

    }


    /**附件列表
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/zxglfjList")
    public  @ResponseBody Map<String, Object> zxglfjList(HttpServletResponse response,HttpServletRequest request,String aid){
        boolean flag=false;
        String cause="";
        List<Map> list=null;
        try {

            if(StringUtils.isNotBlank(aid)){
                List<Map<String,Object>> fjlist=new ArrayList<Map<String,Object>>();
                Map<String, Object> m1=	new HashMap<String, Object>();
                m1.put("aid", aid);
                m1.put("fileType", 4);//附件类型（4：后台咨询新增列表）
                list=msgInfoService.selectfj(m1);
                if(list!=null &&list.size()>0){
                    for(Map<String, Object> fjMap:list){
                        fjMap.put("url", fjMap.get("file_url"));
                        fjMap.put("name", fjMap.get("file_name"));
                        fjMap.put("aid", fjMap.get("aid"));
                        fjMap.put("id", fjMap.get("id"));
                        fjlist.add(fjMap);
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

}
