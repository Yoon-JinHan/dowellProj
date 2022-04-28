package com.dowell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowell.domain.CustomerBoardCriteria;
import com.dowell.domain.CustomerSearchCriteria;
import com.dowell.domain.PrtSearchCriteria;
import com.dowell.service.CustomerBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/*")
@AllArgsConstructor
public class CustomerBoardController {
	private CustomerBoardService service;
	
	//고객 리스트 출력
	@GetMapping("/list")
	public void list(CustomerBoardCriteria cri, Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(cri));
	}
	
	/*
	public void list(@RequestParam("prtcd") String prtcd, Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(prtcd));
	}
	*/
	
	//고객조회 팝업
	@GetMapping("/cusPopup")
	public void customerPopup(CustomerSearchCriteria cri, Model model) {
		log.info("open popup");
		model.addAttribute("customer",service.getCustomer(cri));
	}
	
	//매장조회 팝업
	@GetMapping("/prtPopup")
	public void prtPopup(PrtSearchCriteria cri, Model model) { 
		log.info("prt");
		model.addAttribute("prt",service.getPrt(cri));
	}
	
	//고객 변경이력 팝업
	@GetMapping("/chgPopup")
	public void chgPopup(@RequestParam("cusno")String cusno, Model model) {
		model.addAttribute("chg",service.getCusChg(cusno));
	}
}
