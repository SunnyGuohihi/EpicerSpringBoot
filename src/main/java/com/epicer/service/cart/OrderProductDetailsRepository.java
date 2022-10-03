package com.epicer.service.cart;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.cart.OrderProductDetails;

//訂單明細 Dao
public interface OrderProductDetailsRepository extends JpaRepository<OrderProductDetails, Integer> {
	
	//僅會有insert(寫入不刪)
}
