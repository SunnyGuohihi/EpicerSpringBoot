package com.epicer.model.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface ProductLikeRepository extends JpaRepository<ProductLike, Integer> {

	@Query( value = "select * from product_like where userid=?1",nativeQuery = true)
	public List<Product> findProductsByUserId(int userid);
	
	@Query( value = " select * from product_like where productid = ?1 and userid =?2",nativeQuery = true)
	public ProductLike findProductLike(int articleId,int userid);
	
//	修改刪除需要有@Modifying
	@Modifying
	@Query( value = " delete from product_like where productid = ?1 and userid =?2",nativeQuery = true)
	public void delete(int articleId,int userid);
	
	
	
	public List<ProductLike> findByUserId(int userId);
	
}
