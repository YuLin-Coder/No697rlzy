package com.rlzy.service;

import com.rlzy.po.Attendance;
import com.rlzy.po.PageInfo;
import com.rlzy.po.Sal;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 23:19
 */
public interface SalService {

    PageInfo<Sal> findMySal(String fxrq,String eno,Integer pageIndex, int i);

    int addSal(Sal sal);

    int deleteSal(Integer id);

    List<Sal> daoChuSal();

    int UpdateUserSal(Sal sal);

    Sal findSalById(Integer id);


}
