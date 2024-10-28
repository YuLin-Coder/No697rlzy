package com.rlzy.controller;

import com.rlzy.po.*;
import com.rlzy.service.SalService;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 23:17
 */
@Controller
public class SalController {

    @Autowired
    private SalService salService;


    //员工查询个人薪资
    @RequestMapping(value = "/getMySal")
    public String getMySal(Model model, String fxrq, String eno, @RequestParam(defaultValue = "1") Integer pageIndex, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("ad");
        String type = (String)session.getAttribute("type");

        if (type.equals("1")){
            eno = user.getEno();
        }else {
            eno = "";
        }

        PageInfo<Sal> pi = salService.findMySal(fxrq, eno, pageIndex, 4);
        model.addAttribute("pi", pi);

        return "sal_list";
    }


    //管理员查询全部新增记录
    @RequestMapping(value = "/getAllSal")
    public String getAllSal(Model model, String fxrq, String eno, @RequestParam(defaultValue = "1") Integer pageIndex) {
        PageInfo<Sal> pi = salService.findMySal(fxrq, eno, pageIndex, 4);
        model.addAttribute("pi", pi);
        return "admin_sal_list";
    }

    //管理员新增薪资
    @RequestMapping(value = "/addSal")
    public String addSal(@RequestBody Sal sal) {

        int i = salService.addSal(sal);


        return "redirect:/getAllSal";
    }

    //跳到修改员工薪水修改页面
    @RequestMapping(value = "/toUpdateUserSal")
    public String toUpdateUserSal(@RequestParam("id") Integer id, Model model) {
        Sal sal = salService.findSalById(id);
        model.addAttribute("sal", sal);
        return "update_sal";
    }

    //修改员工工资
    @RequestMapping(value = "/UpdateUserSal")
    public String UpdateUserSal(@RequestBody Sal sal) {
        int i = salService.UpdateUserSal(sal);
        return "redirect:/getAllSal";
    }


    //删除员工薪资记录
    @RequestMapping(value = "/deleteSal")
    public String deleteSal(@RequestParam("id") Integer id) {
        int i = salService.deleteSal(id);
        return "redirect:/getAllSal";
    }

    //导出员工薪资
    @RequestMapping(value = "/daoChuSal")
    @ResponseBody
    public List<Sal> daoChuSal() {
        List<Sal> salList = salService.daoChuSal();
        return salList;
    }

}
