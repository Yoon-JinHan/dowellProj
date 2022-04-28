package com.dowell.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.dowell.domain.CodeMasterDetailVO;
import com.dowell.domain.CustomerBoardCriteria;
import com.dowell.domain.CustomerBoardVO;
import com.dowell.domain.CustomerChgVO;
import com.dowell.domain.CustomerSearchCriteria;
import com.dowell.domain.PrtSearchCriteria;
import com.dowell.domain.PrtSearchVO;
import com.dowell.mapper.CustomerBoardMapper;
import com.dowell.util.CustomerUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CustomerBoardServiceImpl implements CustomerBoardService{
	private CustomerBoardMapper mapper;
	
	//고객 리스트 가져오는 service
	@Override
	public List<CustomerBoardVO> getList(CustomerBoardCriteria cri) {
		
		return mapper.getList(cri);
	}
	/*
	public List<CustomerBoardVO> getList(String prtcd) {
		log.info("get........"+prtcd);
		return mapper.getList(prtcd);
	}
	*/
	//고객 조회하는 service
	@Override
	public List<CustomerBoardVO> getCustomer(CustomerSearchCriteria cri){
		log.info("get customerList");
		return mapper.getCustomer(cri);
	}
	
	//매장 조회하는 service
	@Override
	public List<PrtSearchVO> getPrt(PrtSearchCriteria cri) {
		log.info("get prtList");
		return mapper.getPrt(cri);
	}
	
	//MA_CODE_DT의 데이터를 가져오는 service
	@Override
	public List<CodeMasterDetailVO> getCMDT() {
		return mapper.getCMDT();
	}
	
	//고객변경 이력 조회하는 service
	@Override
	public List<CustomerChgVO> getCusChg(String cusno) {
		List<CodeMasterDetailVO> cmdtList=getCMDT();
		List<CustomerChgVO> cusChgList=mapper.getCusChg(cusno);
		
		//변경항목에 따른 변경전, 변경후 값 처리
		for(int i=0; i<cusChgList.size();i++) {
			for(int j=0; j<cmdtList.size();j++) {
				//변경항목과 MA_CODE_DT의 CODE_CD 비교
				if(cusChgList.get(i).getChgcd().equals(cmdtList.get(j).getCode())) {
					//변경전, 변경후 값과 MA_CODE_DT의 DTL_CD 비교
					if(cusChgList.get(i).getBefore().equals(cmdtList.get(j).getDtl())) {
						//같다면 값을 변경
						String s=cmdtList.get(j).getDtlnm();
						cusChgList.get(i).setBefore(s);
					}
					if(cusChgList.get(i).getAfter().equals(cmdtList.get(j).getDtl())) {
						String s=cmdtList.get(j).getDtlnm();
						cusChgList.get(i).setAfter(s);
					}
				}
				//휴대폰 번호를 형식에 맞게 변경
				else if(cusChgList.get(i).getChgcd().equals("MBL_NO")) {
					String mblFormB=cusChgList.get(i).getBefore();
					String mblFormA=cusChgList.get(i).getAfter();
					cusChgList.get(i).setBefore(CustomerUtil.mbl(mblFormB));
					cusChgList.get(i).setAfter(CustomerUtil.mbl(mblFormA));
				}
			}
		}
		return cusChgList;
	}

}
