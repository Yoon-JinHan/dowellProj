package com.dowell.domain;
import lombok.Data;

//매장 조회 VO

@Data
public class PrtSearchVO {
	String cd;			//매장코드
	String name;		//매장명
	String state;		//매장상태
}
