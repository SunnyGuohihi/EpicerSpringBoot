package com.epicer.controller.course;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.course.Course;
import com.epicer.model.course.Teacher;
import com.epicer.service.course.CourseService;
import com.epicer.service.course.TeacherService;
import com.epicer.util.TimeTest;

@Controller
public class CourseController {

	@Autowired
	private CourseService CS;
	
	@Autowired
	private TeacherService TS;
	
	
	private TimeTest TT = new TimeTest();

	///LISTAll///
	@GetMapping(path = "/666")
	public String processMainAction(Model m) {
		List<Course> list = CS.findAllCourse();
		m.addAttribute("listAll", list);
		return "course/coursePageWithFrame";
	};

	///LIST技術///
		@GetMapping(path = "/queryByCourseStyle/{style}")
		public String process555MainAction(Model m ,@PathVariable("style") String name ) {
			List<Course> listWithStyle = CS.findAllCourseByStyle(name);
			m.addAttribute("listAll", listWithStyle);
			for (Course course : listWithStyle) {
				System.out.println(course.getCourseName());
			}
			
			return "course/coursePageWithFrame";
		};
	
	
	
	
	///INSERT///
	@GetMapping(path = "/beforeCourseInsert")	
	public String beforeCourseInsert(Model m) {

		Course course = new Course();
		m.addAttribute("Course", course);
///////		
		List<Teacher> list = TS.findAllTeacher();
		m.addAttribute("listAll", list);
////////
		return "course/courseInsertWithFrame";
	};

	@PostMapping(path = "/addCourse")
	public String insertCourse(@ModelAttribute("Course") Course course , MultipartFile photo) throws IllegalStateException, IOException {

		System.out.println("我在controller測試新增物件抓取 : " + course.getClassroomId());
		System.out.println("123" +photo.isEmpty());
		
		
		
		 Long courseDate = TT.getLongFromString(course.getFakeCourseDate());		 
		 course.setCourseDate(courseDate);
		
		if (!photo.isEmpty()) {
			String imgName = CS.processImg(course.getCourseName(), photo);
			course.setCourseImage(imgName);
		}else {
			return null;
		}
		CS.insertCourse(course);
		return "redirect:/666";
	};

	///UPDATA///
	@PostMapping(path = "/beforeUpdateCourse")
	public String beforecourseEditor(@RequestParam("courseId") int courseId, Model m) {

		Course course = CS.getCourseById(courseId);
		m.addAttribute("Course", course);
		
	///////		
			List<Teacher> list = TS.findAllTeacher();
			m.addAttribute("listAll", list);
	////////

		return "course/courseEditorWithFrame";
	};

	@PostMapping(path = "/updateCourse")
	public String UpdateCourse(@ModelAttribute("Course") Course newCourse,MultipartFile photo,String oldimg) throws IllegalStateException, IOException {
			
		System.out.println("測試更新抓取時間:"+ " " + newCourse.getFakeCourseDate());
		
		Long courseDate = TT.getLongFromString(newCourse.getFakeCourseDate());		 
		newCourse.setCourseDate(courseDate);
		
		if (photo.isEmpty()) {
			newCourse.setCourseImage(oldimg);
		}else {
			String imgName = CS.processImg(newCourse.getCourseName(), photo);
			newCourse.setCourseImage(imgName);		
		}
		CS.updateCourse(newCourse);
		return "redirect:/666";
	};
	
//	@PostMapping(path = "/updateCourse")
//	public String UpdateCourse(@ModelAttribute("Course") Course newCourse,MultipartFile photo,String oldimg,String localdatetime) throws IllegalStateException, IOException {
//			
//		System.out.println("123測試更新抓取時間:"+ " " + localdatetime);
//		
//		Long courseDate = TT.getLongFromString(localdatetime);		 
//		newCourse.setCourseDate(courseDate);
//		
//		if (photo.isEmpty()) {
//			newCourse.setCourseImage(oldimg);
//		}else {
//			String imgName = CS.processImg(newCourse.getCourseName(), photo);
//			newCourse.setCourseImage(imgName);		
//		}
//		CS.updateCourse(newCourse);
//		return "redirect:/666";
//	};
	

	///DELETE///
	@PostMapping(path = "/deleteCourse")
	public String deleteCourse(@RequestParam("courseId") int courseId) {
		CS.deleteCourseById(courseId);
		return "redirect:/666";
	};
	
	///SELECT///
	@PostMapping(path = "/selectCourse")
	public String selectCourseById(Integer id) {
		
		Course course = CS.getCourseById(id);
		
		return "redirect:/666";
		
	}

}
