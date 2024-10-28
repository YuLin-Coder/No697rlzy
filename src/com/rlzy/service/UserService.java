package com.rlzy.service;

import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import sun.nio.cs.US_ASCII;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/19 20:32
 */
public interface UserService {

    User findUser(String email);

    int updateUserInfo(User user);

    PageInfo<User> findAllUser(String realname, Integer pageIndex, Integer pageSize);

    List<User> getAll();

    int addUser(User user);

    int updateUser(User user);

    User findUserById(Integer id);

    int deleteUserByid(Integer id);

    List <User> FindUserByDept (Integer Did);

    User getCurrentUser();
}
