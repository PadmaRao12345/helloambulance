package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.AddFamilyMembers;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;
@Repository("addusermembersdao")
public class AddMembersUserDao  extends CommonDao<Object> {
	
	public void addfamilymembersmethoddao(AddFamilyMembers addmember  ) {
		 Object[] obj=new Object[] {
				 
				 addmember.getUser_id(),addmember.getRelation_type(),addmember.getName(),addmember.getGender(),addmember.getDate_of_birth(),
				 addmember.getMobile_number(),addmember.getEmail_id(),addmember.getBlood_group(),addmember.getWilling_to_donate_blood(),
				 addmember.getNotify_blood_request(),addmember.getLast_donated_date(),addmember.getWilling_to_donate_organs(),addmember.getAddress(),
				 addmember.getCountry(),addmember.getState(),addmember.getCity(),addmember.getPincode(),addmember.getDesignation(),addmember.getMarital_status(),
				 addmember.getFood_habit(),addmember.getDate_of_register()};
				 
				 jdbcTemplate.update(Queries.SAVE_Add_family_Members_FORM, obj);
				 
				 
	}

	@SuppressWarnings("deprecation")
		public int GetId(String Email_Id) {//for foregn key id
			System.out.println("dao "+Email_Id);
		return jdbcTemplate.queryForInt(Queries.SELECT_USER_ID, Email_Id);
		
		}

	public String  getUserName(int userid) {
	return	jdbcTemplate.queryForObject(Queries.GET_USER_NAME_FROM_USER_REGISTRATION, String.class, userid);
		
	}
				 

	public List<AddFamilyMembers>  listfamilymembers(int userid) {
	//return	jdbcTemplate.queryForList(Queries.LIST_OF_ADD_MEMBERS, userid);
		List<AddFamilyMembers> nameList = jdbcTemplate.query(Queries.LIST_OF_ADD_MEMBERS,
			
				new RowMapper<AddFamilyMembers>() {

					@Override
					public AddFamilyMembers mapRow(ResultSet rs, int rowNum) throws SQLException {
AddFamilyMembers addFamilyMembers = new AddFamilyMembers();
						addFamilyMembers.setName(rs.getString(1));
						addFamilyMembers.setFamily_member_id(rs.getInt(2));
						
						return addFamilyMembers;
					}
				},userid
			);
		
		return nameList;
		
	}
	
/*************************  email already exits ******************************/
	public Boolean isEmailExist(String emailId,int id) {
		Integer count = jdbcTemplate.queryForObject(Queries.SELECT_EMAIL_EXIST_ADDMEMBERS, Integer.class, emailId,id);
	   if(count==1) {
		   return true;
	   }else 
	   {
		   return false;
	   }
		}
	/*************************  mobile already exits ******************************/
	public Boolean isMobileExist(String mobileNumber,int id ) {
		Integer count = jdbcTemplate.queryForObject(Queries.SELECT_EMAIL_EXIST_ADDMEMBERS, Integer.class, mobileNumber,id);
	   if(count==1) {
		   return true;
	   }else 
	   {
		   return false;
	   }
		}

	public List<AddFamilyMembers> membersdetails(String name) {
		List<AddFamilyMembers> addmembersdetails = jdbcTemplate.query(Queries.DETAILS_OF_ADD_MEMBERS,
				
				new RowMapper<AddFamilyMembers>() {

					@Override
					public AddFamilyMembers mapRow(ResultSet rs, int rowNum) throws SQLException {
AddFamilyMembers addFamilyMembers1 = new AddFamilyMembers();
						addFamilyMembers1.setFamily_member_id(rs.getInt(1));
						/*addFamilyMembers.setUser_id(rs.getInt(2));*/
						
						String relationtype = rs.getString("relation_type");
						if(relationtype.equals("0"))
						addFamilyMembers1.setRelation_type("Friend");
						
						if(relationtype.equals("1"))
							addFamilyMembers1.setRelation_type("Family");
						
						addFamilyMembers1.setName(rs.getString("name"));
						
						String gender = rs.getString("gender");
						if(gender.equals("0"))
						addFamilyMembers1.setGender("male");
						if(gender.equals("1"))
							addFamilyMembers1.setGender("female");
						if(gender.equals("2"))
							addFamilyMembers1.setGender("others");
						
						addFamilyMembers1.setDate_of_birth(rs.getString("date_of_birth"));
						addFamilyMembers1.setMobile_number(rs.getString("mobile_number"));
						addFamilyMembers1.setEmail_id(rs.getString("email_id"));
						addFamilyMembers1.setBlood_group(rs.getString(17));
						
						String willingtodonateblood = rs.getString("willing_to_donate_blood");
						if(willingtodonateblood.equals("1"))
						addFamilyMembers1.setWilling_to_donate_blood("yes");
						if(willingtodonateblood.equals("0"))
							addFamilyMembers1.setWilling_to_donate_blood("no");
						
						String bloodrequest = rs.getString("notify_blood_request");
						if(bloodrequest.equals("1"))
						addFamilyMembers1.setNotify_blood_request("yes");
						if(bloodrequest.equals("0"))
							addFamilyMembers1.setNotify_blood_request("no");
							
						
						addFamilyMembers1.setLast_donated_date(rs.getString("last_donated_date"));
						
						String willingtodonateorgans = rs.getString("willing_to_donate_organs");
						if(willingtodonateorgans.equals("1"))
						addFamilyMembers1.setWilling_to_donate_organs("yes");
						if(willingtodonateorgans.equals("0"))
							addFamilyMembers1.setWilling_to_donate_organs("no");
						addFamilyMembers1.setAddress(rs.getString("address"));
						addFamilyMembers1.setCountry(rs.getString(18));
						addFamilyMembers1.setState(rs.getString(19));
						addFamilyMembers1.setCity(rs.getString(20));
						addFamilyMembers1.setPincode(rs.getString("pincode"));
						addFamilyMembers1.setDesignation(rs.getString("designation"));
						
						String marital_status = rs.getString("marital_status");
						if(marital_status.equals("0"))
						addFamilyMembers1.setMarital_status("single");
						if(marital_status.equals("1"))
							addFamilyMembers1.setMarital_status("maried");
						
						addFamilyMembers1.setFood_habit(rs.getString("food_habit"));
						/*addFamilyMembers.setDate_of_register(rs.getString(22));*/
						
						
						return addFamilyMembers1;
					}
				},name
			);
		
		return addmembersdetails;
		
	}

