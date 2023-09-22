package com.iyf.salesledger.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmpPool {

	private long emp_pool_id;
	private String sourcing_manager;
	private String name;
	private String phonenumber;
	private Date birthdate;
	private String email;
	private String address;
	private String education;
	private String school_name;
	private String major;
	private String career_years;
	private String career_field;
	private String career_level;
	private int project_assign;
	private String del;
	private int hope_purchase_unit;
}
