package com.rlzy.service;

import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 14:51
 */
public interface DeptService {

    PageInfo<Dept> findAllDeptSql(Integer pageIndex,Integer pageSize,String dname);

    List<Dept> getAllDept();

    int addDept(Dept dept);

    int deleteDept(Integer dept_id);

    List<Dept> findAllDept();

    Dept findDeptById(Integer id);

    int updateDept(Dept dept);
}
