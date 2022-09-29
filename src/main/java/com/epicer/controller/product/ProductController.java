package com.epicer.controller.product;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.product.Product;
import com.epicer.model.product.ProductLike;
import com.epicer.service.product.ProductLikeService;
import com.epicer.service.product.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductLikeService productLikeService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private SessionFactory factory;
	
//	後台首頁為http://localhost:8081/product
	@GetMapping("/product")
	private String findAll(Model m) {
		List<Product> beans=productService.findAll();
		m.addAttribute("findAll",beans);
		return "product/adminProduct";
	}
	
//	registry.addResourceHandler("productCategory/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
//	要加上面那行才可以
//	@GetMapping(path="/productCategory/{productCategoryId}")
//	public String findCategoryAll(@PathVariable("productCategoryId") Integer productCategoryId ,Model m) {
//		System.out.println(productCategoryId);
//		List<Product> beans=productService.findCategoryAll(productCategoryId);
//		m.addAttribute("findCategoryAll",beans);
//		System.out.println(beans.get(1));
//		return "product/adminProductCategory";
//	}
	
//	分兩頁的寫法
//	@GetMapping(path="/productCategory")
//	public String findCategoryAll(@RequestParam("productCategoryId") Integer productCategoryId ,Model m) {
//		List<Product> beans=productService.findCategoryAll(productCategoryId);
//		m.addAttribute("findCategoryAll",beans);
//		return "product/adminProductCategory";
//	}
	@GetMapping(path="/productCategory")
	public String findCategoryAll(@RequestParam("productCategoryId") Integer productCategoryId ,Model m) {
		List<Product> beans=productService.findCategoryAll(productCategoryId);
		m.addAttribute("findAll",beans);
		return "product/adminProduct";
	}
	
	
	@GetMapping("/insertProduct")
	public String insertProduct() {
		return "product/adminProductInsert";
	}
	
	@PostMapping("/insertProductAction")
//	public String insertProductAction(Product bean )  {
		public String insertProductAction(@RequestParam("productName") String productName,
				@RequestParam("productCategoryId") Integer productCategoryId, @RequestParam("productImage") MultipartFile mf,
				@RequestParam("productUnit") String productUnit, @RequestParam("productPrice") Integer productPrice,
				@RequestParam("productOrigin") String productOrigin,@RequestParam("productStock") Integer productStock,
				@RequestParam("productStatus") Integer productStatus,@RequestParam("productDescription") String productDescription
				) throws IllegalStateException, IOException {
//		存入該專案的位置寫法
		String classLocalPath =this.getClass().getClassLoader().getResource("").getPath();
		String classLocalPathModify= classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir= classLocalPathModify+"webapp/WEB-INF/resources/images"; 
//		用產品名稱來設定檔案名
//		String fileName="product"+productName;
		String fileLocalPath = "images/"+mf.getOriginalFilename();
//	    存檔
		File saveFilePath =new File(saveFileDir,mf.getOriginalFilename());
		mf.transferTo(saveFilePath);
//		存入資料庫的寫法
//		byte[] b=mf.getBytes();
//		bean.setProductImage(b);
		Product bean = new Product(productName, productCategoryId, productUnit, productPrice, productOrigin, productStock, productStatus, productDescription, fileLocalPath);
		bean.setProductImage(fileLocalPath)	;
		
		productService.insert(bean);
		return "redirect:product";//要回controller可以用redirect
	}
	
	@PostMapping("/updateProduct")
    public String updateProduct() {
//	public String updateProduct(@RequestParam("ProductId") Integer productId,Model m ) {
//		Product product = productService.getById(productId);
//		m.addAttribute("product", product);
		return "product/adminProductUpdate";
	}
	
//	還沒加照片
//	public String updateProductAction(Product bean) {
//		productService.update(bean);
//		return "redirect:product";
//	}
	
	@PostMapping("/updateProductAction")
	public String updateProductAction(Model m, @RequestParam("ProductId") Integer productId, @RequestParam("productName") String productName,
			@RequestParam("productCategoryId") Integer productCategoryId, @RequestParam("productImage") MultipartFile mf,
			@RequestParam("productUnit") String productUnit, @RequestParam("productPrice") Integer productPrice,
			@RequestParam("productOrigin") String productOrigin,@RequestParam("productStock") Integer productStock,
			@RequestParam("productStatus") Integer productStatus,@RequestParam("productDescription") String productDescription,String oldimg 
			) throws IllegalStateException, IOException {
		
		if (mf.isEmpty()) {
		
			Product bean = new Product(productId, productName, productCategoryId, productUnit, productPrice, productOrigin, productStock, productStatus, productDescription,oldimg);
			System.out.println(bean);
			productService.update(bean);
			
			
		} else {
			
//			存入該專案的位置寫法
			String classLocalPath =this.getClass().getClassLoader().getResource("").getPath();
			String classLocalPathModify= classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
			String saveFileDir= classLocalPathModify+"webapp/WEB-INF/resources/images"; 
			System.out.println(classLocalPath);
//			/D:/Epicer/EpicerSpringBoot/target/classes/
//			用產品名稱來設定檔案名
//			String fileName="product"+productName+".jpg";
			String fileLocalPath = "images/"+mf.getOriginalFilename();
			//		    存檔
			File saveFilePath =new File(saveFileDir,mf.getOriginalFilename());
			System.out.println(mf.getOriginalFilename());
			mf.transferTo(saveFilePath);
//			存入資料庫的寫法
//			byte[] b=mf.getBytes();
//			bean.setProductImage(b);
			Product bean = new Product(productId, productName, productCategoryId, productUnit, productPrice, productOrigin, productStock, productStatus, productDescription, fileLocalPath);
			System.out.println(bean);
			productService.update(bean);
			
		}

	return "redirect:product";
}
	
	
	@PostMapping("/deleteProductAction")
	public String deleteProductAction(Product bean) {
		productService.delete(bean.getProductId());
		return "redirect:product";
	}
	
	
	@PostMapping("/likeProduct")
	public String likeProductAction(@RequestParam("ProductId") Integer productId) {
		System.out.println(productId);
		int userId = (int) session.getAttribute("userId");
//		開連線拿Product
		Session s = factory.openSession();
		Product product =s.get(Product.class, productId);
		s.close();
		
		ProductLike like=new ProductLike(userId, product);
		ProductLike oldProductLike = productLikeService.findProductLike(productId, userId);
		System.out.println(oldProductLike);
		
		if (oldProductLike != null) {
			productLikeService.delete(productId,userId);
		}else {
			productLikeService.insert(like);
		}
		
		return "redirect:product";
	}
	
	
	
	
}
