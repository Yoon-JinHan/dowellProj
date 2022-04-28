package com.dowell.domain;

import lombok.Data;

@Data
public class CodeMasterDetailVO {
	//MA_CODE_DT 테이블용 VO
	private String code;		//코드
	private String dtl;			//세부코드
	private String dtlnm;		//세부코드명
}
