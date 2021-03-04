package com.i84.earnpoint.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.i84.earnpoint.daxt.service.ArchivesBaseInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesDisciplinedInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesKhInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesMaterialInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesMyInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesOtherInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesOutInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesPoliticalInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesProInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesPtInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesRewardInfoService;
import com.i84.earnpoint.model.ArchivesDisciplinedInfo;
import com.i84.earnpoint.model.ArchivesKhInfo;
import com.i84.earnpoint.model.ArchivesMaterialInfo;
import com.i84.earnpoint.model.ArchivesMyInfo;
import com.i84.earnpoint.model.ArchivesOtherInfo;
import com.i84.earnpoint.model.ArchivesOutInfo;
import com.i84.earnpoint.model.ArchivesPoliticalInfo;
import com.i84.earnpoint.model.ArchivesProInfo;
import com.i84.earnpoint.model.ArchivesPtInfo;
import com.i84.earnpoint.model.ArchivesRewardInfo;

public class FileCheck {

	
	@Autowired 
	public ArchivesBaseInfoService archivesBaseInfoService;
	
     @Autowired
	 private ArchivesMaterialInfoService archivesMaterialInfoService;
     
     @Autowired
     private ArchivesMyInfoService archivesMyInfoService;
     
     @Autowired
     private ArchivesKhInfoService archivesKhInfoService;
     
     @Autowired
     private ArchivesProInfoService archivesProInfoService;
     
     @Autowired
     private ArchivesPoliticalInfoService archivesPoliticalInfoService;
     
 	@Autowired
 	private ArchivesPtInfoService archivesPtInfoService;
 	
	@Autowired
	private ArchivesRewardInfoService archivesRewardInfoService;
	
	@Autowired
	private ArchivesDisciplinedInfoService archivesDisciplinedInfoService;
	
	   @Autowired
	     private ArchivesOutInfoService archivesOutInfoService;
	   
	   @Autowired
	     private ArchivesOtherInfoService archivesOtherInfoService;
	   
