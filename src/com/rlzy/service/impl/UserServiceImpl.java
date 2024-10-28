package com.rlzy.service.impl;

import com.rlzy.dao.DeptDao;
import com.rlzy.dao.UserDao;
import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import com.rlzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/19 20:45
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private DeptDao deptDao;

    @Override
    public User findUser(String email) {
        User user = userDao.findUser(email);
        //通过部门id 查找部门
        if (user!=null){
            Dept dept = deptDao.findDeptById(user.getD_id());
            user.setDeptname(dept.getDname());
        }
        return user;
    }

    @Override
    public int updateUserInfo(User user) {
        int i = userDao.updateUserInfoSql(user);
        return i;
    }

    @Override
    public PageInfo<User> findAllUser(String realname, Integer pageIndex, Integer pageSize) {
        PageInfo<User> pi = new PageInfo<User>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(4);

        //获取总条数
        Integer totalCount = userDao.totalCount();

        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<User> userList =userDao.findAllUserSql(realname,(pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            for (User user : userList) {
                Dept dept = deptDao.findDeptById(user.getD_id());
                user.setDeptname(dept.getDname());
            }
            pi.setList(userList);
        }
        return pi;
    }

    @Override
    public List<User> getAll() {

        List<User> allUser = userDao.getAllUser();
        for (User user : allUser) {
            Dept dept = deptDao.findDeptById(user.getD_id());
            user.setDeptname(dept.getDname());
        }
        return allUser;
    }

    @Override
    public int addUser(User user) {
        int i = userDao.addUser(user);
        return i;
    }

    @Override
    public int updateUser(User user) {
        int i = userDao.updateUser(user);
        return i;
    }

    @Override
    public User findUserById(Integer id) {
        User userById = userDao.findUserById(id);
        Dept dept = deptDao.findDeptById(userById.getD_id());
        userById.setDeptname(dept.getDname());
        return userById;
    }

    @Override
    public int deleteUserByid(Integer id) {

        return userDao.deleteUserByid(id);
    }

    @Override
    public List<User> FindUserByDept(Integer Did) {
        return userDao.FindUserByDept(Did);
    }

    @Override
    public User getCurrentUser() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("ad");
        return user;
    }
}
