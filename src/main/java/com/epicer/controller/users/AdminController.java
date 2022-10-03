package com.epicer.controller.users;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.users.Message;
import com.epicer.model.users.User;
import com.epicer.service.users.LoginService;
import com.epicer.service.users.ManagementService;
import com.epicer.service.users.RegisterService;
import com.epicer.util.Tools;

@Controller
@SessionAttributes(names= {"user","sgender","scity","sbirth","list"})
public class AdminController {

	@Autowired
	private RegisterService register;
	@Autowired
	private LoginService login;
	@Autowired
	private ManagementService management;
	
	private static final String localpath = "C:\\Users\\User\\Desktop\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images\\";

	private Tools tools=new Tools();
	
	
	//確認密碼
	@PostMapping(path="/checkpassword")
	public Message checkPassword(@RequestBody User user) {
		Message pwdmsg = new Message();
		String account = user.getAccount();
		Message msg = login.checkAccount(account);
		User result = (User)msg.getObject();
		if(result.getPassword().equals(user.getPassword())) {
			pwdmsg.setCode(0);
			pwdmsg.setMessage("密碼正確");
			pwdmsg.setObject(result); //管理員domain
		}else {
			pwdmsg.setCode(1);
			pwdmsg.setMessage("密碼錯誤");
		}
		return pwdmsg;
	}
	
	
	
	
	
	//返回
	@PostMapping(path = "/back")
		public String backToIndex(Model m,SessionStatus status) {
		User user = (User)m.getAttribute("user");
		if(user.getStatus()==0) {
			return "users/AdminIndex";			
		}
		status.setComplete();
		return "users/illegal";
		}
	
	
	//確認登入狀態
	@PostMapping(path="/checkadminstatus")
	public String checkAdminStatus(Model m) {
		User user = (User)m.getAttribute("user");
		if(user != null) {
	       if(user.getStatus()==1) {
	    	   return "users/userindex";
	       }else if(user.getStatus()==0){
	    	   return "users/AdminIndex";
	       }else {
	    	   return "users/AdminLogin";
	       }
		}
		return "users/AdminLogin";
	}
	
	//管理者登入
	@PostMapping(path="/adminlogin")
	public String doAdminLogin(@RequestParam("account") String account,@RequestParam String password,Model m,SessionStatus status) {
		 Message msga = login.checkAccount(account);
			if(msga.getCode()==1) { //帳號不存在
				m.addAttribute("account",account);
				m.addAttribute("password",password);
				m.addAttribute("msga",msga);
				return "users/AdminLoginReset";
			}else {//帳號存在
				Message msgp = login.cheackPassword(account, password);
				if(msgp.getCode()==1) { //密碼輸入錯誤
					m.addAttribute("account",account);
					m.addAttribute("password",password);
					m.addAttribute("msgp",msgp);
					return "users/AdminLoginReset";
				}else { //驗證通過
					User admin= (User)msga.getObject();
					login.updateDate(admin);
					User user = login.showIndex(account);
					String sgender = user.getGenderName(user.getGender());
					String sbirth = tools.getStringDate(user.getBirth());
					String scity = tools.getCityName(user.getCity());
					m.addAttribute("user",user);
					m.addAttribute("sgender",sgender);
					m.addAttribute("scity",scity);
					m.addAttribute("sbirth",sbirth);
					if(user.getStatus()==0) {
						return "users/AdminIndex";
					}else {
						status.setComplete();
						return "users/illegal"; //非管理者，可以再想		
					}
				}
			}
		}
	
	
	//查詢所有使用者資料
	@PostMapping(path="/user")
	public String getAllUsers(@RequestParam("status") int status,Model m,SessionStatus sessionstatus) {
		User user = (User) m.getAttribute("user");
		if(user.getStatus()==0) {
			List<User> list = management.doSearch(status);
			m.addAttribute("list",list);
			return "users/Adminusersdata";			
		} //非管理者滾球
		sessionstatus.setComplete();
		return "users/illegal";
	}
	
