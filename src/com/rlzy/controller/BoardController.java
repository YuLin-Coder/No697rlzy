package com.rlzy.controller;

import com.rlzy.po.Board;
import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.po.Sal;
import com.rlzy.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/21 7:36
 */
@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    /** 
    * @FunctionName: 普通员工公告列表
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/findAllBoard")
    public String findAllBoard(Model model, String title,@RequestParam(defaultValue = "1") Integer  pageIndex){
        PageInfo<Board> pi = boardService.findAllBoard(title,pageIndex,4);
        model.addAttribute("pi",pi);
        return "board_list";
    }
    
    /** 
    * @FunctionName: 管理员公告列表
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/adminFindAllBoard")
    public String adminFindAllBoard(Model model, String title,@RequestParam(defaultValue = "1") Integer  pageIndex){
        PageInfo<Board> pi = boardService.findAllBoard(title,pageIndex,4);
        model.addAttribute("pi",pi);
        return "admin_board_list";
    }
    
    /** 
    * @FunctionName: 新增公告
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/adminAddBoard")
    public String adminAddBoard(@RequestBody Board board){
        int i  = boardService.adminAddBoard(board);
        return "redirect:/adminFindAllBoard";
    }
    
    /** 
    * @FunctionName: 删除公告
    * @author: Ywj
    * @Param: 
    * @Return: 
    */
    @RequestMapping(value = "/adminDeleteBoard")
    public String adminDeleteBoard(@RequestParam("id") Integer id){
        int i = boardService.adminDeleteBoard(id);
        return "redirect:/adminFindAllBoard";
    }


    /**
     * @FunctionName: 跳到更新页
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/toUpdateBoardView")
    public String toUpdateDeptView(@RequestParam("id") Integer  id,Model model){
        Board board = boardService.findBoardById(id);
        model.addAttribute("board",board);
        return "update_board";
    }


    /**
     * @FunctionName: 更新公告
     * @author: Ywj
     * @Param:
     * @Return:
     */
    @RequestMapping(value = "/toUpdateBoard")
    public String toUpdateBoard(@RequestBody Board board){
        int i = boardService.updateBoard(board);
        return "redirect:/adminFindAllBoard";
    }


}
