package com.ashu.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Data
public class EmployeeVo 
{
	//data
	private Integer eid;
	@NonNull
	private String ename;
	@NonNull
	private String category;
	@NonNull
	private String role;
	@NonNull
	private Double salary;

}
