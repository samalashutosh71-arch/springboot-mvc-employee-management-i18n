package com.ashu.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NO_CONTENT)
public class EmployeeNotFoundException extends RuntimeException
{
	
	public EmployeeNotFoundException() {
		super();
	}
	public EmployeeNotFoundException(String msg) {
		super(msg);
	}
	
	

}
