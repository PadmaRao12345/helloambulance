package com.realcom.helloambulance.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.dao.LocationDao;
import com.realcom.helloambulance.pojo.EmergencyBook;

@Repository(value = "locationservices")
public class LocationServices {
@Autowired
LocationDao locationDao;
	/*public void LatLon(EmergencyBook emergencybook) {
		
		 System.out.println(emergencybook +"current location services");
		
		 locationDao.LatLon(emergencybook);
	}*/
	/*public Boolean GetId(int id) {
		return locationDao.GetId(id);
		
	
		
		
	}*/
	public void LatLon(EmergencyBook emergencybook, String session) {
		// TODO Auto-generated method stub

		 System.out.println(emergencybook +"current location services");
		
		 locationDao.LatLon(emergencybook,session);
		
	}
	
	

	

}
