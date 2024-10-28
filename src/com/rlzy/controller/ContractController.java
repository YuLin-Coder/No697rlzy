package com.rlzy.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.json.JSONObject;
import com.rlzy.po.Contract;
import com.rlzy.po.PageInfo;
import com.rlzy.po.User;
import com.rlzy.service.ContractService;
import com.rlzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * 请假控制器类
 */
@Controller
public class ContractController {

    @Autowired
    private ContractService contractService;

    @Autowired
    private UserService userService;

    /**
     *员工查询自己的请假记录
     * @param model
     * @param pageIndex
     * @param note
     * @return
     */
    @RequestMapping(value = "/findContract")
    public String findContract(Model model, @RequestParam(defaultValue = "1") Integer  pageIndex,
                            @RequestParam(defaultValue = "4") Integer  pageSize, String note){
        PageInfo<Contract> pi = contractService.findAllContract(pageIndex,pageSize,note);
        model.addAttribute("pi",pi);
        return "contract_list";
    }

    /**
     * @FunctionName: 管理员查找所有
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/adminFindContract")
    public String adminFindContract(Model model, @RequestParam(defaultValue = "1") Integer  pageIndex,
                                 @RequestParam(defaultValue = "4") Integer  pageSize,String note){
        PageInfo<Contract> pi = contractService.findAdminAllContract(pageIndex,pageSize,note);
        List<User> userList = userService.getAll();
        model.addAttribute("pi",pi);
        model.addAttribute("userList",userList);
        return "admin_contract_list";
    }

    /**
     * 增加
     * @param contract
     * @return
     */
    @RequestMapping(value = "/addContract")
    public String addContract(@RequestBody Contract contract){
        contract.setCreateTime(new Date());
        contractService.addContract(contract);
        return "redirect:/adminFindContract";
    }

    /**
     * 增加合同页面
     * @return
     */
    @RequestMapping(value = "/toAddContract")
    public String toAddContract(Model model){
        List<User> userList = userService.getAll();
        model.addAttribute("userList",userList);
        return "add_contract";
    }

    /**
     * 删除
     * @param contractId
     * @return
     */
    @RequestMapping(value = "/deleteContract")
    public String deleteContract(@RequestParam("contractId") Integer contractId){
        contractService.deleteContract(contractId);
        return "redirect:/adminFindContract";
    }

    /**
     * 前往  修改页面
     * @param contractId
     * @param model
     * @return
     */
    @RequestMapping(value = "/toUpdateContract")
    public String toUpdateContract(@RequestParam("contractId") Integer  contractId,Model model){
        Contract contract = contractService.findContractById(contractId);
        model.addAttribute("contract",contract);
        return "update_contract";
    }


    /**
     * 更新信息
     * @param contract
     * @return
     */
    @RequestMapping(value = "/updateContract")
    public String updateContract(@RequestBody Contract contract){
        contractService.updateContract(contract);
        return "redirect:/adminFindContract";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public JSONObject uploadFile(MultipartFile file, HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        try {
            //获取上传的文件名称
            String filename = file.getOriginalFilename();
            String realPath = "D:\\data\\file";

            //判断文件夹是否存在，不存在则创建
            File f = new File(realPath);
            if(!f.exists()){
                f.mkdirs();
            }
            //得到最终的文件保存路径
            String filePath = realPath + "\\" + filename;
            //上传文件
            file.transferTo(new File(filePath));
            jsonObject.set("code",200);
            jsonObject.set("name",filename);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }


    /**
     * 下载附件
     */

    @RequestMapping("/download")
    public void download(@RequestParam("name") String name,
                         HttpServletResponse response) throws IOException {

        if (!FileUtil.exist("D:\\data\\file" + "\\" + name)) {
            throw new RuntimeException("文件不存在");
        }
        // 创建输出流对象
        ServletOutputStream outputStream = response.getOutputStream();

        //以字节数组的形式读取文件
        byte[] bytes = FileUtil.readBytes("D:\\data\\file" + "\\" + name);

        // 设置返回内容格式
        response.setContentType("application/octet-stream");

        // 设置下载弹窗的文件名和格式（文件名要包括名字和文件格式）
        String filename = URLEncoder.encode(name, "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename);


        // 返回数据到输出流对象中
        outputStream.write(bytes);

        // 关闭流对象
        IoUtil.close(outputStream);

    }
}
