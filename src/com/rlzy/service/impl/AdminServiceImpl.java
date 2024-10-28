package com.rlzy.service.impl;

import com.rlzy.dao.AdminDao;
import com.rlzy.po.Admin;
import com.rlzy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用户Service接口实现类
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	// 注入UserDao
	@Autowired
	private AdminDao adminDao;

	//管理登陆查询
	@Override
	public Admin findAdmin(String email) {
		Admin a = adminDao.findAdmin(email);
		return a;
	}


	@Override
	public int updateAdminById(Admin admin) {
		return adminDao.updateAdminById(admin);
	}

	@Override
	public Admin getCurrentAdmin() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("ad");
		return admin;
	}


}
