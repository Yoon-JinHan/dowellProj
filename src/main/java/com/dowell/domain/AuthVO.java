package com.dowell.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class AuthVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//권한 VO
	private String user_id;
	private String auth;
}
