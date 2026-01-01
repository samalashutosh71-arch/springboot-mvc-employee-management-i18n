package com.ashu.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ashu.vo.EmployeeVo;

public interface IEmployeeManagementService 
{
	public List<EmployeeVo> retriveAllEmployee();
	
	//add employee
	public String registerEmployee(EmployeeVo empVo);
	//
	public EmployeeVo findEmployeeById(int id);
	//edit/update
	public String updateEmployee(EmployeeVo vo);
	//delete
	public String deleteEmployee(int id);
	//pagination
	public Page<EmployeeVo>showEmployeeWithPagination(Pageable pageable);
}
