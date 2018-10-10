package com.bdi.sp.conrtroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.dao.BoardDAO;
import com.bdi.sp.vo.BoardInfo;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO bidao;
	
	@RequestMapping(value="/board",method=RequestMethod.GET)
	public @ResponseBody List<BoardInfo> boardList(@ModelAttribute BoardInfo bi){
		return bidao.getBoardList(bi);
	}
	@RequestMapping(value="/board{binum}",method=RequestMethod.GET)
	public @ResponseBody BoardInfo board(@PathVariable int bi){
		return bidao.getBoard(bi);
	}
	@RequestMapping(value="/board",method=RequestMethod.PUT)
	public @ResponseBody String updateBoard(@RequestBody BoardInfo bi) {
		return bidao.updateBoard(bi) + "";
	}
	
	@RequestMapping(value="/board",method=RequestMethod.POST)
	public @ResponseBody String insertBoard(@RequestBody BoardInfo bi) {
		return bidao.insertBoard(bi) + "";
	}
	
	@RequestMapping(value="/board{binum}",method=RequestMethod.DELETE)
	public @ResponseBody String deleteBoard(@PathVariable int bi) {
		return bidao.deleteBoard(bi)+"";
	}
}
