package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.product.ImagesVO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.QnaVO;
import com.diego.mid.service.ProductService;
import com.diego.mid.service.QnaService;
import com.diego.mid.util.MPager;
import com.diego.mid.util.PPager;


@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Inject
	private QnaService qnaService;
	
	@Inject
	private ProductService productService;

	private ProductVO productVO;

	private ImagesVO imagesVO;
	

	
	
	//qna작성
	@GetMapping(value = "qnaWrite")
	public void qnaWrite()throws Exception{
		
	}
	
	@PostMapping(value = "qnaWrite")
	public ModelAndView qnaWrite(QnaVO qnaVO)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		int result = qnaService.qnaWrite(qnaVO);
	
		String msg = "Insert Fail";
		if(result==1) {
			msg="Insert Success";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", "../admin/qnaList");
		mv.setViewName("common/common_result");
		return mv;
	}
	
	//qna리스트
	@GetMapping(value = "qnaList")
	public ModelAndView qnaList(PPager pager)throws Exception {
	
		List<QnaVO>ar = qnaService.qnaList(pager);
	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("count", qnaService.qnaCount(pager));
		mv.addObject("qnaList", ar);
		mv.addObject("pager", pager);
		
		mv.setViewName("mid/admin/qnaList");
		
		return mv;
		
	}
	
	
	//qna셀렉트
	@GetMapping("qnaSelect")
	public ModelAndView qnaSelect(QnaVO qnaVO, Integer pro_num)throws Exception {
		//맨위에 인젝트를 해놓았기 때문에 뒤에꺼만가져와서 NEW해줌.
		productVO= new ProductVO();
		imagesVO = new ImagesVO();
		
		//셀렉트문은 PRO_NUM을사용하여 불러오기 때문에 각자 PRO_NUM을 셋해줌.
		//System.out.println(qnaVO.getPro_num());
		qnaVO.setPro_num(pro_num);
		productVO.setPro_num(pro_num);
		imagesVO.setPro_num(pro_num);
		
		ModelAndView mv = new ModelAndView();
		
		qnaVO = qnaService.qnaSelect(qnaVO);
		
		//productVO 셀렉트문과 imageVO셀렉트문을 두개같이사용하기위해 
		//VO들을 객체 생성해서 담아주고 VO들을 MV에 담아 보내준다.
		productVO = qnaService.productSelect(productVO);
					
		imagesVO = qnaService.imagesSelect(imagesVO);
		
		qnaVO.setContents(qnaVO.getContents().replace("\n\r", "<br>"));
		
		mv.addObject("images", imagesVO);
		mv.addObject("product", productVO);
		mv.addObject("qna", qnaVO);
		mv.setViewName("qna/qnaSelect");
		
		return mv;
	}
	
	
	
	
	//DELETE
	@GetMapping("qnaDelete")
	public ModelAndView qnaDelete(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.qnaDelete(qnaVO);
		String msg="Delete Fail";
		
		if(result==1) {
			
			msg="Delete Success";
		}
		mv.addObject("msg",msg);
		mv.addObject("path", "qnaList");
		mv.setViewName("common/common_result");
		
		return mv;
		
	}
	
	//REPLY
	@GetMapping("qnaReply")
	public ModelAndView qnaReply(QnaVO qnaVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = qnaService.qnaSelect(qnaVO);
		
		mv.addObject("qna", qnaVO);
		mv.setViewName("qna/qnaReply");
		
		return mv;
	}
	
	@PostMapping("qnaReply")
	public ModelAndView qnaReply2(QnaVO qnaVO)throws Exception{
		
		ModelAndView mv= new ModelAndView();
		
		int result= qnaService.qnaReply(qnaVO);
		String msg="Reply Fail";
		if(result==1) {
			msg="Reply Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "qnaList");
		mv.setViewName("../admin/qnaList");
		
		return mv;
	}
	

	//UPDATE
	@GetMapping("qnaUpdate")
	public ModelAndView qnaUpdate(QnaVO qnaVO, Integer pro_num)throws Exception{
		
		qnaVO.setPro_num(pro_num);
		
		ModelAndView mv = new ModelAndView();
		qnaVO=qnaService.qnaSelect(qnaVO);
		
		
		mv.addObject("qna", qnaVO);
		mv.setViewName("qna/qnaUpdate");
		return mv;
	}
	
	@PostMapping("qnaUpdate")
	public ModelAndView qnaUpdate2(QnaVO qnaVO)throws Exception{
		
		int result = qnaService.qnaUpdate(qnaVO);
		ModelAndView mv= new ModelAndView();
		
		String msg="Update Fail";
		if(result==1) {
			msg="Update Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "qnaList");
		mv.setViewName("common/common_result");

		return mv;
	}
}
