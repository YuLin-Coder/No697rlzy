package com.rlzy.service.impl;

import com.rlzy.dao.BoardDao;
import com.rlzy.po.Board;
import com.rlzy.po.Dept;
import com.rlzy.po.PageInfo;
import com.rlzy.po.Sal;
import com.rlzy.service.BoardService;
import com.rlzy.util.DateTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/21 7:37
 */
@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardDao boardDao;

    @Override
    public PageInfo<Board> findAllBoard(String title, Integer pageIndex, int i) {

        PageInfo<Board> pi = new PageInfo<Board>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(4);

        //获取总条数
        Integer totalCount = boardDao.totalCount();

        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Board> boardList =	boardDao.findAllBoardSql(title,(pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(boardList);
        }
        return pi;
    }

    @Override
    public int adminAddBoard(Board board) {
        board.setFbsj(DateTO.getStringDateTime(new Date()));
        return boardDao.adminAddBoard(board);
    }

    @Override
    public int adminDeleteBoard(Integer id) {
        return boardDao.adminDeleteBoard(id);
    }

    @Override
    public Board findBoardById(Integer id) {
        return boardDao.findBoardById(id);
    }

    @Override
    public int updateBoard(Board board) {
        return boardDao.updateBoard(board);
    }
}