	public  void updatememberDao(String id) {
		
			jdbcTemplate.update(Queries.DELETE_MEMBER_FROM_FAMILYMEMBER, id);
		
		
	}

	public List<AddFamilyMembers> editmemberdetails(int id) {
		
		List<AddFamilyMembers> AddFamilyMembers=jdbcTemplate.query(Queries.DETAILS_OF_ADD_MEMBERS, new 
				
				RowMapper<AddFamilyMembers>(){

					@Override
					public AddFamilyMembers mapRow(ResultSet rs, int rowNum) throws SQLException {
						 AddFamilyMembers addFamilyMembers2 = new AddFamilyMembers();
						 addFamilyMembers2.setFamily_member_id(rs.getInt(1));
						// member.setUser_id(rs.getInt(2));
							
							String relationtype = rs.getString("relation_type");
							if(relationtype.equals("0"))
								addFamilyMembers2.setRelation_type("Friend");
							
							if(relationtype.equals("1"))
								addFamilyMembers2.setRelation_type("Family");
							
							addFamilyMembers2.setName(rs.getString("name"));
							
							String gender = rs.getString("gender");
							if(gender.equals("0"))
								addFamilyMembers2.setGender("male");
							if(gender.equals("1"))
								addFamilyMembers2.setGender("female");
							if(gender.equals("2"))
								addFamilyMembers2.setGender("others");
							
							addFamilyMembers2.setDate_of_birth(rs.getString("date_of_birth"));
							addFamilyMembers2.setMobile_number(rs.getString("mobile_number"));
							addFamilyMembers2.setEmail_id(rs.getString("email_id"));
							addFamilyMembers2.setBlood_group(rs.getString(17));
							
						
								addFamilyMembers2.setWilling_to_donate_blood(rs.getString("willing_to_donate_blood"));
							
							
							
								addFamilyMembers2.setNotify_blood_request(rs.getString("notify_blood_request"));
							
								
							
							addFamilyMembers2.setLast_donated_date(rs.getString("last_donated_date"));
							
							
								addFamilyMembers2.setWilling_to_donate_organs(rs.getString("willing_to_donate_organs"));
							
							addFamilyMembers2.setAddress(rs.getString("address"));
							addFamilyMembers2.setCountry(rs.getString(18));
							addFamilyMembers2.setState(rs.getString(19));
							addFamilyMembers2.setCity(rs.getString(20));
							addFamilyMembers2.setPincode(rs.getString("pincode"));
							addFamilyMembers2.setDesignation(rs.getString("designation"));
							
							String marital_status = rs.getString("marital_status");
							if(marital_status.equals("0"))
								addFamilyMembers2.setMarital_status("single");
							if(marital_status.equals("1"))
								addFamilyMembers2.setMarital_status("maried");
							
							addFamilyMembers2.setFood_habit(rs.getString("food_habit"));
							//member.setDate_of_register(rs.getString(22));
							
							
						return addFamilyMembers2;
					}
		
		},id
		);
		return AddFamilyMembers ;
		
		
		
	}

	public void updatedmember(int id,AddFamilyMembers addmember) {
 Object[] obj=new Object[] {
				 
		 addmember.getRelation_type(),addmember.getName(),addmember.getGender(),addmember.getDate_of_birth(),
		 addmember.getMobile_number(),addmember.getEmail_id(),addmember.getWilling_to_donate_blood(),
		 addmember.getNotify_blood_request(),addmember.getLast_donated_date(),addmember.getWilling_to_donate_organs(),addmember.getAddress(),
		addmember.getDesignation(),addmember.getMarital_status(), addmember.getPincode(),
		 addmember.getFood_habit(),id};
				 jdbcTemplate.update(Queries.SAVE_UPDATED_Add_family_Members_FORM, obj);
				 
		System.out.println("updated"+obj);
		
		
	}
	
		
		
	}