package com.epicer.controller.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.product.Product;
import com.epicer.service.cart.ProductQueryService;

@Controller
@RequestMapping
@SessionAttributes(names = {"totalPages","totalElements","queryall"})//操作分頁查詢用
public class GetProductController {
	
	@Autowired
	private ProductQueryService ptcService;
	
	
	
	//進入商品頁網址: http://localhost:8091/productmenu
//	@GetMapping("/productmenu")
//	public String processProductMainAction() {
//		System.out.println("gotomenu");
//		return "cart/frontproductmenu";
//	}
	
	//前端畫面查全部食材商品
	//進入商品頁網址: http://localhost:8091/queryallproductmenu
	@GetMapping(path = "/queryallproductmenu")
	public String processActionProductQueryAll(Model m){
		System.out.println("gotoqueryallmenu");
		List<Product> beans= ptcService.findAll();
		m.addAttribute("queryall",beans);	
		return "cart/frontproductmenu";
	}
	
}
