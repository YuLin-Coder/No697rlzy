package com.rlzy.service.impl;

import com.rlzy.dao.SalDao;
import com.rlzy.po.*;
import com.rlzy.service.SalService;
import com.rlzy.util.DateTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 23:19
 */
@Service
public class SalServiceImpl implements SalService {

    @Autowired
    SalDao salDao;

    @Override
    public PageInfo<Sal> findMySal(String fxrq, String eno, Integer pageIndex, int i) {
        PageInfo<Sal> pi = new PageInfo<Sal>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(4);
        Integer totalCount=0;
        //获取总条数
        if (eno==null){
            totalCount= salDao.totalCount();
        }else{
            totalCount = salDao.totalCountMy(eno);
        }

        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Sal> salList = salDao.findMySalSql(fxrq, eno, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(salList);
        }
        return pi;
    }

    @Override
    public int addSal(Sal sal) {

        sal.setTotalsal(sal.getSal() + sal.getJx() - sal.getKcsb() - sal.getKx());
        sal.setFxrq(DateTO.getStringDateTime(new Date()));
        return salDao.addSal(sal);
    }

    @Override
    public int deleteSal(Integer id) {
        return salDao.deleteSal(id);
    }

    @Override
    public List<Sal> daoChuSal() {
        return salDao.findAllSal();
    }

    @Override
    public int UpdateUserSal(Sal sal) {
        sal.setTotalsal(sal.getSal() + sal.getJx() - sal.getKcsb() - sal.getKx());
        sal.setFxrq(DateTO.getStringDateTime(new Date()));
        return salDao.UpdateUserSal(sal);
    }


    @Override
    public Sal findSalById(Integer id) {
        return salDao.findSalById(id);
    }


}
