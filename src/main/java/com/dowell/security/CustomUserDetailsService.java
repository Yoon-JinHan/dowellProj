package com.dowell.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.dowell.domain.UserVO;
import com.dowell.mapper.UserMapper;
import com.dowell.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	//Spring Sequrity의 UserDetailsService를 커스텀한 클래스
	
	@Setter(onMethod_= {@Autowired})
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + username);
		
		UserVO vo=userMapper.read(username);
		
		log.warn("queried by member mapper: " +vo);
		return vo==null? null:new CustomUser(vo);
	}
	
	
}
