package com.i84.earnpoint.sydwzp.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.BgActivityInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityInfoService;

import net.sf.json.JSONArray;

/**
 * 活动信息
 * @author linyj
 *
 */
@Controller
@RequestMapping("/bgActivityInfo")
public class BgActivityInfoController extends ResultConstant{
	@Autowired
	private BgActivityInfoService bgActivityInfoService;
	
	    // 活动列表
		@RequestMapping("/list")
		public @ResponseBody Map<String,Object> list(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
			
			String type = request.getParameter("type");
			
			if(null == type) {
				int page=TextUtil.getInt(params.get("page"));
				int rows=TextUtil.getInt(params.get("rows"));
				PageHelper.startPage(page, rows);
				List<Map<String,Object>> list=bgActivityInfoService.queryBgActivityInfos(params);
				PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
				return resultMap(list, pageInfo.getTotal(), true, "");
			} else {
				int page=TextUtil.getInt(params.get("page"));
				int rows=TextUtil.getInt(params.get("rows"));
				PageHelper.startPage(page, rows);
				List<Map<String,Object>> list=bgActivityInfoService.queryBgActivityInfos2(params);
				PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
				return resultMap(list, pageInfo.getTotal(), true, "");
			}
			
		}
		
		//获取最大编号
		@RequestMapping("/selectMaxPno")
		public void selectMaxPno(BgActivityInfo bgActivityInfo, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			
				String pno = bgActivityInfoService.selectMaxPno();

				if(pno == null) {
					result("BK001", response);
					return;
				}
				
				//编号生成规则
				String id =  Integer.parseInt(pno.substring(2, pno.length()))+1+"";
				String temp = "";
				for(int i = 0; i < (3-id.length()); i++) {
					temp += "0";
				}
				pno = pno.substring(0, 2) + temp + id;
				System.out.println(pno);
			
				result(pno, response);
		}

	    // 添加活动
		@RequestMapping("/add")
		public void add(BgActivityInfo bgActivityInfo, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			String result = "";
			try {
				String pno = bgActivityInfoService.selectMaxPno();
				if(pno == null) {
					pno = "BK001";
				} else {
					//编号生成规则
					String id =  Integer.parseInt(pno.substring(2, pno.length()))+1+"";
					String temp = "";
					for(int i = 0; i < (3-id.length()); i++) {
						temp += "0";
					}
					pno = pno.substring(0, 2) + temp + id;
				}
				
				bgActivityInfo.setPno(pno);
				int num = bgActivityInfoService.insertSelective(bgActivityInfo);
				result = num+"";
			} catch (Exception e) {
				e.printStackTrace();
				result = "添加新活动异常!";
			}
			write(response,result);
		}	
		
	    // 编辑活动
		@RequestMapping("/edit")
		public void edit(BgActivityInfo bgActivityInfo, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			String result = "";
			try {
				int id = bgActivityInfoService.updateByPrimaryKeySelective(bgActivityInfo);
				result = id+"";
			} catch (Exception e) {
				result = "修改活动信息异常!";
			}
			write(response,result);
		}	
		
	    // 删除活动
		@RequestMapping("/delete")
		public void delete(Integer ids, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			String result = "";
			try {
				int id = bgActivityInfoService.deleteByPrimaryKey(ids);
				System.out.println(id);
				result = id +"";
			} catch (Exception e) {
				result = "删除活动异常!";
			}
			write(response,result);
		}	
		
}
