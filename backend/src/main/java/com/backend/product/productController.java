package com.backend.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.ProductDTO;

@Controller
public class productController {
	@Autowired
	@Qualifier("productservice")
	ProductService service;
	
	@RequestMapping(value="/product"  , produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<ProductDTO> productlist(){
		List<ProductDTO> list = service.productlist();
		return list;
		
	}
	
	@RequestMapping("/productpaginglist" )
	public ModelAndView productlist(int page) {
		// id 알파벳순 나열 ?페이지 5명 회원 
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> list = service.productlist(page);
		mv.addObject("productlist", list);
		mv.addObject("product", "페이징처리리스트");
		mv.setViewName("product/productlist");
		return mv;
	}

	@RequestMapping("/productssearch" )
	public ModelAndView productlist(String [] address) {
		ModelAndView mv = new ModelAndView();
		List<String> list = service.productlist(address);
		mv.addObject("productaddresslist", list);
		mv.addObject("product", "주소검색리스트");
		mv.setViewName("product/productlist");
		return mv;
	}
	@RequestMapping(value="/productinsert", method = RequestMethod.GET)
	public String insertform() {
		return "product/insertform";
	}
	
	@RequestMapping(value="/productinsert", method = RequestMethod.POST)
	public ModelAndView insertresult(ProductDTO dto) {
		//dto.setId(request.getParameter("id")
		int result = service.insertproduct(dto);//id, email, phone 중복 불가능
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);//int
		mv.setViewName("product/insertresult");
		return mv;
	}
	
	@RequestMapping(value="/productupdate", method = RequestMethod.GET)
	public String updateform(String id) {
		return "product/updateform";//주소 이름 수정 폼 
	}
	
	//<form action="membermybatisupdate" method="post" >
	@RequestMapping(value="/productupdate", method = RequestMethod.POST)
	public ModelAndView updateresult(ProductDTO dto) {//id(고정), name, address 입력 
		int result = service.upateproduct(dto);//id, email, phone 중복 불가능
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);//int
		mv.setViewName("product/updateresult");
		return mv;
	}
	@RequestMapping("/productdelete")
	public String deleteresult(String id) {
		int result = service.deleteproduct(id);

		if(result == 1) {
			return "redirect:/productlist";//컨트롤러 url매핑메소드호출(회원리스트)
		}
		return "redirect:/productinsert";// 컨트롤러 url매핑메소드 호출(가입폼)
	}
}




