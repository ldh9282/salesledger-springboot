package com.iyf.salesledger.common.batch.model;

import lombok.Data;

@Data
public class SalesResultInfra {

	private long sales_result_infra_id;
	private long total_sales_amount;
	private long total_purchase_amount;
	private String client;
	private String brief;
	private String batch_month;
	private String company;
	private String department;
	private String date;
	private String email;
	private String business_reg_num;
	private String note;
	private String category;
	private String handwrite;
}
