package com.ashu.repositary;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ashu.entity.Employee;

public interface IEmployeeRepositary extends JpaRepository<Employee, Integer> {

}
