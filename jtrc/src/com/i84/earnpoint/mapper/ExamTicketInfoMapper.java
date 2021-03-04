package com.i84.earnpoint.mapper;

import org.apache.ibatis.annotations.Param;

import com.i84.earnpoint.model.ExamTicketInfo;

public interface ExamTicketInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_ticket_info
     *
     * @mbggenerated Tue Sep 27 22:45:06 CST 2016
     */
    int deleteByPrimaryKey(Integer ticketId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_ticket_info
     *
     * @mbggenerated Tue Sep 27 22:45:06 CST 2016
     */
    int insert(ExamTicketInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_ticket_info
     *
     * @mbggenerated Tue Sep 27 22:45:06 CST 2016
     */
    int insertSelective(ExamTicketInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_ticket_info
     *
     * @mbggenerated Tue Sep 27 22:45:06 CST 2016
     */
    ExamTicketInfo selectByPrimaryKey(Integer ticketId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_ticket_info
     *
     * @mbggenerated Tue Sep 27 22:45:06 CST 2016
     */
    int updateByPrimaryKeySelective(ExamTicketInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_ticket_info
     *
     * @mbggenerated Tue Sep 27 22:45:06 CST 2016
     */
    int updateByPrimaryKey(ExamTicketInfo record);
    
    ExamTicketInfo getExamTicketInfo(@Param("classNum") String classNum, @Param("cardId") String cardId);
}