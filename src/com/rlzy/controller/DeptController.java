package com.rlzy.controller;

import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 14:50
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    /** 
    * @FunctionName: 查找所有部门
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/findDept")
    public String findAllDept(Model model, @RequestParam(defaultValue = "1") Integer  pageIndex,String dname){
        PageInfo<Dept> pi = deptService.findAllDeptSql(pageIndex,4,dname);
        model.addAttribute("pi",pi);
        return "dept_list";
    }

    /**
     * @FunctionName: 管理员查找所有部门
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/adminFindDept")
    public String adminFindDept(Model model, @RequestParam(defaultValue = "1") Integer  pageIndex,String dname){
        PageInfo<Dept> pi = deptService.findAllDeptSql(pageIndex,4,dname);
        model.addAttribute("pi",pi);
        return "admin_dept_list";
    }

    /**
    * @FunctionName: 新增部门
    * @author: Ywj
    * @Param:
    * @Return:
    */
    @RequestMapping(value = "/addDept")
    public String addDept(@RequestBody Dept dept){
        int i = deptService.addDept(dept);
        return "redirect:/adminFindDept";
    }

    /**
    * @FunctionName: 删除部门
    * @author: Ywj
    * @Param:
    * @Return:
    */
    @RequestMapping(value = "/deleteDept")
    public String deleteDept(@RequestParam("dept_id") Integer dept_id){
        int i = deptService.deleteDept(dept_id);
        return "redirect:/adminFindDept";
    }

    /** 
    * @FunctionName: 导出部门查询
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/daoChuDept")
    @ResponseBody
    public List<Dept> daoChuDept(){
        List<Dept> list = deptService.findAllDept();
        return list;
    }

    /**
     * @FunctionName: 跳到更新页
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/toUpdateDeptView")
    public String toUpdateDeptView(@RequestParam("id") Integer  id,Model model){
        Dept dept = deptService.findDeptById(id);
        model.addAttribute("dept",dept);
        return "update_dept";
    }


    /**
     * @FunctionName: 更新部门
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/toUpdateDept")
    public String toUpdateDept(@RequestBody Dept dept){
        int i = deptService.updateDept(dept);
        return "redirect:/adminFindDept";
    }


}
