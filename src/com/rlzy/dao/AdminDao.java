package com.rlzy.dao;
import com.rlzy.po.Admin;
import org.apache.ibatis.annotations.Param;


import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface AdminDao {
	/**
	 * 通过账号和密码查询管理员
	 */
	public Admin findAdmin(String email);


    int updateAdminById(Admin admin);
}
