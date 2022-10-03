package com.epicer.controller.forum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleCollectRecBean;
import com.epicer.model.forum.ArticleReplyBean;
import com.epicer.model.forum.ArticleUserBean;
import com.epicer.model.forum.WangEditorResponse;
import com.epicer.service.forum.ArticleReplyService;
import com.epicer.service.forum.ArticleService;
import com.epicer.service.forum.ArticleUserRecService;
import com.epicer.util.TimeTest;
import com.epicer.util.fileUtils;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService aService;

	@Autowired
	private ArticleReplyService arService;

	
	@Autowired
	private ArticleUserRecService aurService;

	@Autowired
	private HttpSession session;

	@Autowired
	private SessionFactory factory;

	@GetMapping("/QueryAllPage")
	public String QueryAllPage() {
		return "forum/adminforumpage";
	}

	@GetMapping("/QueryAllAjax")
	@ResponseBody
	public List<ArticleBean> QueryAllAjax() {
		return aService.findAll();
	}

	@PostMapping("/QueryNameAjax")
	@ResponseBody
	public List<ArticleBean> QueryNameAjax(String title) {
		return aService.findByTitleLike("%"+title+"%");
	}

	@PostMapping("/QueryCategoryAjax")
	@ResponseBody
	public List<ArticleBean> QueryCategoryAjax(int categoryId) {
		return aService.findByCategoryLike(categoryId);
	}
	
	
	@PostMapping("/QueryReplyReport")
	@ResponseBody
	public List<ArticleReplyBean> QueryReplyReport(int status) {
		return arService.findAllByStatus(status);
	}
	
	@PostMapping("/QueryArticleReport")
	@ResponseBody
	public List<ArticleBean> QueryArticleReport(int status) {
		return aService.findByStatus(status);
	}

	@GetMapping("/forumAdd")
	public String forumAddPage() {
		return "forum/forumAdd";
	}

	@PostMapping("/articleAdd")
	public String articleAdd(int category, String articleTitle, String articleContent) {
		ArticleBean article = new ArticleBean();
		article.setPlateformCategoryId(category);
		article.setTitle(articleTitle);
		article.setDate(TimeTest.getTime());
		article.setArticleContent(articleContent);
		article.setStatus(0);
		int userId = (int) session.getAttribute("userId");
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		s.close();
		article.setUser(userID);
		
		aService.insert(article);
		return "redirect:/QueryAllPage";
	}

	@PostMapping("/forumUpdatePage")
	public String forumUpdatePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumUpdate";
	}
	@PostMapping("/forumAdminUpdatePage")
	public String forumAdminUpdatePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumAdminUpdate";
	}
	
	@PostMapping("/forumReport")
	public String forumReport(int number) {
		aService.insertReport(1,number);
		return "redirect:/QueryAllPage";
	}
	
	
	@PostMapping("/articleReportUpdate")
	public String articleUpdate(int status,int articleId) {
		aService.updateReport(status, articleId);
		return "redirect:/QueryAllPage";
	}
	
	

	@PostMapping("/articleUpdate")
	public String articleUpdate(int articleId, String aTitle, String aContent) {
		ArticleBean article = new ArticleBean();
		int userId = (int) session.getAttribute("userId");
		article.setArticleId(articleId);
		article.setTitle(aTitle);
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		s.close();
		article.setUser(userID);
		article.setArticleContent(aContent);
		article.setDate(TimeTest.getTime());
		article.setStatus(0);
		aService.insert(article);
		return "redirect:/QueryAllPage";
		
	}

	@PostMapping("/articleDetail")
	public String articleDetail(Integer articleId) {
		
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(replyid);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forum/adminfourmDetail";
	}
	
	@PostMapping("/replyDetail")
	@ResponseBody
	public List<ArticleReplyBean> replyDetail(int articleId,String replyContent) {
		
		int userId = (int) session.getAttribute("userId");
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		ArticleBean articleID = s.get(ArticleBean.class, articleId);
		s.close();
		ArticleReplyBean articleReply = new ArticleReplyBean();
		articleReply.setArticleId(articleID);
		articleReply.setUser(userID);
		articleReply.setArticleReplyContent(replyContent);
		articleReply.setArticleReplyDate(TimeTest.getTime());
		articleReply.setStatus(0);
		
		arService.insert(articleReply);
		
		
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(replyid);
		for (ArticleReplyBean articleReplyBean : selectReplyAll) {
			System.err.println(articleReplyBean.getUser().getUserId());
		}
		return selectReplyAll ;
	}
	
	@PostMapping("/replyEmptyDetail")
	@ResponseBody
	public List<ArticleReplyBean> replyEmptyDetail(int articleId) {
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(replyid);
		return selectReplyAll ;
	}
	
	
	
	

	@PostMapping("/articleDelete")
	public String articleDelete(int articleId) {
		aService.deleteById(articleId);
		return "redirect:/QueryAllPage";
	}
	


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@PostMapping("/replyAdd")
	public ArticleReplyBean replyAdd(int articleId, String replyContent) {
		int userId = (int) session.getAttribute("userId");
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		ArticleBean articleID = s.get(ArticleBean.class, articleId);
		s.close();
		ArticleReplyBean articleReply = new ArticleReplyBean();
		articleReply.setArticleId(articleID);
		articleReply.setUser(userID);
		articleReply.setArticleReplyContent(replyContent);
		articleReply.setArticleReplyDate(TimeTest.getTime());
		articleReply.setStatus(0);
		return arService.insert(articleReply);
//		return "redirect:/replyDetail";
	}

	
