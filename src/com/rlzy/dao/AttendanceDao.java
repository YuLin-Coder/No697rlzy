package com.rlzy.dao;

import com.rlzy.po.Attendance;
import com.rlzy.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 22:13
 */
public interface AttendanceDao {


    int addAttendanceSql(Attendance attendance);

    Integer totalCount();

    Integer totalCountMy();

    List<Attendance> findAllUserSql(@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    int updateUserAttendance(Attendance attendance);

    int deleteAttendanceById(Integer id);

    Attendance findAttendanceById(Integer id);

    List<Attendance> findAllAttendance();

    //查询自己打卡记录
    List <Attendance>FindMyAttendance(String eno);

}
