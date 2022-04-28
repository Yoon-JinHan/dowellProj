package com.dowell.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CustomerBoardServiceTests {
	@Setter(onMethod_= {@Autowired})
	private CustomerBoardService service;

	/*
	 * @Test public void testExist() { log.info(service); assertNotNull(service); }
	 * 
	 * @Test public void testGetList() { log.info(service.getList("B0000001")); }
	 */
	@Test
	public void testGetChg() {
		log.info(service.getCusChg("1000000211"));
	}
}
