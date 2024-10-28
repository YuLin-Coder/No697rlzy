package com.rlzy.controller;


import com.rlzy.po.Admin;
import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import com.rlzy.service.AdminService;
import com.rlzy.service.UserService;
import com.rlzy.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户控制器类
 */
@Controller
public class AdminController {
	// 依赖注入
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	/** 
	* @FunctionName: 跳转到主页
	* @author: Ywj
	* @Param: 
	* @Return: 
	*/
	@RequestMapping(value = "/toHomePageView")
	public String toHomePageView(){
		return "homepage";
	}
	
	/**
	 * 将提交数据(username,password)写入Admin对象
	 */
	@RequestMapping("/login")
	public String login(@RequestParam("email") String email,
						@RequestParam("pwd") String pwd,
						@RequestParam("type") String type,
						Model model,
						HttpSession session) {
		// 通过邮箱和密码查询用户
		if(type.equals("1")){   //员工登录
			User us = userService.findUser(email);
			if (us == null){
				model.addAttribute("msg", "用户不存在！");
				return "login";
			}else if (!us.getPwd().equals(pwd)){
				model.addAttribute("msg", "密码错误！");
				return "login";
			}else{
				session.setAttribute("type","1");
				session.setAttribute("ad", us);
				return "homepage";
			}
		}else if (type.equals("2")){
			Admin ad = adminService.findAdmin(email);
			if (ad == null){
				model.addAttribute("msg", "用户不存在！");
				return "login";
			}else if (!ad.getPwd().equals(pwd)){
				model.addAttribute("msg", "密码错误！");
				return "login";
			}else{
				session.setAttribute("type","2");
				session.setAttribute("ad", ad);
				return "homepage";
			}
		}
		return "login";
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/loginOut")
	public String loginOut(Admin admin, Model model, HttpSession session) {
		session.invalidate();
		return "login";
	}


	/**
	 * 修改管理员信息
	 */
	@RequestMapping(value = "/updateAdminById")
	public String updateAdminById(@RequestBody Admin admin,HttpSession session){
		int i = adminService.updateAdminById(admin);
		if (i>0){
			session.setAttribute("ad", admin);
		}
		return "homepage";
	}

}
