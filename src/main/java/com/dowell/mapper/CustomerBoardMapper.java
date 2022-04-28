package com.dowell.mapper;

import java.util.List;

import com.dowell.domain.CodeMasterDetailVO;
import com.dowell.domain.CustomerBoardCriteria;
import com.dowell.domain.CustomerBoardVO;
import com.dowell.domain.CustomerChgVO;
import com.dowell.domain.CustomerSearchCriteria;
import com.dowell.domain.PrtSearchCriteria;
import com.dowell.domain.PrtSearchVO;

public interface CustomerBoardMapper {
	public List<CustomerBoardVO> getList(CustomerBoardCriteria cri);
	//public List<CustomerBoardVO> getList(String prtcd);
	public List<CustomerBoardVO> getCustomer(CustomerSearchCriteria cri);
	//public List<PrtSearchVO> getPrtAll();
	public List<PrtSearchVO> getPrt(PrtSearchCriteria cri);
	public List<CustomerChgVO> getCusChg(String no);
	public List<CodeMasterDetailVO> getCMDT();
}
