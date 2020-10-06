package com.ch.ch09.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.ch09.dao.BoardDao;
import com.ch.ch09.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	@Override
	public List<Board> list(int startRow, int endRow) {
		return bd.list(startRow, endRow);
	}

	@Override
	public int insert(Board board) {
		return bd.insert(board);
	}

	@Override
	public void updateReadCount(int num) {
		bd.updateReadCount(num);
	}

	@Override
	public Board select(int num) {
		return bd.select(num);
	}

	@Override
	public int getTotal() {
		return bd.getTotal();
	}

	@Override
	public int update(Board board) {
		return bd.update(board);
	}

	@Override
	public int delete(int num) {
		return bd.delete(num);
	}

	@Override
	public int maxNum() {
		return bd.maxNum();
	}

	@Override
	public void updateRe_step(Board board) {
		bd.updateRe_step(board);

	}

}