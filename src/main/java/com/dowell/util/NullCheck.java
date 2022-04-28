package com.dowell.util;

import org.springframework.util.StringUtils;

public class NullCheck {

	public NullCheck() {
	}
	
	public static boolean isNull(String str) {
		return StringUtils.isEmpty(str);
	}
}
