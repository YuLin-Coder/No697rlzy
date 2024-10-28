package com.rlzy.dao;

import com.rlzy.po.Board;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/21 7:38
 */
public interface BoardDao {

    Integer totalCount();

    List<Board> findAllBoardSql(@Param("title") String title, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    int adminAddBoard(Board board);

    int adminDeleteBoard(Integer id);

    Board findBoardById(Integer id);

    int updateBoard(Board board);
}
