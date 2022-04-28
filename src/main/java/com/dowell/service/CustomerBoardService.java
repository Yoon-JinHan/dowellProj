package com.dowell.service;

import java.util.List;

import com.dowell.domain.CodeMasterDetailVO;
import com.dowell.domain.CustomerBoardCriteria;
import com.dowell.domain.CustomerBoardVO;
import com.dowell.domain.CustomerChgVO;
import com.dowell.domain.CustomerSearchCriteria;
import com.dowell.domain.PrtSearchCriteria;
import com.dowell.domain.PrtSearchVO;

public interface CustomerBoardService {
	public List<CustomerBoardVO> getList(CustomerBoardCriteria cri);//고객명단 조회
	//public List<CustomerBoardVO> getList(String prtcd);//고객명단 조회
	public List<CustomerBoardVO> getCustomer(CustomerSearchCriteria cri);//고객 조회	
	public List<PrtSearchVO> getPrt(PrtSearchCriteria cri);//매장 조회
	public List<CustomerChgVO> getCusChg(String cusno);//고객변경이력 조회
	public List<CodeMasterDetailVO> getCMDT();//MA_CODE_DT 조회
}
