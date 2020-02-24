package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.admin.AdminVO;
import com.diego.mid.model.admin.ProManageVO;
import com.diego.mid.model.member.MemberVO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.QnaVO;
import com.diego.mid.service.AdminService;
import com.diego.mid.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	@Inject
	private AdminService adminService;
	
	//adminCheckId
	@GetMapping("adminCheckId")
	public void adminCheckId(AdminVO adminVO, Model model)throws Exception{
		adminVO = adminService.adminCheckId(adminVO);
		String result="unpass";
		if(adminVO == null) {
			result ="pass";
		}
		model.addAttribute("result", result);
		
	}
	
	//Admin Join
	
	@GetMapping("adminJoin")
	public void adminJoin()throws Exception{
		
	}
	@PostMapping("adminJoin")
	public ModelAndView adminJoin(AdminVO adminVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminService.adminJoin(adminVO);
		mv.setViewName("redirect:../");
		return mv;
		
	}
	
	//adminLogin
	@GetMapping("adminLogin")
	public void adminLogin() throws Exception{
		
	}
	
	@PostMapping("adminLogin")
	public String adminLogin(AdminVO adminVO,HttpSession session) throws Exception{
		adminVO = adminService.adminLogin(adminVO);
		if(adminVO != null) {
			session.setAttribute("admin", adminVO);
			session.setAttribute("dto", adminVO);
		}
		return "redirect:./adminMypage";
	}
	
	//Logout
	@GetMapping("adminLogout")
	public String adminLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	};
	
	//adminMypage
	@GetMapping(value = "adminMypage")
	public void adminMypage(HttpSession session)throws Exception{
		session.getAttribute("dto");
		
	}
	//adminUpdate
	@GetMapping("adminUpdate")
	public void adminUpdate()throws Exception{
		
	}
	
	@PostMapping("adminUpdate")
	public ModelAndView adminUpdate(AdminVO adminVO, HttpSession session )throws Exception{
		adminService.adminUpdate(adminVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("admin", adminVO);
		session.setAttribute("admin", adminVO);
		mv.setViewName("redirect:./adminMypage");
		
		return mv;
	}
	//adminDelete
	@GetMapping("adminDelete")
	public String adminDelete(AdminVO adminVO,HttpSession session)throws Exception{
		adminVO= (AdminVO)session.getAttribute("admin");
		adminService.adminDelete(adminVO);
		session.invalidate();
		return "redirect:../";
	}
	
	//MemberManage List
	@GetMapping("memberList")
	public ModelAndView memberList(Pager pager)throws Exception{
		
		
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = adminService.memberList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("admin/memberList");
		return mv;
	} 
	//memberUpdate
	@GetMapping("memberUpdate")
	public String memberUpdate(MemberVO memberVO, Model model)throws Exception{
		memberVO = adminService.memberSelect(memberVO);
		model.addAttribute("dto", memberVO);
		return "admin/memberUpdate";
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		adminService.memberUpdate(memberVO);
		mv.setViewName("redirect:./memberList");
		return mv;
	}
	
	//proManageList
	@GetMapping("proManageList")
	public ModelAndView proManageList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProManageVO> ar = adminService.proManageList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("admin/proManageList");
		return mv;
	}
	
	
	//상품삭제
		@RequestMapping(method =  {RequestMethod.GET, RequestMethod.POST}, value = "productDelete")
		public ModelAndView productDelete(ProManageVO proManageVO, String[] num)throws Exception {
			ModelAndView mv= new ModelAndView();

			int check=0;
			
			int result =0;
			
			for(String string : num) {
				
				proManageVO.setPro_num(Integer.parseInt(string));
				check = adminService.productDelete(proManageVO);
				Thread.sleep(200);
				if(check==1) {
					result++;
				}
			}
			if(result == num.length) {
				result =1;
			}
			
			
			mv.addObject("msg", result);
			
			mv.setViewName("common/common_ajax_result");
			
			return mv;
		}
		
	////////////////////////////////////////////////////	
	//QNA List
		@GetMapping(value = "qnaList")
		public ModelAndView qnaList(Pager pager)throws Exception {
			
			List<QnaVO>ar = adminService.qnaList(pager);
		
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("count", adminService.qnaCount(pager));
			mv.addObject("qnaList", ar);
			mv.addObject("pager", pager);
			
			mv.setViewName("admin/qnaList");
			
			return mv;	
		
		}
}
