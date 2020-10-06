package com.ch.ch09.service;
import lombok.Data;

@Data
public class PagingBean {

	private int currentPage;
	private int rowPerPage; // 페이지 당 개수
	private int total;
	private int totalPage;
	private int pagePerBlock = 10;
	private int startPage;
	private int endPage;

	public PagingBean(int currentPage, int rowPerPage, int total) {

		this.currentPage = currentPage;
		this.rowPerPage = rowPerPage;
		this.total = total;

		// ﻿총 페이지 = Math.ceil(데이터 총 개수 / 페이지 당 개수)
		totalPage = (int) Math.ceil((double) total / rowPerPage);
		// 시작 페이지 = 현재 페이지-(현재 페이지 -1)%10
		startPage = currentPage - (currentPage - 1) % pagePerBlock;
		// ﻿끝 페이지 = 시작 페이지 + 블록 당 페이지 수 - 1
		endPage = startPage + pagePerBlock - 1;
		// 마지막 블럭의 page 조정
		if (endPage > totalPage)
			endPage = totalPage;
	}
}
