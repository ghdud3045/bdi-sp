package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.BoardDAO;
import com.bdi.sp.vo.BoardInfo;

@Repository
public class BoardInfoDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<BoardInfo> getBoardList(BoardInfo bi) {
		return ss.selectList("SQL.BOARDINFO.selectBoardList",bi);
	}

	@Override
	public int deleteBoard(int bi) {
		return ss.delete("SQL.BOARDINFO.deleteBoard",bi);
	}

	@Override
	public int updateBoard(BoardInfo bi) {
		return ss.update("SQL.BOARDINFO.updateBoard",bi);
	}

	@Override
	public BoardInfo getBoard(int bi) {
		return ss.selectOne("SQL.BOARDINFO.selectBoard",bi);
	}

	@Override
	public String insertBoard(BoardInfo bi) {
		return ss.insert("SQL.BOARDINFO.insertBoard",bi) +"";
	}

}
