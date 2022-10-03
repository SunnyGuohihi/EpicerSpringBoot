package com.epicer.controller.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping
@SessionAttributes(names = {"totalPages","totalElements","queryall"})//操作分頁查詢用
public class GetUserController {
	
	//沒有要影響會員資料，應該用不到這支class

}
