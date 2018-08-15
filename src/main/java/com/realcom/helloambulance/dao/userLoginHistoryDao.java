package com.realcom.helloambulance.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.pojo.UserLoginHistory;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;
@Repository("userloginHistoryDao")
@Transactional
public class userLoginHistoryDao extends CommonDao<Object> {
	
	
	
	public void saveUserHistoryDao(UserLoginHistory userHistory) {

		Object[] userHistoryObj = new Object[] { 
		userHistory.getReg_id(),userHistory.getLogin_time(), userHistory.getIp_address(), userHistory.getAgent(),
		userHistory.getDevice(), userHistory.getBrowser(), userHistory.getSession_id(), userHistory.getMac_address(),userHistory.getVersion_model()
		};
		jdbcTemplate.update(Queries.INSERT_USER_HISTORY, userHistoryObj);
		
	}
		
		
		@SuppressWarnings("deprecation")
		public int GetId(String Email_Id) {
			System.out.println("dao "+Email_Id);
		return jdbcTemplate.queryForInt(Queries.SELECT_USER_ID, Email_Id);
		
		}
		
		public  void UpdateLogout(String time, String session) {
			System.out.println(time+""+session);
			  jdbcTemplate.update(Queries.UPDATE_USER_HISTORY,new Object[] {time,session});
			
			}
}