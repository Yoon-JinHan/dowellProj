package com.dowell.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowell.domain.SampleDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	//DTO로 받는 경우
	@RequestMapping(value="/basic", method= {RequestMethod.GET})
	public String basic(SampleDTO dto) {
		log.info(""+dto);
		return "basic";
	}
		
	//특정 변수로 받는 경우
	@RequestMapping(value="/basic2", method= {RequestMethod.GET})
	public String basic2(@RequestParam("name") String name, @RequestParam("age") int age) {
		log.info("name : " + name);
		log.info("age : " + age);
		return "basic2";
	}
	
	//리스트로 받는 경우->p133 객체 리스트로 받는 경우도 있음
	@RequestMapping(value="/basicList", method= {RequestMethod.GET})
	public String basicList(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids : " + ids);
		return "ex02List";
	}
	
	@RequestMapping(value="/all", method= {RequestMethod.GET})
	public void doAll() {
		log.info("do all can access everybody");
	}
	@RequestMapping(value="/member", method= {RequestMethod.GET})
	public void doMemeber() {
		log.info("logined member");
	}
	@RequestMapping(value="/admin", method= {RequestMethod.GET})
	public void doAdmin() {
		log.info("admin only");
	}
}
