package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.product.ProductVO;
import com.diego.mid.service.ProsearchService;
import com.diego.mid.util.Pager;

@Controller
@RequestMapping("prosearch/**")
public class ProsearchController {
	
	@Inject
	private ProsearchService prosearchService;
	
	//list
	@RequestMapping(value = "prosearchList", method = {RequestMethod.GET, RequestMethod.POST})
	private ModelAndView productList(Pager pager)throws Exception {
		
		List<ProductVO>ar= prosearchService.productList(pager);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("productList", ar);
		mv.addObject("productsize", ar.size());
		mv.addObject("pager", pager);
		mv.setViewName("prosearch/prosearchList");
		
		System.out.println(ar.size());
		return mv;
		

	} 

}
