package com.rlzy.dao;
import com.rlzy.po.Leave;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 请假表 DAO层接口
 */
public interface LeaveDao {

	List<Leave> findAllLeave(@Param("reason") String reason, @Param("eno") String eno,
							 @Param("startIndex")int startIndex, @Param("pageSize")Integer pageSize);

	List<Leave> findAdminAllLeave(@Param("reason") String reason, @Param("startIndex")int startIndex, @Param("pageSize")Integer pageSize);

	void addLeave(Leave leave);

	void deleteLeave(@Param("leaveId")int leaveId);

	Leave findLeaveById(@Param("leaveId")int leaveId);

	void updateLeave(Leave leave);

	void updateLeaveStatus(@Param("leaveId")int leaveId, @Param("status")String status);

	int findAllLeaveCount(@Param("reason") String reason, @Param("eno")String eno);

	int findAdminAllLeaveCount(@Param("reason")String reason);
}
