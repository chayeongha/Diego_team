package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.admin.DeliveryVO;
import com.diego.mid.service.DeliveryService;
import com.diego.mid.util.Pager;

@Controller
@RequestMapping("/admin/delivery/**")
public class DeliveryController {
	@Inject
	private DeliveryService deliveryService;
	
	//List
	@GetMapping("deliveryList")
	public ModelAndView deliveryList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<DeliveryVO> ar = deliveryService.deliveryList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("admin/delivery/deliveryList");
		return mv;
	}
	
	//insert
	@GetMapping("deliveryInsert")
	public void deliveryInsert()throws Exception{
		
	}
	@PostMapping("deliveryInsert")
	public ModelAndView deliveryInsert(DeliveryVO deliveryVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		deliveryService.deliveryInsert(deliveryVO);
		mv.setViewName("redirect:./deliveryList");
		return mv;
	}
	
	//update
	@GetMapping("deliveryUpdate")
	public String deliveryUpdate(DeliveryVO deliveryVO, Model model)throws Exception{
		deliveryVO = deliveryService.deliverySelect(deliveryVO);
		model.addAttribute("dto", deliveryVO);
		return "admin/delivery/deliveryUpdate";
	}
	
	@PostMapping("deliveryUpdate")
	public ModelAndView deliveryUpdate(DeliveryVO deliveryVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		deliveryService.deliveryUpdate(deliveryVO);
		mv.setViewName("redirect:./deliveryList");
		return mv;
	}
	
	//delete
	@GetMapping("deliveryDelete")
	public String deliveryDelete(DeliveryVO deliveryVO)throws Exception{
		deliveryService.deliveryDelete(deliveryVO);
		
		return "redirect:./deliveryList";
	}
	
	//배송조회
	@GetMapping("deliveryCheck")
	public void deliveryCheck()throws Exception{
		
	}
}
