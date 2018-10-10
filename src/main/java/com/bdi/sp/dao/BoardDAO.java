package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.BoardInfo;

public interface BoardDAO {

	public List<BoardInfo> getBoardList(BoardInfo bi);
	public int deleteBoard(int bi);
	public int updateBoard(BoardInfo bi);
	public BoardInfo getBoard(int bi);
	public String insertBoard(BoardInfo bi);
}
