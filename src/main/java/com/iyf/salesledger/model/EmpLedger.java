package com.iyf.salesledger.model;

import java.util.Date;

import lombok.Data;

@Data
public class EmpLedger {

	private long emp_id;
    private Long emp_pool_id;
    private String company; // 소속
    private String department; // 부서
    private Date assign_date;
    private Date end_date;
    private double sales_mm;
    private double purchase_mm;
    private long sales_unit;
    private long purchase_unit;
    private String comments;
    private Date resume_submit_date;
    private Date resign_date;
    private Date i_contract_date;
    private Date c_contract_date;
    private String progress;
    private String progress_reason;
    private String issues;
    private String del;
    private String site; // 사이트명
    private String client; // 진행업체
    private String project_name; // 프로젝트명
    private String brief; // 적요란
    
}
