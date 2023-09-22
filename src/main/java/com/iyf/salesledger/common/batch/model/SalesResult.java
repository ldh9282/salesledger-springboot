package com.iyf.salesledger.common.batch.model;

import lombok.Data;

@Data
public class SalesResult {

	private long sales_result_id;
	private long total_sales_amount;
	private long total_purchase_amount;
	private String site;
	private String client;
	private String brief;
	private String project_name;
	private String batch_month;
	private String company;
	private String department;
	private String handwrite;
}