///////////////////////刪第一個
	@PostMapping("/replyDelete")
	public String replyDelete(int replyId, int articleId) {
		arService.deleteById(replyId);
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		ArticleBean reply  = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(reply);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forward:/articleDetail";
	}

	@PostMapping("/replyUpdatePage")
	public String replyUpdatePage(int replyId) {
		ArticleReplyBean replyUpdateDetail = arService.findById(replyId);
		session.setAttribute("replyUpdateDetail", replyUpdateDetail);
		return "forum/forumReplyUpdate";
	}

	@PostMapping("/replyUpdate")
	public String replyUpdate(int articleId, int replyId, String replyContent) {

		arService.updateobject(replyContent, TimeTest.getTime(), replyId);
		
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(selectDetail);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forum/adminfourmDetail";
	}
	
	@PostMapping("/replyAdminUpdatePage")
	public String replyAdminUpdatePage(int articleReplyId) {
		ArticleReplyBean replyUpdateDetail = arService.findById(articleReplyId);
		session.setAttribute("replyUpdateDetail", replyUpdateDetail);
		return "forum/forumAdminReplyUpdate";
	}

	@PostMapping("/replyAdminUpdate")
	public String replyAdminUpdate(int status,int replyId) {
		System.out.println(status);
		System.out.println(replyId);
		arService.updateReport(status, replyId);
		return "redirect:/QueryAllPage";
	}

	
	@PostMapping("/replyReport")
	public String ReplyReport(int replyId , int articleId) {
		arService.insertReport(1,replyId);
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		ArticleBean reply  = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(reply);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forward:/articleDetail";
	}
	

