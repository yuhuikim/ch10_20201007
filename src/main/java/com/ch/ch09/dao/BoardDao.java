package com.ch.ch09.dao;

import java.util.List;
import com.ch.ch09.model.Board;

public interface BoardDao {
	List<Board> list();

	int insert(Board board);

	void updateReadCount(int num);

	Board select(int num);

}