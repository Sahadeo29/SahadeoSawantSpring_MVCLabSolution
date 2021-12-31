package com.greatlearning.DebateEvent.studentcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.DebateEvent.entities.Student;
import com.greatlearning.DebateEvent.service.StudentService;

@Controller
@RequestMapping("/students")
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/list")
	public String listStudents(Model model) {
		List<Student> students=studentService.findAll();
		model.addAttribute("Students",students);
		return "list-Students";
	}
	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		Student student=new Student();
		model.addAttribute("Student",student);
		return "Student-form";
	}
	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int id,Model theModel) {
		Student student=studentService.findById(id);
		theModel.addAttribute("Student", student);
		return "Student-form";
	}
	@PostMapping("/save")
	public String saveStudentDetails(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("department")String department,@RequestParam("country") String country) {
		System.out.println(id);
		Student student;
		if(id!=0) {
			student=studentService.findById(id);
			student.setName(name);
			student.setDepartment(department);
			student.setCountry(country);
		}else 
			student=new Student(id, name, department, country);
		studentService.save(student);
		return "redirect:/students/list";
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentid") int id) {
		studentService.deleteById(id);
		return "redirect:/students/list";
	}
	
}
