package com.rlzy.dao;

import com.rlzy.po.Dept;
import com.rlzy.po.Sal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 23:20
 */
public interface SalDao {

    Integer totalCount();

    Integer totalCountMy(String eno);

    List<Sal> findMySalSql(@Param("fxrq") String fxrq,@Param("eno") String eno,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    int addSal(Sal sal);

    int deleteSal(Integer id);

    int UpdateUserSal(Sal sal);

    List<Sal> findAllSal();

    Sal findSalById(Integer id);
}
