package com.rlzy.service.impl;

import com.rlzy.dao.DeptDao;
import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 14:52
 */
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptDao deptDao;

    @Override
    public PageInfo<Dept> findAllDeptSql(Integer pageIndex,Integer pageSize,String dname) {

        PageInfo<Dept> pi = new PageInfo<Dept>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(4);

        //获取总条数
        Integer totalCount = deptDao.totalCount();

        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Dept> deptList =	deptDao.findAllDeptSql(dname,(pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(deptList);
        }
        return pi;
    }

    @Override
    public List<Dept> getAllDept() {
        List<Dept> deptList =	deptDao.findAllDept();
        return deptList;
    }

    @Override
    public int addDept(Dept dept) {
        return deptDao.addDept(dept);
    }

    @Override
    public int deleteDept(Integer dept_id) {
        return deptDao.deleteDept(dept_id);
    }

    @Override
    public List<Dept> findAllDept() {
        return deptDao.findAllDept();
    }

    @Override
    public Dept findDeptById(Integer id) {
        return deptDao.findDeptById(id);
    }

    @Override
    public int updateDept(Dept dept) {
        return deptDao.updateDept(dept);
    }
}
