//package com.tgb.test;
//
//import org.junit.Test;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
//
//public class ZcTest extends TestBase{ 
//	 @Test
//	 public void queryById() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryById").param("id", "1")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 
//	 @Test
//	 public void queryPageList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryPageList")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 @Test
//	 public void queryShLeftPageList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryShLeftPageList")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 
//	 @Test
//	 public void querySHPageList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/querySHPageList").param("id", "1")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 @Test
//	 public void getUserInfoById() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/getUserInfoById").param("id", "19")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 @Test
//	 public void queryStudyList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryStudyList").param("id", "19")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 @Test
//	 public void queryWorkList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryWorkList").param("uid", "47")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 @Test
//	 public void queryCEList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryCEList").param("uid", "19")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }	 
//	 @Test
//	 public void queryPaperList() throws Exception{
//		 this.mockMvc.perform(MockMvcRequestBuilders.post("/zcps/queryPaperList").param("uid", "19")).andDo(MockMvcResultHandlers.print()).andReturn();
//	 }
//	 
//}