	//使用者管理
	@PostMapping(path="/usersdata")
	public String getAllUsersform(Model m,SessionStatus status){
		User user= (User)m.getAttribute("user");
		if(user.getStatus()==0) {
			return "users/Adminusersdata";			
		}
		status.setComplete();
		return "users/illegal";
	}
	
	//新進員工註冊
	@PostMapping(path="empregister")
	public String getEmpregister(Model m,SessionStatus status){
		User user = (User) m.getAttribute("user");
		if(user.getStatus()==0) {
			return "users/AdminRegister";			
		}
		status.setComplete();
		return "users/illegal";
	}
	
	
	//員工資料驗證
	@RequestMapping (path="/empcheck" , method =RequestMethod.POST) // empregister.jsp
	public String checkEmpAll(
			   @RequestParam("name") String name,@RequestParam("gender") String gender,
			   @RequestParam("birth") String birth,@RequestParam("account") String account,
			   @RequestParam("password") String password,@RequestParam("phone") String phone,
			   @RequestParam("county") String city,@RequestParam("district") String township,
			   @RequestParam("road") String road,Model m) {
				HashMap<String, Message> show = new HashMap<String, Message>();
				int numgender = tools.getGenderNum(gender);
				Long longbirth = tools.getLongFromString(birth);
				int numcity = tools.getCityNum(city);
				User user = new User(name,numgender, longbirth, account, password, phone, numcity, township, road);
				Message msg = register.checkAccount(user);
				show = register.checkAll(user);
				Message result = show.get("result");
				Message passwordd = show.get("password");
				if(result.getCode() == 0 && msg.getCode() == 0) { //驗證通過
					m.addAttribute("user",user);
					String sgender = tools.getGenderName(user.getGender());
					String scity = tools.getCityName(user.getCity());
					String sbirth = tools.getStringDate(user.getBirth());
					m.addAttribute("sgender",sgender);
					m.addAttribute("scity",scity);
					m.addAttribute("sbirth",sbirth);
					return "users/AdminDisplayForm";
				}else { //驗證有誤
				    m.addAttribute("show",show);
				    m.addAttribute("account",msg);
				    m.addAttribute("user",user);
					return "users/AdminRegisterReset";
				}
			}
	
