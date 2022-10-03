package com.epicer.service.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.cart.OrderProduct;
import com.epicer.model.product.Product;

//訂單總表Dao
public interface OrderProductRepository extends JpaRepository<OrderProduct, Integer> {

	
	//(管理員)查詢全部訂單內容
	//同ProductQuery不用改
	
	
	//修改訂單狀態(未出貨/已出貨)
	
	
	
	
	//同意會員取消訂單(訂單資料不可刪除) ->修改狀態成 : 取消訂單
}
