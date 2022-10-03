package com.epicer.service.course;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.course.Course;
import com.epicer.model.course.CourseRepository;
import com.epicer.model.course.Teacher;
import com.epicer.model.course.TeacherRepository;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseRepository cRepo;
	
	@Autowired
	private TeacherService TS ;

	
	//INSERT
	public Course insertCourse(Course newCourse) {

		Teacher theTeacher = TS.getTeacherById(newCourse.getFakeTeacherID());
		System.out.println("新增的課程id為: " + newCourse.getCourseId());
		System.out.println("此課程老師id為: " + theTeacher.getTeacherId());

		if (theTeacher != null) {
			newCourse.setTeacher(theTeacher);
		} 
		return cRepo.save(newCourse);
	}
	
	//UPDATE
	public Course updateCourse(Course editCourse) {
				
		Teacher theTeacher = TS.getTeacherById(editCourse.getFakeTeacherID());
		System.out.println("編輯的課程id為: " + editCourse.getCourseId());
		System.out.println("此課程老師id為: " + theTeacher.getTeacherId());
		if (theTeacher != null) {
			editCourse.setTeacher(theTeacher);
		}
		return cRepo.save(editCourse);	
	}
	
	//DELETE
	public void deleteCourseById(Integer id) {
		 cRepo.deleteById(id);
	}
	
	//SELECTBYID
	public Course getCourseById(Integer id) {
		Optional<Course>  optional = cRepo.findById(id);
		return optional.get();
		
	}
	
	//QUERYALL
	public List<Course> findAllCourse(){		
		return cRepo.findAll();
	}
	
	//IMG 上船自資料夾並回傳黨名
	public String processImg(String courseName , MultipartFile photoData) throws IllegalStateException, IOException {
		
		String filename = courseName+System.currentTimeMillis()+".jpg";
		String saveFileDir = "C:\\Users\\User\\Desktop\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images";
		File saveFilePath = new File(saveFileDir,filename);
		photoData.transferTo(saveFilePath);
		return filename;
		
	}
	
	
	//TestQUERYByCourseStyle
		public List<Course> findAllCourseByStyle(String Style){		
			return cRepo.findByCourseStyleLike(Style);
		}
	

}