	//新增員工
	@RequestMapping (path="/empinsert" , method =RequestMethod.POST) // DisplayForm.jsp
	public String InertEmp(Model m) {
		User user = (User)m.getAttribute("user");
		user.setStatus(0); //狀態碼
		long time = new Date().getTime();
		user.setLogindate(time);
		user.setNickname("尼還沒有設定唷");
		user.setAvatar("images/default.jpg"); //改個預設員工照
		boolean result = register.InsertClient(user);
		if(result) {
			String sgender = tools.getGenderName(user.getGender());
			String scity = tools.getCityName(user.getCity());
			String sbirth = tools.getStringDate(user.getBirth());
			m.addAttribute("sgender",sgender);
			m.addAttribute("scity",scity);
			m.addAttribute("sbirth",sbirth);
			return "users/AdminIndex";
		}else {
			return "users/error";
		}
	}
	
	
	//個人資料
		@RequestMapping(path = "/adminmanagement" ,method=RequestMethod.POST )
		public String showInform(Model m,SessionStatus status) {
			User user = (User)m.getAttribute("user");
			if(user.getStatus()==0) {
				User admin = management.showInform(user.getAccount());
				String sgender = admin.getGenderName(admin.getGender());
				String scity = tools.getCityName(admin.getCity());
				String sbirth = tools.getStringDate(admin.getBirth());
				m.addAttribute("user",admin);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "users/AdminManagement";
			}
			status.setComplete();
			return "users/illegal";
		}
		
		
		//修改員工個人資料
		@RequestMapping(path = "/adminmodify" ,method=RequestMethod.POST )
		public String showModify(@RequestParam("submit") String chose,Model m,SessionStatus status) {
			User user = (User)m.getAttribute("user");
			if(user.getStatus()==0) {
				if(chose.equals("修改")){
					User admin = management.showInform(user.getAccount());
					String sgender = admin.getGenderName(admin.getGender());
					String scity = tools.getCityName(admin.getCity());
					String sbirth = tools.getStringDate(admin.getBirth());
					m.addAttribute("user",admin);
					m.addAttribute("sgender",sgender);
					m.addAttribute("sbirth",sbirth);
					m.addAttribute("scity",scity);
					return "users/AdminManagementForm";		
				}else{ //返回
					if(user.getStatus()==0) {
						return "users/AdminIndex";
					}
	     			status.setComplete();
					return "users/illegal";
				}
			}else {
				status.setComplete();
				return "users/illegal";
			}
			
		}
		
		
		//修改員工個人資料
		@RequestMapping(path = "/doadminmodify" ,method=RequestMethod.POST )
		public String doModify(@RequestParam("submit") String chose,@RequestParam("nickname") String nickname,
				@RequestParam("password") String password,@RequestParam("id") int id,
				@RequestParam("phone") String phone,@RequestParam("county") String city,
				@RequestParam("district") String township,@RequestParam("road") String road,
				@RequestParam("myfile") MultipartFile file,Model m,SessionStatus status) throws IllegalStateException, IOException {
			if(chose.equals("確認")) {
				User result = management.findById(id);
				int numcity = tools.getCityNum(city);
				result.setPassword(password);
				result.setNickname(nickname);
				result.setPhone(phone);
				result.setCity(numcity);
				result.setTownship(township);
				result.setAddress(road);
				HashMap<String, Message> show = management.checkAll(result);
				if(show.get("result").getCode()==1) {
					m.addAttribute("show",show); //request scope
					return "users/AdminManagementForm";
				}else { //驗證通過開始修改
					String filename = file.getOriginalFilename();
					File fullpath = new File(localpath,filename);
					file.transferTo(fullpath);
					if(file.getName()!=null && file.getName().length() !=0) {
						User admin = management.updateUser(result,filename);   		
						//最後一步
//						m.addAttribute("user",admin);
						String path = this.showInform(m,status);
						return path;
					}
				}
			}
			return "users/AdminManagement";
		}
		
		
		//刪除該筆使用者資料(真的刪除)
//		@PostMapping(path="/delete")
//		public String doDelete(@RequestParam("password") String password,@RequestParam("userid") int id,Model m,SessionStatus status) {
//			User user = (User)m.getAttribute("user");
//			if(user.getStatus()==0) {
//				if(user.getStatus()==0 && password.equals(user.getPassword())) {
//					Message msg = management.deleteById(id);
//					m.addAttribute("msg",msg);
//					return "users/Adminusersdata";			
//				}else {
//					Message msg =new Message();
//					msg.setMessage("密碼錯誤，請重新嘗試");
//					m.addAttribute("msg",msg);
//					return "users/Adminusersdata";	
//				}				
//			}else {
//				status.setComplete();
//				return "users/illegal";
//			}
//			
//		}
		
		
		//刪除該筆使用者資料(假的刪除)
		@PostMapping(path="/delete")
		public String doDelete(@RequestParam("password") String password,@RequestParam("userid") int id,Model m,SessionStatus status) {
			User user = (User)m.getAttribute("user");
			if(user.getStatus()==0) {
				if(user.getStatus()==0 && password.equals(user.getPassword())) {
					Message msg = management.changeStatusById(id);
					m.addAttribute("msg",msg);
					return "users/Adminusersdata";			
				}else {
					Message msg =new Message();
					msg.setMessage("密碼錯誤，請重新嘗試");
					m.addAttribute("msg",msg);
					return "users/Adminusersdata";	
				}				
			}else {
				status.setComplete();
				return "users/illegal";
			}
			
		}
		
		//登出
		@RequestMapping(path="/adminlogout", method=RequestMethod.GET)
		public String doLogout(Model m,SessionStatus status) {
			status.setComplete();
			return "users/index";
		}
	
}
