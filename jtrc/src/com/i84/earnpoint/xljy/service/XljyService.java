package com.i84.earnpoint.xljy.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.AcademicEducation;
import com.i84.earnpoint.model.StudentAchievement;
import com.i84.earnpoint.model.StudentSignup;
import com.i84.earnpoint.model.YgImportVo;

public interface XljyService {
    /**记录是否存在
     * @param record
     * @return
     */
    StudentSignup selectisExist(StudentSignup record);
	StudentAchievement selectisExist(StudentAchievement record);
    /**学员新增*/
	 void insertXyList(List<StudentSignup> ygList)throws Exception;
	 int updateXy(Map<String,Object>obj)throws Exception;

	 /**成绩新增*/
	 void insertCjList(List<StudentAchievement> ygList,String uid)throws Exception;
	 /**开设班级新增
	 * @param map
	 * @return
	 * @throws Exception
	 */
	 int addKsbj(Map<String,Object> map) throws Exception;
	 int editKsbj(Map<String,Object> map) throws Exception;

	 
	 List<AcademicEducation>  selectAcademicList(Map<String,Object>m); 
	 List<AcademicEducation>  selectAcademicList1(Map<String,Object>m); 
	 int updateAcademicEducation(AcademicEducation record)throws Exception;
	 /**学员报名列表
	 * @param m
	 * @return
	 */
	List<Map<String,Object>> selectStudentList(Map<String,Object> m);
	 
	int updateStudentSignup(StudentSignup record)throws Exception;
	void updateStudentSignup(String ids)throws Exception;
	
	int updateStudentAchievement(StudentAchievement record)throws Exception;

	 
	 Map<String,Object> selectStudentbyId(Map<String,Object> m);

		/**导出
		 * @param response
		 * @param request
		 */
		void xyExport(HttpServletResponse response,HttpServletRequest request)throws Exception;
		 AcademicEducation selectAcademicEducationById(Integer id);
		 
		 
	/**报考层次统计
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> selectListByBkcc(Map<String, Object> params);
	
	/**报考层次统计
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> selectListByBkzrs(Map<String, Object> params);
	
	/**报考录入人统计
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> selectListByBklrr(Map<String, Object> params);

}
