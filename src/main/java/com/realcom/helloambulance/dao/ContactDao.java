package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.ContactUs;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository(value="contactDao")
public class ContactDao extends CommonDao<Object> {

public void saveContactUs(ContactUs contact) {
Object[] obj = new Object[] {contact.getName(),contact.getEmail(),contact.getMessage(),contact.getDate_of_message() };
jdbcTemplate.update(Queries.SAVE_CONTACT_US, obj);
}
public void ListOfContactUs(ContactUs contact) {
	Object[] obj = new Object[] { contact.getContact_id(),contact.getName(),contact.getEmail(),contact.getMessage(),contact.getDate_of_message()};
	jdbcTemplate.update(Queries.LIST_OF_CONTACT_US, obj);
}
 int noOfRecords;

public List<ContactUs> list() {
List<ContactUs> list = jdbcTemplate.query(Queries.LIST_OF_CONTACT_US,
new RowMapper<ContactUs>() {

@Override
public ContactUs mapRow(ResultSet rs, int rowNum) throws SQLException {
	ContactUs contact = new ContactUs();
	contact.setContact_id(rs.getInt("contact_id"));
	contact.setName(rs.getString("name"));
	contact.setEmail(rs.getString("email_id"));
	contact.setMessage(rs.getString("message"));
	contact.setDate_of_message(rs.getString("date_of_message"));
return contact;	
	
}
});
noOfRecords = list.size();
return list;
}

public int getNoOfRecords() {
return noOfRecords;
}

//Rakesh
//ContactUs Details  for viewProfile
@SuppressWarnings("unchecked")
public Map<String, Object> getContact(String contactID) {
	SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.JQGRID_USER_CONTACTS);
	Map<String, Object> rs = jdbcCall.execute(contactID);
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
	return map;
}

//update message in contactUs (Admin)
		public void updateMessageByEmail(String contact_id, String message) {
			Object[] obj = new Object[] { message, contact_id };
			jdbcTemplate.update(Queries.UPDATE_MESSAGE_CONTACTUS, obj);
		}
		  //ContactID verification
		public Boolean getrecordbyemailid(String email_id) {
			Integer count = jdbcTemplate.queryForObject(Queries.GET_RECORD_STATUS_BY_EMAILID,Integer.class,email_id);
		
		if(count==1)
			return true;
		else 
			return false;
		}
		
		//Fetching data from userside for contactUs
		public String fetchingDataForContactUs(String message,String email_id) {
			Object[] obj=new Object[] {message,email_id};
				jdbcTemplate.update(Queries.GET_MESSAGE_FROM_USERSIDE,obj);
				return email_id;
		}
		// update message in contactUs (User)
		public void updateMessageByEmailFromUserSide(String message,String email_id) {
			Object[] obj = new Object[] {message, email_id };
			jdbcTemplate.update(Queries. UPDATE_MESSAGE_FROM_USER, message,email_id);
		}
		//End Rakesh
}
