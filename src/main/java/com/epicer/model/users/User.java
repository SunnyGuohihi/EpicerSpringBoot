package com.epicer.model.users;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.annotation.processing.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderProduct;



@Entity
@Table(name = "users")
public class User {
	@Id
	@Column(name = "userid")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int id;

	@Column(name = "userstatus")
	private int status=3;

	@Column(name = "useraccount")
	private String account;

	@Column(name = "userpassword")
	private String password;

	@Column(name = "username")
	private String name;

	@Column(name = "usernickname")
	private String nickname;

	@Column(name = "usergender")
	private int gender;

	@Column(name = "useravatar")
	private String avatar;

	@Column(name = "userbirth")
	private long birth;

	@Column(name = "userphone")
	private String phone;

	@Column(name = "usercity")
	private int city;

	@Column(name = "usertownship")
	private String township;

	@Column(name = "useraddress")
	private String address;

	@Column(name = "userlogindate")
	private long logindate;

	public User() {
	}

	// 跟購物車表格串聯
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cartUser", cascade = CascadeType.ALL)
	private Set<CartOfProduct> cartByUser = new LinkedHashSet<CartOfProduct>();

	// 跟訂單表格串聯
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderUser", cascade = CascadeType.ALL)
//	private Set<OrderProduct> orderByUser = new LinkedHashSet<OrderProduct>();

	
	// register
	public User(String account, String password, String name, int gender, String avatar, long birth, String phone,
			int city, String township, String address) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.avatar = avatar;
		this.birth = birth;
		this.phone = phone;
		this.city = city;
		this.township = township;
		this.address = address;
	}

	// login
	public User(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}

//Register
	public User(String name, int gender, long birth, String account, String password, String phone, int city,
			String township, String address) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.city = city;
		this.township = township;
		this.address = address;
	}

//edit
	public User(int id, String password, String nickname, String phone, int city, String township, String address) {
		super();
		this.password = password;
		this.nickname = nickname;
		this.phone = phone;
		this.city = city;
		this.township = township;
		this.address = address;
	}

	// All
	public User(int id, int status, String account, String password, String name, String nickname, int gender,
			String avatar, long birth, String phone, int city, String township, String address, long logindate) {
		this.id = id;
		this.status = status;
		this.account = account;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.avatar = avatar;
		this.birth = birth;
		this.phone = phone;
		this.city = city;
		this.township = township;
		this.address = address;
		this.logindate = logindate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public long getBirth() {
		return birth;
	}

	public void setBirth(long birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}

	public String getTownship() {
		return township;
	}

	public void setTownship(String township) {
		this.township = township;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getLogindate() {
		return logindate;
	}

	public void setLogindate(long logindate) {
		this.logindate = logindate;
	}

	public String getGenderName(int gender) {
		String gendername = " ";
		if (gender == 1) {
			gendername = "女性";
			return gendername;
		} else {
			gendername = "男性";
			return gendername;
		}
	}

	// move to tools
	public int getGenderNum(String gendername) {
		int gendernum = 3; // 男0 女1 預設性別編碼3，不存在
		if (gendername.equals("男性")) {
			gendernum = 0;
			return gendernum;
		} else {
			gendernum = 1;
			return gendernum;
		}
	}

	public String getCityName(int city) {
		String cityname = " ";
		String[] allcities = { "基隆市", "臺北市", "新北市", "桃園市", "新竹市", "新竹縣", "苗栗縣", "臺中市", "彰化縣", "南投縣", "雲林縣", "嘉義市",
				"嘉義縣", "臺南市", "高雄市", "屏東縣", "臺東縣", "花蓮縣", "宜蘭縣", "澎湖縣", "金門縣", "連江縣" };
		cityname += allcities[(city)];
		String ncityname = cityname.trim();
		return ncityname;
	}

}
