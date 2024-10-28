package com.rlzy.dao;

import com.rlzy.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/19 20:56
 */
public interface UserDao {
    User findUser(String email);

    int updateUserInfoSql(User user);

    Integer totalCount();

    List<User> findAllUserSql(@Param("realname") String realname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    List<User> getAllUser();

    int addUser(User user);

    int updateUser(User user);

    User findUserById(Integer id);

    int deleteUserByid(Integer id);
    /**
     * 部门查询该部门所有人
     */
    List <User> FindUserByDept (Integer Did);
}
