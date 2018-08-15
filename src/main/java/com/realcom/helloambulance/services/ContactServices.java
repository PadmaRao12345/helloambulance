package com.realcom.helloambulance.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.ContactDao;
import com.realcom.helloambulance.pojo.ContactUs;

@Repository(value = "contactServices")
@Transactional
public class ContactServices {

	@Autowired
ContactDao contactDao;

@Transactional
public void saveContactUs(ContactUs contact) {
contactDao.saveContactUs(contact);
}

@Transactional
public void ListOfContactUs(ContactUs contact) {
	contactDao.ListOfContactUs(contact);

}

// to get the userDao list
@Transactional
public List<ContactUs> list() {
	return contactDao.list();
}

// to get the no.ofRecords from userDao.
public int getNoOfRecords() {
	return contactDao.getNoOfRecords();
}

//Rakesh
public Map<String, Object> getContact(String contactID) {
	return contactDao.getContact(contactID);
}

//update message in contactUs(Admin)
		@Transactional
		public void updateMessageByEmail(String contact_id, String message) {

			contactDao.updateMessageByEmail(contact_id, message);
		}
		// ContactID verification
		public Boolean getrecordbyemailid(String email_id) {
					return contactDao.getrecordbyemailid(email_id);
				}
}

//end Rakesh