	public  void test() throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		List<Map<String, Object>> list = archivesBaseInfoService.QueryCheckBaseinfoList(params);
		List<Map<String, Object>> lista = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			Map m = list.get(i);
			if("1".equals(m.get("p_state"))||"转入".equals(m.get("p_state"))){
				lista.add(m);
				
			}
		}
		getAll(lista);
	
	}
	public void getAll(List<Map<String, Object>> list) throws Exception{
		if(list.size()>0){
			for (int i = 0; i <list.size(); i++) {
				Map<String,Object> m = list.get(i);
				
				   String pno = m.get("p_no")+"";
				   
				     //履历材料
				    ArchivesMaterialInfo record=new ArchivesMaterialInfo();
			        record.setpNo(pno);
			        List<Map<String,Object>> list2= archivesMaterialInfoService.listArchivesMaterialInfos(record);
			        if(list2.size()>0){
			        	for (int j = 0; j < list2.size(); j++) {
								Map<String,Object> p = list2.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),1,"履历材料");	   
						}
			        	
			        }
			        
			      // 自传材料
			   	 ArchivesMyInfo record1=new ArchivesMyInfo();
				 record.setpNo(pno);
				 List<Map<String,Object>> list4= archivesMyInfoService.listArchivesMyInfos(record1); 
				 if(list4.size()>0){
			        	for (int j = 0; j < list4.size(); j++) {
								Map<String,Object> p = list4.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),2,"自传材料");	   
						}
			        	
			     }
				 
				 //鉴定考试材料
				 ArchivesKhInfo record2=new ArchivesKhInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list5= archivesKhInfoService.listArchivesKhInfos(record2); 
		    	 if(list5.size()>0){
			        	for (int j = 0; j < list5.size(); j++) {
								Map<String,Object> p = list5.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),3,"鉴定考试材料");	   
						}
			        	
			     }
		    	 
		    	 //学历职称材料
		    	 ArchivesProInfo record3=new ArchivesProInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list6= archivesProInfoService.listArchivesProInfos(record3); 
		    	 if(list6.size()>0){
			        	for (int j = 0; j < list6.size(); j++) {
								Map<String,Object> p = list6.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),4,"学历职称材料");	   
						}
			        	
			     }
		    	 
		    	 //政审材料
		    	 ArchivesPoliticalInfo record4=new ArchivesPoliticalInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list7= archivesPoliticalInfoService.listArchivesPoliticalInfos(record4); 
		    	 if(list7.size()>0){
			        	for (int j = 0; j < list7.size(); j++) {
								Map<String,Object> p = list7.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),5,"学历职称材料");	   
						}
			        	
			     }
		    	 
		    	 //党团材料
		    	 ArchivesPtInfo record5=new ArchivesPtInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list8= archivesPtInfoService.listArchivesPtInfos(record5); 
		    	 if(list8.size()>0){
			        	for (int j = 0; j < list8.size(); j++) {
								Map<String,Object> p = list8.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),6,"党团材料");	   
						}
			        	
			     }
		    	 
		    	//奖励材料
		    	 ArchivesRewardInfo record6=new ArchivesRewardInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list9= archivesRewardInfoService.listArchivesRewardInfos(record6); 
		    	 if(list9.size()>0){
			        	for (int j = 0; j < list9.size(); j++) {
								Map<String,Object> p = list9.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),7,"奖励材料");	   
						}
			        	
			     }
		    	 
		    	//处分材料
		    	 ArchivesDisciplinedInfo record7=new ArchivesDisciplinedInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list10= archivesDisciplinedInfoService.listArchivesDisciplinedInfos(record7);
		    	 if(list10.size()>0){
			        	for (int j = 0; j < list10.size(); j++) {
								Map<String,Object> p = list10.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),8,"处分材料");	   
						}
			        	
			     }
		    	 
		    	//工资、任免、出国、会议等材料
		    	 ArchivesOutInfo record8=new ArchivesOutInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list11= archivesOutInfoService.listArchivesOutInfos(record8); 
		    	 if(list11.size()>0){
			        	for (int j = 0; j < list11.size(); j++) {
								Map<String,Object> p = list11.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),9,"工资、任免、出国、会议等材料");	   
						}
			        	
			     }
		    	 
		    		//其他材料
		    	 ArchivesOtherInfo record9=new ArchivesOtherInfo();
		    	 record.setpNo(pno);
		    	 List<Map<String,Object>> list12= archivesOtherInfoService.listArchivesOtherInfos(record9); 
		    	 if(list12.size()>0){
			        	for (int j = 0; j < list12.size(); j++) {
								Map<String,Object> p = list12.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								llcl(pno, pageNum,TextUtil.getInt(p.get("id")),10,"其他材料");	   
						}
			        	
			     }
			}
		}
		
	}

	//材料
	public void llcl(String pno,int pageNum,int aid,int fileType,String name) throws Exception{
		 Map<String, Object> m1=	new HashMap<String, Object>();
         m1.put("aid", aid);
         m1.put("fileType", fileType);
         List<Map<String,Object>> list3=archivesMaterialInfoService.selectByClFjList(m1);
       
         if(list3.size()>0){
     	   if(list3.size()<pageNum){
             	System.out.println(name+"页数不一致，档案号:"+pno+" aid:"+aid+" 原先页数:"+pageNum+" 实际页数:"+list3.size());
             }
         	for (int k = 0; k < list3.size(); k++) {
					Map<String,Object> mf = list3.get(k);
					String fileUrl ="D:/2017年5月19日 硬盘备份/tomcat7_jtrcArchive/webapps/jtrc/"+ mf.get("file_url")+"";
					
					 File file = new File(fileUrl);
			         if(!file.exists()) {
			            System.out.println(name+"图片不存在，档案号:"+pno+" 图片ID："+mf.get("id")+" aid:"+aid);
			            
			         }
					
				}
         }
	}
}
