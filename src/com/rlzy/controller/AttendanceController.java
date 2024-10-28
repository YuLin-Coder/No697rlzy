package com.rlzy.controller;

import com.rlzy.po.Attendance;
import com.rlzy.po.PageInfo;
import com.rlzy.po.Sal;
import com.rlzy.po.User;
import com.rlzy.service.AttendanceService;
import javafx.animation.KeyValue;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 22:06
 */
@Controller
public class AttendanceController  {

    @Autowired
    private AttendanceService attendanceService;


    /**
     * 添加考勤记录
     */
    @RequestMapping(value = "/addAttendance")
    public String addAttendance(@RequestBody Attendance attendance){
        int i = attendanceService.addAttendance(attendance);
        return "homepage";
    }

    /**
     * 查询员工考勤
     */
    @RequestMapping(value = "/findUserAttendance")
    public String findUserAttendance(Model model,@RequestParam(defaultValue = "1") Integer  pageIndex){
        PageInfo<Attendance> attendancePageInfo = attendanceService.findUserAttendance(pageIndex,4);
        model.addAttribute("pi",attendancePageInfo);
        return "attendance_list";
    }

    //查询个人打卡记录
    @RequestMapping(value = "/FindMyAttendance")
    public String FindMyAttendance(Model model,
                                   HttpSession session) {
        User user = (User) session.getAttribute("ad");
        String eno=user.getEno();
        PageInfo<Attendance> attendancePageInfo = attendanceService.FindMyAttendance(eno);
        model.addAttribute("pi", attendancePageInfo);
        return "myAttendance";
    }



    /**
     * 跳转到修改考勤页
     */
    @RequestMapping(value = "/toupdateAttendanceView")
    public String toupdateAttendanceView(Model model,@RequestParam("id") Integer id){

        Attendance attendance = attendanceService.findAttendanceById(id);
        model.addAttribute("attendance",attendance);
        return "update_attendance";
    }

    /**
    * 修改员工考勤
    */
    @RequestMapping(value = "/updateUserAttendance")
    public String updateUserAttendance(@RequestBody Attendance attendance){

        int i = attendanceService.updateUserAttendance(attendance);

        return "redirect:/findUserAttendance";
    }

    /**
     * 删除员工考勤
     */
    @RequestMapping(value = "/deleteAttendanceById")
    public String deleteAttendanceById(@RequestParam("id") Integer id){
        int i = attendanceService.deleteAttendanceById(id);
        return "redirect:/findUserAttendance";
    }

    /** 
    * @FunctionName: 导出考勤信息
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/daoChuAttendance")
    @ResponseBody
    public List<Attendance> daoChuAttendance(){
        List<Attendance> list = attendanceService.findAllAttendance();
        for (Attendance attendance : list) {
            if (attendance.getStatus()==0){
                attendance.setStatus_str("未签到");
            }else {
                attendance.setStatus_str("已签到");
            }
            attendance.setStatus(null);
        }

        return list;
    }
}
