package com.dowell.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerVO {
	String cust_no;			//고객번호
	String cust_nm;			//고객명
	String sex_cd;			//성별코드
	String scal_yn;			//양음력구분
	String brdy_dt;			//생년월일
	String mrrg_dt;			//결혼기념일
	String poc_cd;			//직업코드
	String mbl_no;			//휴대폰번호
	String psmt_grc_cd;		//우편물 수령 코드
	String email;			//이메일 주소
	String zip_cd;			//우편번호 코드
	String addr;			//주소
	String addr_dtl;		//상세주소
	String cust_ss_cd;		//고객상태코드
	String cncl_cnts;		//해지사유내용
	String jn_prt_cd;		//가입매장코드
	String email_rcv_yn;	//이메일 수신 동의 여부
	String sms_rcv_yn;		//SMS 수신 동의 여부
	String tm_rcv_yn;		//TM 수신 동의 여부
	String dm_rcv_yn;		//DM 수신 동의 여부
	String fst_js_dt;		//최초 가입 일자
	String js_dt;			//가입 일자
	String stp_dt;			//중지 일자
	String cncl_dt;			//해지 일자
	Date fst_reg_dt;		//최초 등록 일자
	String fst_user_id;		//최초 등록자
	Date lst_upd_dt;		//최종 수정 일자
	String lst_upd_id;		//최종 수정자
	
}
