package com.epicer.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.product.Product;
import com.epicer.model.product.ProductLike;
import com.epicer.model.product.ProductLikeRepository;
import com.epicer.model.product.ProductRepository;

@Service
@Transactional
public class ProductLikeService {
	
	@Autowired
	private ProductLikeRepository productLikeRepository;
	
	
	public List<Product> findLikeProductsByUserId(int userId) {
		return productLikeRepository.findProductsByUserId(userId);
	}
	
	public ProductLike findProductLike(int productId,int userId) {
		return productLikeRepository.findProductLike( productId, userId);
	}
	
		
	public ProductLike insert(ProductLike productLike) {
		return productLikeRepository.save(productLike);
	}
	
	public void delete(int productId,int userId) {
		productLikeRepository.delete(productId, userId);
	}
	
	
	

}
