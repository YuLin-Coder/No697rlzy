package com.rlzy.dao;

import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 14:57
 */
public interface DeptDao {
    List<Dept> findAllDeptSql(@Param("dname") String dname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    Integer totalCount();

    Dept findDeptById(Integer d_id);

    List<Dept> findAllDept();

    int addDept(Dept dept);

    int deleteDept(Integer dept_id);

    int updateDept(Dept dept);


}
