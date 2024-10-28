package com.rlzy.service.impl;

import com.rlzy.dao.AttendanceDao;
import com.rlzy.po.Attendance;
import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import com.rlzy.service.AttendanceService;
import com.rlzy.util.DateTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;


/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 22:12
 */
@Service
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    AttendanceDao attendanceDao;


    @Override
    public int addAttendance(Attendance attendance) {
        attendance.setQdsj(DateTO.getStringDateTime(new Date()));
        int i = attendanceDao.addAttendanceSql(attendance);
        return i;
    }

    @Override
    public PageInfo<Attendance> findUserAttendance(Integer pageIndex, int i) {
        PageInfo<Attendance> pi = new PageInfo<Attendance>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(4);

        //获取总条数
        Integer totalCount=attendanceDao.totalCount();

        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Attendance> userList = attendanceDao.findAllUserSql((pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(userList);
        }
        return pi;
    }

    @Override
    public int updateUserAttendance(Attendance attendance) {

        return attendanceDao.updateUserAttendance(attendance);
    }

    @Override
    public int deleteAttendanceById(Integer id) {
        return attendanceDao.deleteAttendanceById(id);
    }

    @Override
    public Attendance findAttendanceById(Integer id) {

        return attendanceDao.findAttendanceById(id);
    }

    @Override
    public List<Attendance> findAllAttendance() {
        return attendanceDao.findAllAttendance();
    }


    @Override
    public PageInfo<Attendance> FindMyAttendance(String eno){

        PageInfo<Attendance> pi = new PageInfo<Attendance>();
        pi.setPageIndex(1);
        pi.setPageSize(7);

        //获取总条数
        Integer totalCount=attendanceDao.totalCountMy();

            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Attendance> userList = attendanceDao.FindMyAttendance(eno);
            pi.setList(userList);

        return pi;
    }
}