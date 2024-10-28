package com.rlzy.controller;

import com.rlzy.po.PageInfo;
import com.rlzy.po.Leave;
import com.rlzy.po.User;
import com.rlzy.service.LeaveService;
import com.rlzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

/**
 * 请假控制器类
 */
@Controller
public class LeaveController {

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private UserService userService;

    /**
     *员工查询自己的请假记录
     * @param model
     * @param pageIndex
     * @param reason
     * @return
     */
    @RequestMapping(value = "/findLeave")
    public String findLeave(Model model, @RequestParam(defaultValue = "1") Integer  pageIndex,
                              @RequestParam(defaultValue = "4") Integer  pageSize, String reason){
        PageInfo<Leave> pi = leaveService.findAllLeave(pageIndex,pageSize,reason);
        model.addAttribute("pi",pi);
        return "leave_list";
    }

    /**
     * @FunctionName: 管理员查找所有
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/adminFindLeave")
    public String adminFindLeave(Model model, @RequestParam(defaultValue = "1") Integer  pageIndex,
                                 @RequestParam(defaultValue = "4") Integer  pageSize,String reason){
        PageInfo<Leave> pi = leaveService.findAdminAllLeave(pageIndex,pageSize,reason);
        model.addAttribute("pi",pi);
        return "admin_leave_list";
    }

    /**
     * 增加 请假
     * @param leave
     * @return
     */
    @RequestMapping(value = "/addLeave")
    public String addLeave(@RequestBody Leave leave){
        leave.setEno(userService.getCurrentUser().getEno());
        leave.setCreateTime(new Date());
        leave.setStatus("0");
        leaveService.addLeave(leave);
        return "redirect:/findLeave";
    }

    /**
     * 删除  请假
     * @param leaveId
     * @return
     */
    @RequestMapping(value = "/deleteLeave")
    public String deleteLeave(@RequestParam("leaveId") Integer leaveId){
        leaveService.deleteLeave(leaveId);
        return "redirect:/findLeave";
    }

    /**
     * 前往  修改页面
     * @param leaveId
     * @param model
     * @return
     */
    @RequestMapping(value = "/toUpdateLeave")
    public String toUpdateLeave(@RequestParam("leaveId") Integer  leaveId,Model model){
        Leave leave = leaveService.findLeaveById(leaveId);
        model.addAttribute("leave",leave);
        return "update_leave";
    }


    /**
     * 更新请假信息
     * @param leave
     * @return
     */
    @RequestMapping(value = "/updateLeave")
    public String updateLeave(@RequestBody Leave leave){
        leaveService.updateLeave(leave);
        return "redirect:/findLeave";
    }


    /**
     * 批准、拒绝 请假信息
     * @param leaveId
     * @param status
     * @return
     */
    @RequestMapping(value = "/updateLeaveStatus")
    public String updateLeaveStatus(@RequestParam("leaveId") Integer  leaveId,
                                    @RequestParam("status") String  status){
        leaveService.updateLeaveStatus(leaveId,status);
        return "redirect:/adminFindLeave";
    }
}
