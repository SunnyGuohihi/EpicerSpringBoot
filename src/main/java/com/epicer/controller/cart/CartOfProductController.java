package com.epicer.controller.cart;

import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.product.Product;
import com.epicer.model.users.User;
import com.epicer.service.cart.CartOfProductService;
import com.epicer.controller.product.*;

@Controller
@RequestMapping
//@SessionAttributes(names = {"userid"})
public class CartOfProductController {
	
	@Autowired
	private CartOfProductService COPService;

	private static Integer userid=1002;
	
	// 管理員全部購物車  //暫時用不到
	// 開啟前端購物車連線網址: http://localhost:8091/frontproductcart
	@GetMapping("/frontproductcart")
	public String processAdminCartAction() {
		return "cart/admincart";
	}
	
	//前端購物車畫面查全部食材商品 
	//進入商品頁網址: http://localhost:8091/queryusercart
	@GetMapping(path = "/queryusercart")
	public String processActionCartQueryAll(Model m){
		System.out.println("gotoqueryallcart");
//		Integer userid =(Integer)m.getAttribute("userid");
		List<CartOfProduct> beans= COPService.findById2(userid);//找購物車所有商品
		Integer tQuantity = COPService.totalCartQuantity(userid); //計算購物車數量
		Integer tPrice = COPService.totalCartPrice(userid); //計算總金額
		m.addAttribute("queryById",beans);
		m.addAttribute("tQuantity",tQuantity);
		m.addAttribute("tPrice",tPrice);
		return "cart/frontproductintocart";
	}
	
	//從商品頁按鈕進入購物車
	//進入商品頁網址: http://localhost:8091/addproducttocart
	@PostMapping(path = "/addproducttocart")
//	@RequestParam("userid") Integer userId, 
	public String processItemCheckAction(@RequestParam("productid") Integer productId,
			@RequestParam("quantity") Integer quantity,Model m){
		System.out.println("addtocart--userid"+userid);
		User cartUser = new User();
		cartUser.setId(userid);
		Product cartProduct = new Product();
		cartProduct.setProductId(productId);
		CartOfProduct c1 = new CartOfProduct(cartUser, cartProduct , quantity);
		
		//先查詢購物車是否有重複userId+productId->if有，則查出cartId然後修改;if無，則新增
		if(COPService.checkItemList(userid, productId) != null) {
			System.out.println("do update cart!");
			
			Integer cartProductId =  COPService.checkItemList(userid, productId);
			Optional<CartOfProduct> amount = COPService.findById(cartProductId);
			//System.out.println("amount:" + amount + "cartProductId:"+ cartProductId);
			Integer itemquantity = amount.get().getQuantity();
			c1.setQuantity(itemquantity+1);
			c1.setCartProductId(cartProductId);
			COPService.update(c1);
		}else {
			System.out.println("do insert cart!");
			COPService.insert(c1);
		}
		return "redirect:/queryallproductmenu";  //停留在商品頁 //去新的controller才要用redirect:/
	}
	
	//商品總數量&金額 計算
	//進入購物車網址: http://localhost:8080/SpringShoppingCart/gotocart.controller
//	@GetMapping(path = "/gotocart.controller")
//	private String gotoCart(Model m) {
//
////		Integer userid = (Integer)m.getAttribute("userid");
//		Optional<CartOfProduct> beans= COPService.findById(userid);
//		
//		System.out.println("gotocart userid:"+ userid);
//		
//		Integer tQuantity = COPService.totalCartQuantity(userid);
//		Integer tPrice = COPService.totalCartPrice(userid);
//		System.out.println("totalCartQuantity:" +tQuantity +"totalCartPrice:" + tPrice);
//		m.addAttribute("queryById",beans);
//		m.addAttribute("tQuantity",tQuantity);
//		m.addAttribute("tPrice",tPrice);
//		return "ShoppingCartPage";
//	}
	
	//刪除購物車的商品
	@GetMapping("/deleteCartItem")
	public String deleteCartItem(@RequestParam("cartId") Integer cartId) {
		System.out.println("gotoDelete");
		COPService.deleteByCartProductId(cartId);
		
		return "redirect:/queryusercart";
	}
}
