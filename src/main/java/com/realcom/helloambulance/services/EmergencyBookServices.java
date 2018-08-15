package com.realcom.helloambulance.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.dao.EmergencyBookDao;
import com.realcom.helloambulance.pojo.EmergencyBook;
@Repository("emergencybookservices")
public class EmergencyBookServices {
@Autowired
EmergencyBookDao emergencybookdao;
	public void emergencybook(EmergencyBook emergencybook) {
		// TODO Auto-generated method stub
		
		emergencybookdao.emergencybook(emergencybook);
		
	}
	
	
	
	 

}
