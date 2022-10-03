package com.epicer.service.cart;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.cart.CartOfProduct;

//購物車Dao
public interface CartOfProductRepository extends JpaRepository<CartOfProduct, Integer> {

	// 查出cartproductid
	// 原生SQL-查cartproductid
	@Query(value = "select * from cart_product_details where userid= ?1 and productid= ?2", nativeQuery = true)
	public Optional<CartOfProduct> getCartProductId(Integer userid, Integer productid);

	// JPQL
//	 public List<CartOfProduct> findByCartUserAndCartProduct(Integer cartUser, Integer cartProduct);

	//利用userId查出整個購物車
	@Query(value ="select * from cart_product_details where userid=?1", nativeQuery = true)
	public List<CartOfProduct> findByCartUser(Integer userId);
}


