package com.epicer.service.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.users.User;

//會員Dao
public interface OrderOfUserRepository extends JpaRepository<User, Integer> {
	
	//利用userId查出該會員所有資料
	@Query(value ="select * from users where userid=?1", nativeQuery = true)
	public User findByUserId(Integer userId);

}
