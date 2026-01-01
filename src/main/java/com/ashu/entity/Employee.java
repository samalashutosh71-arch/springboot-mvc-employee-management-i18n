package com.ashu.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Version;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@Table(name = "employee_management")
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class Employee 
{
	//data
	@Id
	@SequenceGenerator(name="seq1",sequenceName = "employee_seq",allocationSize = 1,initialValue = 1005)
	@GeneratedValue(generator = "seq1",strategy = GenerationType.SEQUENCE)
	private Integer eid;
	
	@Column(length = 30)
	@NonNull
	
	private String ename;
	@Column(length = 30)
	@NonNull
	
	private String category;
	@Column(length = 30)
	@NonNull
	private String role;
	
	@Column
	@NonNull
	private Double salary;
	
	//meta data
	@CreationTimestamp
	private LocalDateTime joiningDate;
	@UpdateTimestamp
	private LocalDateTime updatedOn;
	@Version
	private Integer updateCount;
	@Column(length = 30)
	private String createdBy;
	@Column(length = 30)
	private String updatedBy;
	
	

}
