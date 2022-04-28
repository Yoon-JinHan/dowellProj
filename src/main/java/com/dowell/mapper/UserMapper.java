package com.dowell.mapper;

import com.dowell.domain.UserVO;

public interface UserMapper {
	//Mapper 인터페이스
	public UserVO read(String user_id);
}
