package com.ashu.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ashu.service.IEmployeeManagementService;
import com.ashu.vo.EmployeeVo;

@Controller
public class EmployeeCURDController 
{
	@Autowired
	private IEmployeeManagementService empService;
	@GetMapping("/")
	public String homePage() 
	{
		//lvn
		return "homepage";
		
	}
	
	@GetMapping("/allemp")//g-get
	public String showAllEmployee(Map<String, Object>map) 
	{
		System.out.println("EmployeeCURDController.showAllEmployee()");
		//use service
		List<EmployeeVo> allEmployee = empService.retriveAllEmployee();
		map.put("allEmp", allEmployee);
		map.put("sysDate",new Date());
		//for check avg
		map.put("avg", 0.45);
		return "employee_list";
		
	}
	@GetMapping("/register")
	public String registerEmployeeFormPage(Map<String, Object>map,@ModelAttribute("emp")EmployeeVo empVo) //here take model attribute to add default value means two way binding
	{
		System.out.println("EmployeeCURDController.registerEmployeeFormPage()");
		
		
		return"register_form";
		
		
	}
	//it create problem(Double Posting Problem)
	//problem 1:after reload this page it reload the post page and last  emp repetation added
	//problem 2:same code repeation reduce modularity
	/*	@PostMapping("/register")
		public String registerActor(Map<String, Object>map,@ModelAttribute("emp")EmployeeVo empVo)
		{
			//use service by service it using internal logic and convert to emp
			
			String msg=empService.registerEmployee(empVo);
			map.put("regMsg", msg);
			//to instant update and show added emp
			List<EmployeeVo> allEmployee = empService.retriveAllEmployee();
			map.put("allEmp", allEmployee);//use same name allEmp
			//return lvn
			return "employee_list";
			
		}*/
	
	//to solve above problem use PRG design pattern(post-redirect-get) its redirect to get page and if we reload only get page reload
	//but if we not use redirect specific shared memory it not showing the result msg
	/*	@PostMapping("/register")//p-post
		public String registerActor(Map<String, Object>map,@ModelAttribute("emp")EmployeeVo empVo)
		{
			//use service by service it using internal logic and convert to emp
			
			String msg=empService.registerEmployee(empVo);
			map.put("regMsg", msg);
			
			//return lvn
			return "redirect:allemp"; //R-redirect
			
		}*/
	//using redirect specific shared memory(this one is best way)
	//msg will show but after refresh gone(best) if we want to show message while browser is exist use HttpSession
		@PostMapping("/register")//p-post
		public String registerActor(RedirectAttributes attrs,@ModelAttribute("emp")EmployeeVo empVo)
		{
			//use service by service it using internal logic and convert to emp
			
			String msg=empService.registerEmployee(empVo);
			attrs.addFlashAttribute("regMsg", msg);
			
			//return lvn
			return "redirect:allemp"; //R-redirect
			
		}
	//to show msg while browser exist
	/*	@PostMapping("/register")//p-post
		public String registerActor(HttpSession ses,@ModelAttribute("emp")EmployeeVo empVo)
		{
			//use service by service it using internal logic and convert to emp
			
			String msg=empService.registerEmployee(empVo);
			ses.setAttribute("regMsg", msg);
			
			//return lvn
			return "redirect:allemp"; //R-redirect
			
		}*/
	//edit
	//id come through requestparam no(href written)
	@GetMapping("/edit")
	public String editByid(@RequestParam("no")int id,@ModelAttribute("emp")EmployeeVo vo) 
	{
		//use service
		EmployeeVo empvo=empService.findEmployeeById(id);
		//to show existing data in webpage while updating
		BeanUtils.copyProperties(empvo, vo);
		//lvn
		return "update_actor_form";
			
	}
	@PostMapping("/edit")
	public String updateEmployee(@ModelAttribute("emp")EmployeeVo vo,RedirectAttributes attrs) 
	{
		String msg = empService.updateEmployee(vo);
		attrs.addFlashAttribute("regMsg", msg);//use redirect page msg show name		
		return "redirect:allemp";
	}
	//delete
	//href="remove?no=${emp.eid}
	@GetMapping("/remove")
	public String deleteEmployee(@RequestParam("no")int id,RedirectAttributes attrs) 
	{
		try {
		//use service
		String msg=empService.deleteEmployee(id);
		attrs.addFlashAttribute("regMsg",msg);
	
		}
		catch (Exception e)
		{
			//add error msg as the flash attrbute
			attrs.addFlashAttribute("regMsg", e.getMessage());
			
		}
		return "redirect:allemp";
	}
	
	//pagination
	/*
	📌 Pagination without @RequestParam:
	- Controller takes Pageable param.
	- Spring auto binds ?page, ?size, ?sort → Pageable.
	- @PageableDefault gives default values.
	- Service: repo.findAll(pageable) → Page<T>.
	- JSP: links add ?page=i → auto mapped to Pageable.
	✅ No manual @RequestParam needed.
	*/

	@GetMapping("/allEmpPagination")
	public String getAllDetailsWithPagination(@PageableDefault(page=0,size = 3,sort = "ename",direction = Sort.Direction.ASC)Pageable pagable,Map<String,Object>map) 
	{
		//use service
		Page<EmployeeVo> paginationVo = empService.showEmployeeWithPagination(pagable);
		map.put("pageData", paginationVo);
		return "employee_list_pagination";
		
	}

}
