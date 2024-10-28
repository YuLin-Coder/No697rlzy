package com.rlzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.rlzy.dao.LeaveDao;
import com.rlzy.po.Leave;
import com.rlzy.po.PageInfo;
import com.rlzy.service.LeaveService;
import com.rlzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {

    @Autowired
    private LeaveDao leaveDao;

    @Autowired
    private UserService userService;

    /**
     * 员工查询自己的请假记录
     * @param pageIndex
     * @param pageSize
     * @param reason
     * @return
     */
    @Override
    public PageInfo<Leave> findAllLeave(Integer pageIndex, Integer pageSize, String reason) {

        int count = leaveDao.findAllLeaveCount(reason,userService.getCurrentUser().getEno());
        PageHelper.startPage(pageIndex, pageSize);
        List<Leave> leaveList = leaveDao.findAllLeave(reason,userService.getCurrentUser().getEno(),(pageIndex - 1) * pageSize,pageSize);

        PageInfo<Leave> pi = new PageInfo<Leave>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        pi.setTotalCount(count);
        pi.setList(leaveList);
        return pi;
    }

    /**
     * 管理员查询所有的请假记录
     * @param pageIndex
     * @param pageSize
     * @param reason
     * @return
     */
    @Override
    public PageInfo<Leave> findAdminAllLeave(Integer pageIndex, Integer pageSize, String reason) {
        int count = leaveDao.findAdminAllLeaveCount(reason);
        PageHelper.startPage(pageIndex, pageSize);
        List<Leave> leaveList = leaveDao.findAdminAllLeave(reason,(pageIndex - 1) * pageSize,pageSize);

        PageInfo<Leave> pi = new PageInfo<Leave>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        pi.setTotalCount(count);
        pi.setList(leaveList);
        return pi;
    }

    /**
     * 增加 请假
     * @param leave
     * @return
     */
    @Override
    public void addLeave(Leave leave) {
         leaveDao.addLeave(leave);
    }

    /**
     * 删除  请假
     * @param leaveId
     * @return
     */
    @Override
    public void deleteLeave(int leaveId) {
         leaveDao.deleteLeave(leaveId);
    }

    /**
     * 查看 请假的详细信息
     * @param leaveId
     * @return
     */
    @Override
    public Leave findLeaveById(int leaveId) {
        return leaveDao.findLeaveById(leaveId);
    }

    /**
     * 更新请假信息
     * @param leave
     * @return
     */
    @Override
    public void updateLeave(Leave leave) {
        leaveDao.updateLeave(leave);
    }

    /**
     * 批准、拒绝 请假信息
     * @param leaveId
     * @param status
     * @return
     */
    @Override
    public void updateLeaveStatus(int leaveId, String status) {
         leaveDao.updateLeaveStatus(leaveId,status);
    }
}