//////////////////////////////////////////////////////////////////////////////////////////	
	
	@GetMapping("/forumUser")
	public String forumUser() {
		return "forum/forumUserPage";
	}
	
	@GetMapping("/QueryUserArticle")
	@ResponseBody
	public List<ArticleBean> QueryUserArticle() {
		int userId = (int) session.getAttribute("userId");
		List<ArticleBean> artilces = new ArrayList<>();
		Session s = factory.openSession();
		System.out.println(userId);
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		s.close();
		Iterable<ArticleBean> selectUserId = aService.findByUser(userID);
		System.out.println(selectUserId);
		for (ArticleBean article : selectUserId) {
			artilces.add(article);
		}
		return artilces;

	}

	@GetMapping("/QueryUserReply")
	@ResponseBody
	public List<ArticleReplyBean> QueryUserReply() {
		int userId = (int) session.getAttribute("userId");
		List<ArticleReplyBean> artilceReplys = new ArrayList<>();
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		s.close();
		List<ArticleReplyBean> UserReply = arService.findAllByUserId(userID);
		for (ArticleReplyBean article : UserReply) {
			artilceReplys.add(article);
		}
		return artilceReplys;
	}
	/**
	 * 收藏功能
	 * @param articleId
	 * @return
	 */
	@PostMapping("/insertCollect")
	public String addRec(int articleId) {
		ArticleCollectRecBean rec = new ArticleCollectRecBean();
		
		int userId = (int) session.getAttribute("userId");
		Session s = factory.openSession();
		ArticleBean aID = s.get(ArticleBean.class, articleId);
		s.close();
		
		rec.setArticleId(aID);
		rec.setUser(userId);
		
		aurService.insert(rec);
		return "forward:/articleDetail";
	}
	
	@PostMapping("/delCollect")
	public String delRec(int articleId) {
		int userId = (int) session.getAttribute("userId");
		aurService.delete(articleId,userId);
		return "forward:/articleDetail";
	}
	
	@GetMapping("/QueryRec")
	@ResponseBody
	public List<ArticleCollectRecBean> QueryRec() {
		int userId = (int) session.getAttribute("userId");
		return aurService.findRec(userId);
	}
	
	@PostMapping("/UserdelRec")
	public String UserdelRec(int articleId) {
		int userId = (int) session.getAttribute("userId");
		aurService.delete(articleId,userId);
		return "redirect:/forumUser";
	}
	
	
	

	@PostMapping("/UserUpdateArticlePage")
	public String UserUpdateArticlePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumUserArticleUpdate";
	}

	@PostMapping("/UserUpdateArticle")
	public String UserUpdateArticle(int articleId, String aTitle, String aContent) {
		int userId = (int) session.getAttribute("userId");
		ArticleBean article = new ArticleBean();
		article.setArticleId(articleId);
		article.setTitle(aTitle);
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class, userId);
		s.close();
		article.setUser(userID);
		article.setArticleContent(aContent);
		article.setDate(TimeTest.getTime());
		aService.insert(article);
		return "redirect:/forumUser";
	}

	@PostMapping("/UserDeleteArticle")
	public String UserDeleteArticle(int number) {
		aService.deleteById(number);
		return "redirect:/forumUser";
	}

	@PostMapping("/UserDeleteReply")
	public String UserDeleteReply(int replyId) {
		arService.deleteById(replyId);
		return "redirect:/forumUser";
	}

	@PostMapping("/UserUpdateReplyPage")
	public String UserUpdateReplyPage(int replyId) {
		ArticleReplyBean replyUserUpdateDetail = arService.findById(replyId);
		session.setAttribute("replyUserUpdateDetail", replyUserUpdateDetail);
		return "forum/forumUserReplyUpdate";
	}

	@PostMapping("/UserUpdateReply")
	public String UserUpdateReply(int replyId, String replyContent) {
//		ArticleReplyBean articleReply = new ArticleReplyBean();
//		articleReply.setArticleReplyId(replyId);
//		articleReply.setArticleReplyContent(replyContent);
//		articleReply.setArticleReplyDate(TimeTest.getTime());
//		arService.insert(articleReply);
		
		arService.updateobject(replyContent, TimeTest.getTime(), replyId);
		return "redirect:/forumUser";
	}

	@RequestMapping(value = "/images", produces = { "application/json; charset=UTF-8" })
	@ResponseBody // application/json
	public Object test1(@RequestParam("img") MultipartFile file, Map<String, Object> map, HttpServletRequest request)
			throws IOException {
		System.out.println("file.getOriginalFilename() " + file.getOriginalFilename());
		// 使用uuid解决文件重名
		String outpath = "C:\\Users\\User\\Desktop\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
				+ UUID.randomUUID().toString().replaceAll("-", "");
		byte[] bytes = file.getBytes();
		// 读取文件路径
		String path = request.getServletContext().getRealPath("/images/");
		// 如果不存在则新建
		File imgFile = new File(path);
		if (!imgFile.exists()) {
			imgFile.mkdirs();
		}
		String fileName = file.getOriginalFilename();// 文件名称
		System.out.println(path + fileName);
		// 对文件进行写入
		try (FileOutputStream fos = new FileOutputStream(new File(path + fileName))) {
			int len = 0;
			fos.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 這方法照片要重新刷新才能顯示 // String value = "images/"
		// +outpath.substring(outpath.lastIndexOf("\\")+1)+ fileName;
		String value = "images/" + fileName;
		// 保存到服务器目录，记录名称地址
		fileUtils.upload(file, outpath, file.getOriginalFilename());
		map.put("imgName", fileName);
		map.put("imgUrl", outpath + fileName);
		System.out.println(map);
		// 返回信息上传
		return new WangEditorResponse("1", Arrays.asList(value));

	}
}
