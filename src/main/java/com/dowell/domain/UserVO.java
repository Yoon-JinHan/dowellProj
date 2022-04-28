package com.dowell.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//사용자 VO
	private String user_id;					//사용자 아이디
	private String user_nm;					//사용자 이름
	private String use_pwd;					//비밀번호
	private String st_dt;					//시작일
	private String ed_dt;					//종료일
	private String prt_cd;					//거래처코드
	private String prt_nm;					//거래처 이름
	private String pwd_upd_dt;				//비밀번호 업데이트일
	private Date fst_reg_dt;				//최초등록일
	private String fst_user_id;				//최초등록자
	private Date lst_upd_dt;				//최종수정일
	private String lst_upd_id;				//최종수정자
	private boolean enabled;				//사용여부 boolean
	private String auth;					//권한
	private List<AuthVO> authList;			//권한 리스트 : 사용자 구분코드가 1->ROLE_ADMIN 2->ROLE_USER
}
