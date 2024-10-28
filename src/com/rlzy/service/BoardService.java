package com.rlzy.service;

import com.rlzy.po.Board;
import com.rlzy.po.PageInfo;
import com.rlzy.po.Sal;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/21 7:37
 */
public interface BoardService {
    PageInfo<Board> findAllBoard(String title, Integer pageIndex, int i);

    int adminAddBoard(Board board);

    int adminDeleteBoard(Integer id);

    Board findBoardById(Integer id);

    int updateBoard(Board board);
}
