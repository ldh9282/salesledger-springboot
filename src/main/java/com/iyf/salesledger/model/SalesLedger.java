package com.iyf.salesledger.model;

import lombok.Data;

@Data
public class SalesLedger {

	private long sales_id;
	private Long emp_id;
	private String tech_support;
	private String extra_expense;
	private long extra_expense_amount;
	private String emp_type;
	private String individual_business;
	private String modifier;
	private int payday;
	private String del;
	private String include;
	
}
