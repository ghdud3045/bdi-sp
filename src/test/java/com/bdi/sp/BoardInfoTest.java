package com.bdi.sp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bdi.sp.vo.BoardInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardInfoTest {

	@Autowired
	private SqlSession ss;
	
	@Test
	public void selectboardListTest() {
		List<BoardInfo> biList = ss.selectList("SQL.BOARDINFO.selectBoardList");
		System.out.println(biList);
	}
}
