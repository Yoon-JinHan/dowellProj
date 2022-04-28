package com.dowell.util;

public class CustomerUtil {
	
	public CustomerUtil() {
	}

	//매장번호 앞자리 가져오기
	public static String checkPrtcd(String prtcd) {
		String s="";
		s=prtcd.trim().substring(0,1);
		return s;
	}
	
	//전화번호 형식 만들기
	public static String mbl(String src) {
		if(src==null) {
			return "";
		}
		if(src.length()==8) {
			return src.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
		}else if(src.length()==12) {
			return src.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
		}else if(src.length()==11) {
			return src.replaceFirst("(^[0-9]{3})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
		}else {
			return src.replaceFirst("(^[0-9]{2})([0-9]{4})([0-9]{4,})$", "$1-$2-$3");
		}
	}
}
