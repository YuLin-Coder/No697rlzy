package com.rlzy.service;
import com.rlzy.po.Admin;
import com.rlzy.po.PageInfo;


import java.util.List;

/**
 * 用户Service层接口
 */
public interface AdminService {
	// 通过账号和密码查询用户
	public Admin findAdmin(String email);

    int updateAdminById(Admin admin);

	Admin getCurrentAdmin();
}
