package com.iyf.salesledger.common.board.model;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private long board_id;
    private String board_type;
    private String board_title;
    private String board_content;
    private String del;
    private String system_creator;
    private String system_modifier;
    private String system_created_at;
    private String system_modified_at;
}
