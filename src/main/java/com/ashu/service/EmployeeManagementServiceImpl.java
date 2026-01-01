package com.ashu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ashu.Exception.EmployeeNotFoundException;
import com.ashu.entity.Employee;
import com.ashu.repositary.IEmployeeRepositary;
import com.ashu.vo.EmployeeVo;
@Service
public class EmployeeManagementServiceImpl implements IEmployeeManagementService
{

	@Autowired
	private IEmployeeRepositary employeeRepo;

	@Override
	public List<EmployeeVo> retriveAllEmployee() 
	{
		//here i take view bcoz i have to show only data not the metadata
		
		//use repo
		List<Employee> listEntities = employeeRepo.findAll();
		//convert list entities to listVo
		List<EmployeeVo>listVo=new ArrayList<>();
		
		listEntities.forEach(entity->{
			EmployeeVo vo=new EmployeeVo();
			//use direct method
			BeanUtils.copyProperties(entity, vo);
			//then add this vo object to list
			listVo.add(vo);
		});
		return listVo;

	}
	@Override
	public String registerEmployee(EmployeeVo empVo) {
		Employee emp=new Employee();
		//convert vo to emp
		BeanUtils.copyProperties(empVo, emp);
		//set created by
		emp.setCreatedBy(System.getProperty("os.name"));
		//use repo
		Integer eid = employeeRepo.save(emp).getEid();
	
		return "employee register with eid "+eid;
	}
	
	//findByid
	@Override
	public EmployeeVo findEmployeeById(int id) 
	{
		//Employee emp= employeeRepo.findById(id).orElseThrow(()->new EmployeeNotFoundException("Invalid id"));
		Employee emp = employeeRepo.findById(id).orElseThrow(()->new IllegalArgumentException("invaild id"));

		EmployeeVo empVo=new EmployeeVo();
		//convert emp to vo
		BeanUtils.copyProperties(emp, empVo);
		
		return empVo;
	}
	@Override
	public String updateEmployee(EmployeeVo vo) 
	{
		//Employee emp=employeeRepo.findById(vo.getEid()).orElseThrow(()->new EmployeeNotFoundException("invalid id"));
		Employee emp = employeeRepo.findById(vo.getEid()).orElseThrow(()->new IllegalArgumentException("invaild id"));

		//convert vo class object data to entity object
		//may be its for convert collecting new data from form page to existing data
		BeanUtils.copyProperties(vo, emp);
		employeeRepo.save(emp);
		
		return "employee update with id "+emp.getEid();
	}

	//delete
	@Override
	public String deleteEmployee(int id)
	{
		//Employee emp = employeeRepo.findById(id).orElseThrow(()->new EmployeeNotFoundException("invaild id"));
		Employee emp = employeeRepo.findById(id).orElseThrow(()->new IllegalArgumentException("invaild id"));
		employeeRepo.delete(emp);
		
		return "employee deleted with id: "+emp.getEid();
	}
	
	@Override
	public Page<EmployeeVo> showEmployeeWithPagination(Pageable pageable) 
	{
		Page<Employee> pageEntity= employeeRepo.findAll(pageable);
		//convert list of entity to list of vo
		List<EmployeeVo>listVo=new ArrayList<EmployeeVo>();
		List<Employee> listEntity = pageEntity.getContent();
		listEntity.forEach(entity->
		{
			EmployeeVo vo=new EmployeeVo();
			BeanUtils.copyProperties(entity, vo);
			//then add this obj  to list
			listVo.add(vo);
		
		});
		
		//convert page<Emloyee> obj to page<Empvo>obj
		//getting actorRepo.count becoz all the record from table will come
		Page<EmployeeVo>pageVo=new PageImpl<EmployeeVo>(listVo, pageable, employeeRepo.count());
		
		
		//vo with pagination
		return pageVo;
	}

}
