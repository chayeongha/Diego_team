package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.board.NoticeVO;
import com.diego.mid.service.NoticeService;
import com.diego.mid.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	@Inject
	private NoticeService noticeService;
	//Noitce List
	@RequestMapping("noticeList")
	public ModelAndView noticeList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NoticeVO> ar = noticeService.noticeList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	//Notice Write
	@GetMapping("noticeWrite")
	public String noticeWrite()throws Exception{
		
		return "notice/noticeWrite";
		
	}
	
	@PostMapping("noticeWrite")
	public ModelAndView noticeWrite(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(noticeVO.getAdmin_id());
		int result = noticeService.noticeWrite(noticeVO);
		
			mv.setViewName("redirect:./noticeList");
		return mv;
	}
	//NoticeSelect
	@RequestMapping(value = "noticeSelect")
	public ModelAndView noticeSelect(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.noticeSelect(noticeVO);
		noticeVO.setContents(noticeVO.getContents().replace("\r\n", "<br>"));
		mv.addObject("dto", noticeVO);
		mv.setViewName("notice/noticeSelect");
		return mv;
	}
	//Notice Delete
	@RequestMapping("noticeDelete")
	public ModelAndView noticeDelete(NoticeVO noticeVO)throws Exception{
		noticeService.noticeDelete(noticeVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:./noticeList");
		return mv;
	}
	
	//Notice Update
	@GetMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO, Model model)throws Exception{
		noticeVO = noticeService.noticeSelect(noticeVO);
		model.addAttribute("dto", noticeVO);
		return "notice/noticeUpdate";
	}
	@PostMapping("noticeUpdate")
	public ModelAndView noticeUpdate(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeService.noticeUpdate(noticeVO);
		mv.setViewName("redirect:./noticeList");
		return mv;
	}
	
}
