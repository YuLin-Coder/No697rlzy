package com.rlzy.controller;

import com.github.pagehelper.ISelect;
import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import com.rlzy.service.DeptService;
import com.rlzy.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.SortedMap;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 15:02
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private DeptService deptService;

    //用户更新个人信息
    @RequestMapping(value = "/updateUserInfo")
    public String updateUserInfo(@RequestBody User user, HttpSession session
                                /* @Param("id")Integer id,
                                 @Param("eno")Integer eno,
                                 @Param("realname")String realname,
                                 @Param("pwd")String pwd,
                                 @Param("sex")String sex,
                                 @Param("birthday")String birthday,
                                 @Param("hiredate")String hiredate,
                                 @Param("email")String email,
                                 @Param("address")String address,
                                 @Param("jg")String jg,
                                 @Param("phone")String phone,
                                 @Param("d_id")Integer d_id,
                                 @Param("gwzz")String gwzz*/){
        int i = userService.updateUserInfo(user);
        if (i>0){
            session.setAttribute("ad", user);
        }
        return "homepage";
    }

    //查找全部用户
    @RequestMapping(value = "/findUser")
    public String findUser(Model model,String realname,String eno,@RequestParam(defaultValue = "1") Integer  pageIndex){
        PageInfo<User> pi = userService.findAllUser(realname,pageIndex,4);
        model.addAttribute("pi",pi);
        return "user_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value ="/exportUserList", method = RequestMethod.POST)
    @ResponseBody
    public List<User> exportUserList(){
        List<User> userList = userService.getAll();
        return userList;
    }

    @RequestMapping(value ="/addUserView")
    public String addUserView(HttpServletRequest request){
        //查询部门
        List<Dept> list = deptService.getAllDept();
        request.setAttribute("list",list);
        return "add_user";
    }
    /**
     *  新增用户
     */
    @RequestMapping(value ="/addUser", method = RequestMethod.POST)
    public String addUser(@RequestBody User user){

        int i = userService.addUser(user);
        return "redirect:/findUser";
    }

    /**
     *  跳转到修改用户页
     */
    /**
     *  修改用户
     */
    @RequestMapping(value ="/toUpdateUserView")
    public String updateUser(@RequestParam("id") Integer id,HttpServletRequest request){
        User user = userService.findUserById(id);
        request.setAttribute("user",user);
        return "update_user";
    }

    /**
     *  修改用户
     */
    @RequestMapping(value ="/updateUser", method = RequestMethod.POST)
    public String updateUser(@RequestBody User user){
        int i = userService.updateUser(user);
        return "redirect:/findUser";
    }
    
    /** 
    * 删除用户
    */
    @RequestMapping(value = "/deleteUserByid")
    public String deleteUserByid(@RequestParam("id") Integer id){
        int i = userService.deleteUserByid(id);
        return "redirect:/findUser";
    }

    /*
    * 查询部门下所有员工
    * */
    @RequestMapping(value="/FindUserByDept")
    public String  FindUserByDept ( Model model,@RequestParam("Did") Integer id){
        List<User> userlist= userService.FindUserByDept(id);
        model.addAttribute("userdept",userlist);
        return "user_dept_list";

    }

}
