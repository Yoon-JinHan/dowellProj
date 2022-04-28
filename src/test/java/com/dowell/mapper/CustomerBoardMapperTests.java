package com.dowell.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dowell.domain.CustomerBoardCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CustomerBoardMapperTests {
	@Setter(onMethod_=@Autowired)
	private CustomerBoardMapper mapper;
	/*
	 * @Test public void testGetList() {
	 * mapper.getList("B0000002").forEach(board->log.info(board)); }
	 */
	
	@Test
	public void testGetList() {
		CustomerBoardCriteria cri=new CustomerBoardCriteria();
		
		cri.setState("0");
		cri.setStart("20220421");
		cri.setEnd("20220428");
		cri.setPrtcd("B0000004");

		mapper.getList(cri).forEach(board->log.info(board));
		
	}
}
