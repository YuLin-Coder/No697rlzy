package com.rlzy.service;

import com.rlzy.po.Attendance;
import com.rlzy.po.PageInfo;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 22:12
 */
public interface AttendanceService {
    int addAttendance(Attendance attendance);

    PageInfo<Attendance> findUserAttendance(Integer pageIndex, int i);

    int updateUserAttendance(Attendance attendance);

    int deleteAttendanceById(Integer id);

    Attendance findAttendanceById(Integer id);

    List<Attendance> findAllAttendance();

    PageInfo<Attendance> FindMyAttendance(String eno);
}
