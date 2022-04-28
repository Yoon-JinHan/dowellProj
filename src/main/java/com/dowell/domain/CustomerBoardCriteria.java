package com.dowell.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerBoardCriteria {
	private String prtcd;				//유저 매장코드
	private String cusprt;				//고객 매장코드
	private String cusno;				//고객번호
	private String state;				//상태코드
	private String start;				//가입일 기간 시작
	private String end;					//가입일 기간 끝
	
}
