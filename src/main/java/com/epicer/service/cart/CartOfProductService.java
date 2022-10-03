package com.epicer.service.cart;

import java.util.List;
import java.util.Optional;

import org.hibernate.property.access.spi.EnhancedGetterMethodImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.product.Product;


@Service
@Transactional
public class CartOfProductService {
	
	@Autowired
	private CartOfProductRepository cartOfProductRep;
	
	//private static Integer userid=1002;

	// 查詢購物車by userid & productid and get cartproductid
	
	public Integer checkItemList(Integer cartUser, Integer cartProduct) {
		//System.out.println("Service checkItem:" + userId + "and" + productId);
		System.out.println("Service checkItemList");
		try {
			Optional<CartOfProduct> optional = cartOfProductRep.getCartProductId(cartUser, cartProduct);
			CartOfProduct result = optional.get();
			Integer cartProductId = result.getCartProductId();
			return cartProductId  ;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//查詢ById
	public Optional<CartOfProduct> findById(Integer userId) {
		return cartOfProductRep.findById(userId);
	}
	
	//查詢ById test(語)
	public List<CartOfProduct> findById2(Integer userId) {
		return cartOfProductRep.findByCartUser(userId);
	}
	
	
	// 查詢整個購物車
	public List<CartOfProduct> findAll() {
		return cartOfProductRep.findAll();
	}
	
	// 新增
	public CartOfProduct insert(CartOfProduct cop) {
		return cartOfProductRep.save(cop);
	}

	// 修改
	public CartOfProduct update(CartOfProduct cop) {
		
		return cartOfProductRep.save(cop);
	}

	// 刪除
	public void deleteByCartProductId(Integer cartId) {
		cartOfProductRep.deleteById(cartId);
	}

	// 計算購物車商品總數量(變動) 即時totalquantity
	public Integer totalCartQuantity(Integer userId) {
		List<CartOfProduct> list = cartOfProductRep.findByCartUser(userId);
		int totalCartQuant=0;
		for(CartOfProduct cart: list) {
			Integer amount = cart.getQuantity();
			totalCartQuant += amount;
		}
		System.out.println(totalCartQuant);
		return totalCartQuant;
	}
	
	
	// 計算購物車商品總金額(變動) 即時totalprice
	public Integer totalCartPrice(Integer userId) {
		List<CartOfProduct> list = cartOfProductRep.findByCartUser(userId);
		int totalCartPrice=0;
		for(CartOfProduct cart: list) {
			Integer amount = cart.getQuantity();
			Integer price = cart.getCartProduct().getProductPrice();
			totalCartPrice += (amount*price);
		}
		System.out.println(totalCartPrice);
		return totalCartPrice;
	}
}
