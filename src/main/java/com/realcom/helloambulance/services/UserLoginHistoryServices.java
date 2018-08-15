package com.realcom.helloambulance.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.userLoginHistoryDao;
import com.realcom.helloambulance.pojo.UserLoginHistory;
@Repository("userloginHistoryServices")
@Transactional
public class UserLoginHistoryServices {
	
	@Autowired 
	userLoginHistoryDao userloginHistoryDao;
	
	 @Transactional
	 public void saveLoginUserHistoryServices(UserLoginHistory history)  {
	 userloginHistoryDao.saveUserHistoryDao(history);
	 }
	 public int GetId(String Email_Id) {
		 System.out.println("service"+Email_Id);
	 return userloginHistoryDao.GetId(Email_Id);
	 }

	/* public int GetSId(String session_id) {
		 return userloginHistoryDao.GetSId(session_id);
		 }*/
	public void UpdateLogoutTime(String time, String  session) {
		
		userloginHistoryDao.UpdateLogout(time, session);
			
			}


	}