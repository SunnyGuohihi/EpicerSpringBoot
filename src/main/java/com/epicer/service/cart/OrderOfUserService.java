package com.epicer.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.users.User;

@Service
@Transactional
public class OrderOfUserService {
	
	@Autowired
	private OrderOfUserRepository orderOfUserRep;
	
//	private static Integer userid=1002;
	
	
	//查詢某位會員
	public User findById(Integer userId){
		System.out.println("userService: userId=" + userId);
		return orderOfUserRep.findByUserId(userId);
	}
	

}
