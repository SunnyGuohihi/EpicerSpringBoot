package com.epicer.controller.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class cartController {

	// 管理員全部購物車
	// 連線網址路徑: http://localhost:8081/admincart.controller
	@GetMapping("/admincart.controller")
	public String processAdminCartAction() {
		return "cart/admincart";
	}

	// 一般會員個人購物車
	// 連線網址路徑: http://localhost:8081/usercart.controller
	@GetMapping("/usercart.controller")
	public String processUserCartAction() {
		return "cart/usercart";
	}

	// 管理員查全部訂單
	// 連線網址路徑: http://localhost:8081/adminorder.controller
	@GetMapping("/adminorder.controller")
	public String processAdminOrderAction() {
		return "cart/adminorder";
	}

	// 一般會員個人訂單
	// 連線網址路徑: http://localhost:8081/userorder.controller
	@GetMapping("/userorder.controller")
	public String processUserOrderAction() {
		return "cart/userorder";
	}

	// EPICER測試前台登入頁面
	// 連線網址路徑: http://localhost:8091/firstfrontindex
	@GetMapping("/firstfrontindex")
	public String processFristFrontIndexAction() {
		return "frontframeblankpgs/shop";
	}

}