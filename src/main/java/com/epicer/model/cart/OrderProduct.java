package com.epicer.model.cart;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.epicer.model.users.User;

@Entity
@Table(name = "orderProduct")
@Component
public class OrderProduct implements Serializable {

	@Id @Column(name = "orderproductid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderProductId;
	
//	@ManyToOne
//	@JoinColumn(name = "userid")
	@Column(name = "userid")
	private Integer orderUser;
	
	@Column(name = "shipbill")
	private Integer shipbill;
	
	@Column(name = "totalquantity")
	private Integer productTotalQuantity;
	
	@Column(name = "totalprice")
	private Integer productTotalPrice;
	
	@Column(name = "paystatus")
	private String payStatus;
	
	@Column(name = "shipment")
	private String shipment;
	
	//下單時間用毫秒存(統一),時間轉換
	@Column(name = "orderdate")
	private long orderDate;
	
	//優惠劵不確定QAQ
	@Column(name = "couponid")
	private Integer couponId;
	
	@Column(name = "ordername")
	private String orderName;
	
	@Column(name = "orderphone")
	private String orderPhone;
	
	@Column(name = "orderaddress")
	private String orderAddress;
	
	@Column(name = "orderemail")
	private String orderEmail;
	
	// 跟訂單明細表格串聯
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderId", cascade = CascadeType.ALL)
	private Set<OrderProductDetails> orderDetails = new LinkedHashSet<OrderProductDetails>();

	public Integer getOrderProductId() {
		return orderProductId;
	}

	public void setOrderProductId(Integer orderProductId) {
		this.orderProductId = orderProductId;
	}

	public Integer getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(Integer orderUser) {
		this.orderUser = orderUser;
	}

	public Integer getShipbill() {
		return shipbill;
	}

	public void setShipbill(Integer shipbill) {
		this.shipbill = shipbill;
	}

	public Integer getProductTotalQuantity() {
		return productTotalQuantity;
	}

	public void setProductTotalQuantity(Integer productTotalQuantity) {
		this.productTotalQuantity = productTotalQuantity;
	}

	public Integer getProductTotalPrice() {
		return productTotalPrice;
	}

	public void setProductTotalPrice(Integer productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getShipment() {
		return shipment;
	}

	public void setShipment(String shipment) {
		this.shipment = shipment;
	}

	public long getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(long orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public Set<OrderProductDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderProductDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public OrderProduct(Integer orderUser, Integer productTotalQuantity, Integer productTotalPrice, String orderName,
			String orderPhone, String orderAddress, String orderEmail) {
		super();
		this.orderUser = orderUser;
		this.productTotalQuantity = productTotalQuantity;
		this.productTotalPrice = productTotalPrice;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderEmail = orderEmail;
	}

	public OrderProduct() {
		super();
	}

	public OrderProduct(Integer orderProductId, Integer orderUser, Integer productTotalQuantity,
			Integer productTotalPrice, String orderName, String orderPhone, String orderAddress, String orderEmail) {
		super();
		this.orderProductId = orderProductId;
		this.orderUser = orderUser;
		this.productTotalQuantity = productTotalQuantity;
		this.productTotalPrice = productTotalPrice;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderEmail = orderEmail;
	}


}
