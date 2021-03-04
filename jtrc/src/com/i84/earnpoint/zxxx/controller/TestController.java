package com.i84.earnpoint.zxxx.controller;



import java.io.File;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.hygsgl.service.YgInfoService;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.HyBusinessInfo;
import com.i84.earnpoint.model.YgImportVo;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * 员工管理
 * @author liu_quan
 *
 */

@Controller
@RequestMapping("/testCtr")
public class TestController {
	private Logger logger = Logger.getLogger(this.getClass().getName()); 
	 
	 
	/**员工导入
	 * @param response
	 * @param request
	 */
	@RequestMapping("/ygUpload")  
	public  @ResponseBody Map<String, Object> ygUpload(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		List<YgImportVo> yglist=null;
		Long total=null;

		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";
			File newFile=ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
			if(newFile!=null){
				//读取导入的文件
				ImportExcel<BmbImport> importExcel = new ImportExcel<BmbImport>(BmbImport.class);
				List<BmbImport> results = (List<BmbImport>) importExcel.importExcel(newFile);
				if(results!=null&&results.size()>0){
					//数量不能超过1000条
					for (BmbImport bmbImport : results) {
						//System.out.println(bmbImport.ge() + "\t" + ygImportVo.getCsny() + "\t" + ygImportVo.getHqsj());
						System.out.println(bmbImport.getClassId()+";"+bmbImport.getPnum());
					}
					flag=true;
				}else{
					return ResultConstant.resultMap(false,"文件中未上传任何数据");

				}
			}else{
				cause="数据上传异常";
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(yglist,total,flag, dateFlag,cause);

	}

	 
}
