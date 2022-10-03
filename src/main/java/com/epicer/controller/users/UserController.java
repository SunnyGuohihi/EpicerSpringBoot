package com.epicer.controller.users;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.users.Message;
import com.epicer.model.users.User;
import com.epicer.service.users.LoginService;
import com.epicer.service.users.ManagementService;
import com.epicer.service.users.RegisterService;
import com.epicer.util.MailTemplateUtil;
import com.epicer.util.Tools;


//@RequestMapping(path = "/user" , method = RequestMethod.GET)
@Controller
@SessionAttributes(names= {"user","sgender","scity","sbirth","list"})
public class UserController {
	@Autowired
	private RegisterService register;
	@Autowired
	private LoginService login;
	@Autowired
	private ManagementService management;
	
	
	@Autowired
	private MailTemplateUtil mailtemplateutil;
	
	private static final String localpath = "C:\\Users\\User\\Desktop\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images";
	
	private Tools tools=new Tools();
	

	
	
//測試用
	@GetMapping(path="/exc")
	public void processExceptionAction() throws Exception {
		throw new Exception() ;
	}
	
	
	
	@GetMapping(path="/form")
	public String RegisterForm() {
		return "users/UserRegister";
	}
	
	
	
	//視圖
	@PostMapping(path="/forgetpassword")
	public String forgetPassword() {
		return "users/forgetPassword";
	}
	
	//寄出認證信
    @PostMapping(path="/vertifyemail")
    @ResponseBody
	public String vertifyEmail(@RequestBody User user,Model m) {
    Message msga = login.checkAccount(user.getAccount());
    if(msga.getCode()==1) {//帳號不存在、已遭停權
    	m.addAttribute("msga",msga);
    	return "users/forgetPassword";
    }else {
    	mailtemplateutil.sendMessageWithFreemarkerTemplate("localpath",user);
    	return "users/forgetPassword";
    }
    }

	
	
	//登出
	@RequestMapping(path="/userlogout", method=RequestMethod.GET)
	public String doLogout(Model m,SessionStatus status) {
		status.setComplete();
		return "users/index";
	}
	
	
	//myprofile
	@RequestMapping(path = "/usermanagement" ,method=RequestMethod.POST )
	public String showInform(Model m) {
		User user = (User)m.getAttribute("user");
		User admin = management.showInform(user.getAccount());
		String sgender = admin.getGenderName(admin.getGender());
		String scity = tools.getCityName(admin.getCity());
		String sbirth = tools.getStringDate(admin.getBirth());
		m.addAttribute("user",admin);
		m.addAttribute("sgender",sgender);
		m.addAttribute("sbirth",sbirth);
		m.addAttribute("scity",scity);
		return "users/Usermanagement";
	}
	
