package com.epicer.controller.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderProduct;
import com.epicer.model.product.Product;
import com.epicer.model.users.User;
import com.epicer.service.cart.CartOfProductService;
import com.epicer.service.cart.OrderOfUserService;
import com.epicer.service.cart.OrderProductDetailsRepository;
import com.epicer.service.cart.OrderProductDetailsService;
import com.epicer.service.cart.OrderProductService;

@Controller
@RequestMapping
@SessionAttributes(names = {"totalPages","totalElements","queryall","queryuser"})
public class OrderProductController {
	
	//呼叫購物車Service
	@Autowired
	private CartOfProductService cartService;
	
	//呼叫會員Service
	@Autowired
	private OrderOfUserService userService;
	
	//呼叫訂單Service
	@Autowired
	private OrderProductService orderlistService;
	
	//呼叫訂單明細Service
	@Autowired
	private OrderProductDetailsService OPODService;

	private static Integer userid=1002;
	
	//前端畫面"確認訂單明細" (不能直接連動)
	//進入網址: http://localhost:8091/ordercheck
	@GetMapping(path = "/ordercheck")
	public String processActionCartQueryAll(Model m){
		System.out.println("gotoqueryorder");
//		Integer userid =(Integer)m.getAttribute("userid");
		List<CartOfProduct> beans= cartService.findById2(userid);//找購物車所有商品
		User userBeans = userService.findById(userid);//找會員資料
		Integer tQuantity = cartService.totalCartQuantity(userid); //計算購物車數量
		Integer tPrice = cartService.totalCartPrice(userid); //計算總金額
		m.addAttribute("queryById",beans);
		m.addAttribute("tQuantity",tQuantity);
		m.addAttribute("tPrice",tPrice);
		m.addAttribute("queryuser",userBeans);
		return "cart/frontoldcheckout";
	}
	
	
	//新增商品訂單 
	//進入商品頁網址: http://localhost:8091/orderinsert
	@GetMapping(path = "/orderinsert")
	public String processOrderInsert(Model m) {
		System.out.println("gotoorderinsert");
		
		//@RequestParam("productId")Integer [] productId,
		
		
		
		
		
		
		
		return "redirect:/queryallproductmenu";
	}
	
	//後台管理員開啟總訂單畫面
	//進入訂單管理網址: http://localhost:8091/adminorderquery
	@GetMapping(path = "/adminorderquery")
	public String processOrderQueryAll(Model m) {
		System.out.println("goto admin order query!!");
		List<OrderProduct> allorders = orderlistService.findAll();
//		System.out.println(allorders);
		m.addAttribute("allorderlist", allorders);	
		
		
		//test page
		//return "cart/frontproductordercheck";
		return "cart/adminorder";
	}

}
