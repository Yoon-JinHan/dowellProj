package com.dowell.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerChgVO {
	//고객변경 이력 VO
	private String cusno;		//고객번호
	private String name;		//고객명
	private String chgdt;		//변경일자
	private String chgcd;		//변경항목 코드
	private String chgnm;		//변경항목명
	private String before;		//변경전
	private String after;		//변경후
	private String userid;		//수정자ID
	private String uname;		//수정자 이름
	private Date regdt;			//수정일시
}
