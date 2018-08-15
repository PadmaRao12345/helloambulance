package com.realcom.helloambulance.dao;

import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.EmergencyBook;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;
@Repository("emergencybookdao")
public class EmergencyBookDao extends CommonDao<Object> {

	public void emergencybook(EmergencyBook emergencybook) {
		System.out.println("dao"+emergencybook.getAddress());
		Object[] obj=new Object[] {
				emergencybook.getUser_id(),emergencybook.getAddress(),emergencybook.getStreet(),emergencybook.getCity(),emergencybook.getState(),emergencybook.getZipcode(),emergencybook.getCountry(),emergencybook.getMobile(),emergencybook.getDate(),emergencybook.getSession_id()
			
		};
		
		jdbcTemplate.update(Queries.INSERT_INTO_EMERGENCY_BOOK,obj);
	}
	

}
