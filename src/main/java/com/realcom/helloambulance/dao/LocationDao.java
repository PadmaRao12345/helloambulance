package com.realcom.helloambulance.dao;





import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.EmergencyBook;


import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository(value = "locationDao")
public class LocationDao  extends CommonDao<Object>{

	
	public  void LatLon(EmergencyBook emergencybook,String session) {
		Object[] obj=new Object[] {
			emergencybook.getLatitude(),emergencybook.getLongitude(),session};
			
			
			
		
		
		jdbcTemplate.update(Queries.update_in_EmergencyBook_emergencybook_current_location_lat_lon_values,obj);
		
		System.out.println(obj+"current location dao");
	}

/*	public Boolean GetId(int id) {
		Integer count=jdbcTemplate.queryForObject(Queries.Select_user_id_exist_or_not_from_emergency_book,Integer.class,id);
		if(count==1) {
			return true;
			
		}else {
		return false;
		}
	}*/

	
	

	
}
