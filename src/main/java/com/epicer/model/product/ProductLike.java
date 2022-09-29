package com.epicer.model.product;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "product_like")
@Component
public class ProductLike implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "productlikeid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productLikeId;
	
	
	@Column(name="userid")
	private Integer userId;
	
	@Column(name = "producttotalike")
	private Integer productTotaLike;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productid")
	private Product product;

	
	public ProductLike() {
		super();
	}

	public ProductLike( Integer userId,  Product product) {
		super();
		this.userId = userId;
		this.product = product;
	}

	public Integer getProductLikeId() {
		return productLikeId;
	}

	public void setProductLikeId(Integer productLikeId) {
		this.productLikeId = productLikeId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductTotaLike() {
		return productTotaLike;
	}

	public void setProductTotaLike(Integer productTotaLike) {
		this.productTotaLike = productTotaLike;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	
	
	
	
	
}