	//editprofile
	@RequestMapping(path = "/usermodify" ,method=RequestMethod.POST )
	public String showModify(@RequestParam("submit") String chose,Model m) {
		if(chose.equals("修改")){
			User user = (User)m.getAttribute("user");
			User admin = management.showInform(user.getAccount());
			String sgender = admin.getGenderName(admin.getGender());
			String scity = tools.getCityName(admin.getCity());
			String sbirth = tools.getStringDate(admin.getBirth());
			m.addAttribute("user",admin);
			m.addAttribute("sgender",sgender);
			m.addAttribute("sbirth",sbirth);
			m.addAttribute("scity",scity);
			return "users/UserManagementForm";			
		}else{ //返回
			User user = (User)m.getAttribute("user");
			if(user.getStatus()==0) {
				return "users/Userindex";
			}
//			User user = (User)m.getAttribute("user");
			return "users/Userindex";
		}
	}
	
	
	//doeditprofile
	@RequestMapping(path = "/domodify" ,method=RequestMethod.POST )
	public String doModify(@RequestParam("submit") String chose,@RequestParam("nickname") String nickname,
			@RequestParam("password") String password,@RequestParam("id") int id,
			@RequestParam("phone") String phone,@RequestParam("county") String city,
			@RequestParam("district") String township,@RequestParam("road") String road,
			@RequestParam("myfile") MultipartFile file,Model m) throws IllegalStateException, IOException {
		if(chose.equals("確認")) {
			User result = management.findById(id);
			int numcity = tools.getCityNum(city);
			System.out.println(id);
			result.setPassword(password);
			result.setNickname(nickname);
			result.setPhone(phone);
			result.setCity(numcity);
			result.setTownship(township);
			result.setAddress(road);
			HashMap<String, Message> show = management.checkAll(result);
			if(show.get("result").getCode()==1) {
				m.addAttribute("show",show); //request scope
				return "users/UserManagementForm";
			}else { //驗證通過開始修改
				String filename = file.getOriginalFilename();
				File fullpath = new File(localpath,filename);
//				byte[] b = file.getBytes();
				file.transferTo(fullpath);
				if(file.getName()!=null && file.getName().length() !=0) {
					User admin = management.updateUser(result,filename);   		
					//最後一步
//					m.addAttribute("user",admin);
					String path = this.showInform(m);
					return path;
				}
			}
		}
		return "users/UserManegement";
	}
	
	
	//checkdata
	@RequestMapping (path="/check" , method =RequestMethod.POST) // Register.jsp
   public String checkAll(
		   @RequestParam("name") String name,@RequestParam("gender") String gender,
		   @RequestParam("birth") String birth,@RequestParam("account") String account,
		   @RequestParam("password") String password,@RequestParam("phone") String phone,
		   @RequestParam("county") String city,@RequestParam("district") String township,
		   @RequestParam("road") String address,Model m) {
			HashMap<String, Message> show = new HashMap<String, Message>();
			int numgender = tools.getGenderNum(gender);
			Long longbirth = tools.getLongFromString(birth);
			int numcity = tools.getCityNum(city);
			User user = new User(name,numgender, longbirth, account, password, phone, numcity, township, address);
			
			Message msg = register.checkAccount(user);			
			show = register.checkAll(user);		
			Message result = show.get("result");
			Message passwordd = show.get("password");
			if(result.getCode() == 0 && msg.getCode() == 0) { //驗證通過
				String sgender = tools.getGenderName(user.getGender());
				String scity = tools.getCityName(user.getCity());
				String sbirth = tools.getStringDate(user.getBirth());
				m.addAttribute("user",user);
				m.addAttribute("sgender",sgender);
				m.addAttribute("scity",scity);
				m.addAttribute("sbirth",sbirth);
				return "users/UserDisplayForm";
			}else { //驗證有誤
			    m.addAttribute("show",show);
			    m.addAttribute("account",msg);
			    m.addAttribute("user",user);
			    m.addAttribute("birth",tools.getStringDate(user.getBirth()));
			    System.out.println(tools.getStringDate(user.getBirth()));
			    System.out.println(user.getTownship()+1);
				return "users/UserRegisterReset";
			}
		}
	
	
	//useremailvertify 
	//Display > Vertiry
	@PostMapping(path="/vertifymail")
	public String SendUseremail(Model m) {
		User user = (User)m.getAttribute("user");
//		user.setStatus(1);
		Date a = new Date();
		long time =a.getTime();
		user.setLogindate(time);
		user.setNickname("尼還沒有設定唷");
		user.setAvatar("images/default.jpg");
		m.addAttribute("user",user);
		mailtemplateutil.sendMessageWithFreemarkerTemplate("notification.ftl",user);  //驗證信		
		return "users/Vertify"; 
	}
	
	
//insertdata (session)
@RequestMapping (path="/insert" , method =RequestMethod.GET) // DisplayForm.jsp要換path
public String InertCilent(Model m) { 
	User user = (User)m.getAttribute("user");
	user.setStatus(1);
	Date a = new Date();
	long time =a.getTime();
	user.setLogindate(time);
	user.setNickname("尼還沒有設定唷");
	user.setAvatar("images/default.jpg");
	boolean result = register.InsertClient(user);
	if(result) {
		String welcome=user.getName()+"歡迎加入！";
		String sgender = tools.getGenderName(user.getGender());
		String scity = tools.getCityName(user.getCity());
		String sbirth = tools.getStringDate(user.getBirth());
		m.addAttribute("sgender",sgender);
		m.addAttribute("scity",scity);
		m.addAttribute("sbirth",sbirth);
		m.addAttribute("welcome",welcome);	
		return "users/Userindex";
	}else {
		return "users/error";
	}
}



@PostMapping(path="/checkuserstatus")
public String checkUserStatus(Model m) {
	User user = (User)m.getAttribute("user");
	if(user != null) {
       if(user.getStatus()==1) {
    	   return "users/Userindex";
       }else if(user.getStatus()==0){ //0管理者
    	   return "users/AdminIndex";
       }else {
    	   return "users/Userlogin";
       }
	}
	return "users/Userlogin";
}


//login
@RequestMapping (path="/login" , method =RequestMethod.POST) // DisplayForm.jsp
public String Login(@RequestParam("account") String account,@RequestParam String password,Model m) {
	 Message msga = login.checkAccount(account);
	if(msga.getCode()==1) { //帳號不存在
		m.addAttribute("account",account);
		m.addAttribute("password",password);
		m.addAttribute("msga",msga);
		return "users/UserLoginReset";
	}else {//帳號存在
		Message msgp = login.cheackPassword(account, password);
		if(msgp.getCode()==1) { //密碼輸入錯誤
			m.addAttribute("account",account);
			m.addAttribute("password",password);
			m.addAttribute("msgp",msgp);
			return "users/UserLoginReset";
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
			if(user.getStatus()==1) {
				return "users/Userindex";
			}else if(user.getStatus() ==0) {
				return "users/AdminIndex";
			}else {
				return "users/index";
			}
		}
	}
}

//測試用udatedata
//@RequestMapping(path = "/upload",method=RequestMethod.POST)
//@ResponseBody
//public String uploadImage(@RequestParam("myfile") MultipartFile file) throws IOException {
//	String filename = file.getOriginalFilename();
////	String temppath = "C:\\Action\\worksapce\\MySpringMvcProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
//	File fullpath = new File(localpath,filename);
//	byte[] b = file.getBytes();
//	file.transferTo(fullpath); //檔案上傳指定路徑
//	System.out.println("fullpath = " + fullpath);
//	if(filename !=null && filename.length() !=0) {
//		this.savePicture(filename);
//	}
//		return "savefilepath" + fullpath;		
//}


//測試用
//public boolean savePicture(String filename) {
//	String usepath="images/"+filename;
//	System.out.println(usepath);
//	boolean result = management.updateImage(usepath);
//	if(result) {
//		return true;
//	}else {
//		return false;
//	}
//	
//}

}
	


