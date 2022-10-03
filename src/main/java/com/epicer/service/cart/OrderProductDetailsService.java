package com.epicer.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderProductDetailsService {
	
	@Autowired
	private OrderProductDetailsRepository OPDRep;
	
	//新增訂單明細

}
