package com.epicer.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.OrderProduct;
import com.epicer.model.product.Product;

@Service
@Transactional
public class OrderProductService {
	
	@Autowired
	private OrderProductRepository orderProductRep;
	
	//查詢全部訂單
	public List<OrderProduct> findAll() {
		return orderProductRep.findAll();
	}
	
	
	//修改訂單狀態(未出貨/已出貨)
	
	
	
	//同意會員取消訂單(訂單資料不可刪除)

}
