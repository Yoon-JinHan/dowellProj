package com.dowell.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerBoardVO {
	private String no;			//고객번호
	private String name;		//고객명
	private String mbl;			//휴대폰번호
	private String state;		//고객상태
	private String statecd;		//고객상태코드
	private String joindt;		//가입일
	private String prt;			//가입매장
	private String prtcd;		//가입매장 코드
	private String reg;			//등록자
	private Date upd;			//최종수정일
}
