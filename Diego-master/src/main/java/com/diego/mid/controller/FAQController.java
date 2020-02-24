package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.board.FAQCategoryVO;
import com.diego.mid.model.board.FAQVO;
import com.diego.mid.service.FAQService;
import com.diego.mid.util.Pager;

@Controller
@RequestMapping("/faq/**")
public class FAQController {
	
	@Inject
	private FAQService faqService;
	
	//FAQ List
	@RequestMapping("faqList")
	public ModelAndView faqList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FAQVO> ar = faqService.faqList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("faq/faqList");
		return mv;
	}
	//FAQ select
	@RequestMapping("faqSelect")
	public ModelAndView faqSelect(FAQVO faqvo)throws Exception{
		ModelAndView mv = new ModelAndView();
		faqvo = faqService.faqSelect(faqvo);                                                                                                                                                                                                                                           
		faqvo.setFaq_contents(faqvo.getFaq_contents().replace("\r\n", "<br>"));
		FAQCategoryVO faqCategoryVO = new FAQCategoryVO();
		faqCategoryVO.setFcat_code(faqvo.getFcat_code());
		faqCategoryVO = faqService.categorySelect(faqCategoryVO);
		mv.addObject("category", faqCategoryVO);
		mv.addObject("dto", faqvo);
		mv.setViewName("faq/faqSelect");
		return mv;
	}

	//FAQ Write
	@GetMapping("faqWrite")
	public String faqWrite(Model model)throws Exception{
		List<FAQCategoryVO> ar = faqService.categoy();
		model.addAttribute("category", ar);
		return "faq/faqWrite";
	}
	
	@PostMapping("faqWrite")
	public ModelAndView faqWrite(FAQVO faqvo)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		faqService.faqWrite(faqvo);
		
		
		mv.setViewName("redirect:./faqList");
		return mv;
	}
	
	//FAQ Delete
	@RequestMapping("faqDelete")
	public ModelAndView faqDelete(FAQVO faqvo) throws Exception{
		ModelAndView mv = new ModelAndView();
		faqService.faqDelete(faqvo);
		mv.setViewName("redirect:./faqList");
		return mv;
	}
	
	//FAQ Update
	@GetMapping("faqUpdate")
	public String faqUpdate(FAQVO faqvo, Model model)throws Exception{
		List<FAQCategoryVO> ar = faqService.categoy();
		model.addAttribute("category", ar);
		faqvo = faqService.faqSelect(faqvo);
		model.addAttribute("dto", faqvo);
		return"faq/faqUpdate";
	}
	
	@PostMapping("faqUpdate")
	public ModelAndView faqUpdate(FAQVO faqvo)throws Exception{
		ModelAndView mv = new ModelAndView();
		faqService.faqUpdate(faqvo);
		mv.setViewName("redirect:./faqList");
		return mv;
	}
	
	
	
	
	
	
	
	
}
