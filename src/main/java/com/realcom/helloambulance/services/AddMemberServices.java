package com.realcom.helloambulance.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.AddMembersUserDao;
import com.realcom.helloambulance.pojo.AddFamilyMembers;
@Repository("addmemberservices")
public class AddMemberServices {
	 @Autowired
	 AddMembersUserDao addusermembersdao;
	public void addMembersUserMethodService(AddFamilyMembers add) {
		
		addusermembersdao.addfamilymembersmethoddao(add);
		
		
	}
	 public int GetId(String Email_Id) {//for foregn key id
		 System.out.println("service"+Email_Id);
	 return addusermembersdao.GetId(Email_Id);
	 }
	public String getUserName(int userid) {
return	addusermembersdao.getUserName(userid);
 		
	}
	
	public List<AddFamilyMembers> listaddmembers(int userid) {
		return	addusermembersdao.listfamilymembers(userid);
		 
		}
	
	
	/********************* mailid exits *********************************************/
	@Transactional
	public Boolean isEmailExist(String emailId,int id) {
		return addusermembersdao.isEmailExist(emailId,id);
	}
	////////////////////****mobile exits/////////////////////////////////////////////////
	@Transactional
	public Boolean isMobileExist(String mobileNumber,int id) {
		return addusermembersdao.isMobileExist(mobileNumber,id);
	}
	public List<AddFamilyMembers> addmembersdetails(String name) {
		return	addusermembersdao.membersdetails(name);
		 
		
	}
	public void UpdateMember(String id) {
		 addusermembersdao.updatememberDao(id);
		
		
	}
	public List<AddFamilyMembers> EditMember(int id) {
		return addusermembersdao.editmemberdetails( id);
	
		
	}
	public void updateMemberprofile(int id,AddFamilyMembers addmember) {
		
		 addusermembersdao.updatedmember(id,addmember);
	}
	 
}