package com.i84.earnpoint.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
    private FileUtil() {

    }

    public static void In2Out(InputStream in, OutputStream out)
            throws IOException {
        if (in != null && out != null) {
            byte buf[] = new byte[1024];
            int len = 0;
            while ((len = in.read(buf)) != -1) {
                out.write(buf, 0, len);
            }
        }
        if (in != null) {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                in = null;
            }

        }
        if (out != null) {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                out = null;
            }
        }
    }

    public static String upload(MultipartFile src, String dstPath) throws IOException {

        if (!src.isEmpty()) {
            // 文件上传到后台
            String suffix = src.getOriginalFilename();
            if(suffix.lastIndexOf(".")!=-1){
                suffix = suffix.substring(suffix.lastIndexOf("."));
                String filename = UUID.randomUUID().toString() + suffix;
                File dst = new File(dstPath);
                if (!dst.exists()) {
                    dst.mkdirs();
                }
                dst = new File(dst.getPath() + "/" + filename);
                try {
                    dst.createNewFile();
                    FileUtil.In2Out(src.getInputStream(), new FileOutputStream(dst));
                    return filename;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public static boolean isimg(String fileName) {
        if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".gif") || fileName.endsWith(".png")) { return true; }
        return false;
    }

    //上传图片
    public static String uploadImg(MultipartFile src, String dstPath) throws IOException {

        if (!src.isEmpty()) {
            // 文件上传到后台
            String suffix = src.getOriginalFilename();
            if (suffix.lastIndexOf(".") != -1) {
                suffix = suffix.substring(suffix.lastIndexOf("."));
                // 验证图片后缀
                if (!isimg(suffix)) { return null; }
                String filename = UUID.randomUUID().toString() + suffix;
                File dst = new File(dstPath);
                if (!dst.exists()) {
                    dst.mkdirs();
                }
                dst = new File(dst.getPath() + "/" + filename);
                try {
                    dst.createNewFile();
                    FileUtil.In2Out(src.getInputStream(), new FileOutputStream(dst));
                    return filename;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    //文件保存到服务器上
    public static String savePicture(MultipartFile file, HttpServletRequest request)
            throws IOException, FileNotFoundException {
        String imgPath = "/upload/image";
        String imgPathDir = request.getParameter("imgPathDir");
        if(StringUtils.isNotBlank(imgPathDir)){
            imgPath = imgPathDir;
        }
        String d = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
        imgPath = imgPath + File.separator + d;
        String ImagePath = request.getSession().getServletContext().getRealPath(imgPath);
        File fileDir = new File(ImagePath);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }
        String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        String imgName = System.nanoTime() + "." + ext;
        File targetfile =  new File(ImagePath, imgName);
        InputStream ins = file.getInputStream();
        FileOutputStream fos = new FileOutputStream(targetfile);

        byte b[] = new byte[1024];
        int temp = 0;

        while((temp = ins.read(b)) != -1){
            fos.write(b, 0, temp);
        }

        fos.close();
        ins.close();

        return (imgPath + File.separator + imgName).replace("\\", "/");
    }

}
