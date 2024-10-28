package com.rlzy.service;

import com.rlzy.po.Leave;
import com.rlzy.po.PageInfo;

public interface LeaveService {
    /**
     * 员工查询自己的请假记录
     * @param pageIndex
     * @param pageSize
     * @param reason
     * @return
     */
    PageInfo<Leave> findAllLeave(Integer pageIndex, Integer pageSize, String reason);

    /**
     * 管理员查询所有的请假记录
     * @param pageIndex
     * @param pageSize
     * @param reason
     * @return
     */
    PageInfo<Leave> findAdminAllLeave(Integer pageIndex, Integer pageSize, String reason);

    /**
     * 增加 请假
     * @param leave
     * @return
     */
    void addLeave(Leave leave);


    /**
     * 删除  请假
     * @param leaveId
     * @return
     */
    void deleteLeave(int leaveId);

    /**
     * 查看 请假的详细信息
     * @param leaveId
     * @return
     */
    Leave findLeaveById(int leaveId);

    /**
     * 更新请假信息
     * @param leave
     * @return
     */
    void updateLeave(Leave leave);

    /**
     * 批准、拒绝 请假信息
     * @param leaveId
     * @param status
     * @return
     */
    void updateLeaveStatus(int leaveId, String status);
}
