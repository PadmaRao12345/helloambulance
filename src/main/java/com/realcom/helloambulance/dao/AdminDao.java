package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.realcom.helloambulance.pojo.AddFamilyMembers;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.ContactUs;
import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecailization;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.MainpageSlides;
import com.realcom.helloambulance.pojo.RegistorType;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository
public class AdminDao extends CommonDao<Object> {

	// ............................. EQUIPMENTS LIST.................................//

	public void ListOfEquipments(Equipments equipments) {
		System.out.println(equipments);
		Object[] obj = new Object[] { equipments.getEquipment_name() };
		jdbcTemplate.update(Queries.LIST_OF_EQUIPMENTS, obj);
	}

	public List<Equipments> list1() {
		List<Equipments> equipment = jdbcTemplate.query(Queries.LIST_OF_EQUIPMENTS, new RowMapper<Equipments>() {
			@Override
			public Equipments mapRow(ResultSet rs, int rowNum) throws SQLException {
				Equipments equipments = new Equipments();
				// equipments.setEquipments_id(rs.getInt(1));
				equipments.setEquipment_name(rs.getString(2));
				return equipments;
			}
		});
		return equipment;
	}
	// ............ EQUIPMENTS INSERT,EDIT AND DELETE .............//

	// insert equipments
	public void insertEquipment(Equipments equipments) {
		System.out.println(equipments);
		jdbcTemplate.update(Queries.ADD_OF_EQUIPMENTS, equipments.getEquipment_name());
	}

	// EditEquipments.......
	public Boolean edit(Equipments equipments) {
		Object[] updateEquipments = new Object[] { equipments.getEquipment_name(), equipments.getEquipments_id() };
		try {
			if (equipments.getEquipments_id() != 0) {
				jdbcTemplate.update(Queries.UPDATE_Equipments, updateEquipments);
			} else {
				System.out.println("Error to Edit");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// Delete
	public Boolean deleteExistingPackage(Equipments equipments) {
		Object[] deleteEquipment = new Object[] { equipments.getEquipments_id() };
		try {
			if (equipments.getEquipments_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_Equipment_FORM, deleteEquipment);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// update Active/InActive Status in Equipments.....
	public void updatestatus(Equipments user) {
		Object[] updatestatus = new Object[] { user.getStatus(), user.getEquipments_id() };
		jdbcTemplate.update(Queries.UPDATE_EQUIPMENTS_STATUS, updatestatus);
	}

	// ............ REGISTORTYPE INSERT,EDIT AND DELETE .............//

	// Insert RegistorType
	public void insertRegistorType(String register_type) {
		jdbcTemplate.update(Queries.ADD_OF_REGTYPE, register_type);
	}

	// Edit RegistorType
	public Boolean edit(RegistorType registor) {
		Object[] updateregistor = new Object[] { registor.getRegister_type(), registor.getRegister_as_id() };
		try {
			if (registor.getRegister_as_id() != 0) {
				jdbcTemplate.update(Queries.UPDATE_Registor, updateregistor);
			} else {
				System.out.println("Error to Edit");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// Delete RegistorType
	public Boolean deleteExistingPackage(RegistorType registor) {
		Object[] deleteRegistor = new Object[] { registor.getRegister_as_id() };
		try {
			if (registor.getRegister_as_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_RegistorType_FORM, deleteRegistor);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// update Status...
	public void updateRegistorstatus(RegistorType registor) {
		Object[] updateRegistorstatus = new Object[] { registor.getStatus(), registor.getRegister_as_id() };
		jdbcTemplate.update(Queries.UPDATE_REGISTOR_STATUS, updateRegistorstatus);
	}
	// ............ DOCTORDEGREE INSERT,EDIT AND DELETE .............//

	// Insert DoctorDegree
	public void insertDoctor(String doctor_degree) {
		jdbcTemplate.update(Queries.ADD_OF_DOCTORDEGREE, doctor_degree);
	}

	// Edit DoctorDegree
	public Boolean edit(DoctorDegree doctorDegree) {
		Object[] updatedoctorDegree = new Object[] { doctorDegree.getDoctor_degree(),
				doctorDegree.getDoctor_degree_id() };
		try {
			if (doctorDegree.getDoctor_degree_id() != 0) {
				jdbcTemplate.update(Queries.UPDATE_DoctorDegree, updatedoctorDegree);
			} else {
				System.out.println("Error to Edit");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// Delete DoctorDegree
	public Boolean deleteExistingPackages(DoctorDegree doctordegree) {
		Object[] deleteDoctordegree = new Object[] { doctordegree.getDoctor_degree_id() };
		try {
			if (doctordegree.getDoctor_degree_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_DoctorDegree_FORM, deleteDoctordegree);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//UpdateStatus DoctorDegree
	public void updateDoctorDegreestatus(DoctorDegree doctor) {
		Object[] updateDoctorstatus = new Object[] { doctor.getStatus(), doctor.getDoctor_degree_id() };
		jdbcTemplate.update(Queries.UPDATE_DOCTORDEGREE_STATUS, updateDoctorstatus);
	}
	// ............ DOCTORSPECTIALIZATION INSERT,EDIT AND DELETE .............//

	// insert doctor Specialization..
	public Object insertDoctorSpecializationType(String doctor_specialization_type) {
		return jdbcTemplate.update(Queries.ADD_OF_DOCTORDEGREESPECIALIZATION, doctor_specialization_type);
	}

	// EditDoctorSpecializations.....
	public Boolean edit(DoctorSpecailization doctorSpecialization) {
		Object[] updatedoctorDegreeSpecialization = new Object[] { doctorSpecialization.getDoctor_specialization_type(),
				doctorSpecialization.getDoctor_specialization_id() };
		try {
			if (doctorSpecialization.getDoctor_specialization_id() != 0) {
				jdbcTemplate.update(Queries.UPDATE_DoctorDegreeSpecialization, updatedoctorDegreeSpecialization);
			} else {
				System.out.println("Error to Edit");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// Delete DoctorSpecializations...
	public Boolean deleteExistingPackagess(DoctorSpecailization doctorSpecailization) {
		Object[] deleteDoctorSpecialization = new Object[] { doctorSpecailization.getDoctor_specialization_id() };
		try {
			if (doctorSpecailization.getDoctor_specialization_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_DoctorSpecialization_FORM, deleteDoctorSpecialization);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	// ................... COMPLETED DOCTORSPECIALIZATIONS INSERT,EDIT AND DELETE
	// ...............//

	// ..............Delete ListComments............//
	public Boolean deleteListComments(ContactUs contact) {
		Object[] deleteListComments = new Object[] { contact.getContact_id() };
		try {
			if (contact.getContact_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_ListComments_FORM, deleteListComments);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// ..............Delete AddMembers.................//
	public Boolean deleteAddMembers(AddFamilyMembers addmember) {
		Object[] deleteListAddMembers = new Object[] { addmember.getFamily_member_id() };

		try {
			if (addmember.getFamily_member_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_ListAddMembers_FORM, deleteListAddMembers);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// ................Delete Hospitals........................//
	public Boolean deleteExistingPackage(HospitalRegistration hosptlReg) {
		Object[] deleteHospital = new Object[] { hosptlReg.getRegister_reg_id() };
		try {
			if (hosptlReg.getRegister_reg_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_Hospital_FORM, deleteHospital);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// ..................Delete Ambulance .......................//
	public Boolean deleteExistingPackage(AmbulanceRegistration ambulanceReg) {
		Object[] deleteAmbulance = new Object[] { ambulanceReg.getRegister_ambulance_id() };
		try {
			if (ambulanceReg.getRegister_ambulance_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_Ambulance_FORM, deleteAmbulance);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// delete Doctor Dtls
	public Boolean deleteExistingPackage(DoctorRegistration doctorReg) {
		Object[] deleteDoctors = new Object[] { doctorReg.getRegister_as_doctor_id() };
		try {
			if (doctorReg.getRegister_as_doctor_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_Doctors_FORM, deleteDoctors);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	// UploadSlides in AdminDao
	public void saveUploadSlide(MainpageSlides uploadslide) {
		System.out.println(uploadslide + "doo slides");
		Object[] obj = new Object[] { uploadslide.getSlide_name(), uploadslide.getSlide_caption(),
				uploadslide.getSlide_uploaded_date() };
		jdbcTemplate.update(Queries.UPLOAD_SLIDE, obj);
	}

	public Boolean ImageExistOrNot() {
		Integer count = jdbcTemplate.queryForObject(Queries.SLIDE_ID_EXIST_OR_NOT_IN_SLIDE_UPLOAD, Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}

	public void UpdateUploadSlide(MainpageSlides uploadimage, int id) {
		Object[] obj = new Object[] { uploadimage.getSlide_name(), uploadimage.getSlide_caption() };
		System.out.println(uploadimage + "dao data updated photo");
		jdbcTemplate.update(Queries.UPDATE_UPLOAD_SLIDE, obj);
	}
//get AdminViewProfile Dtls....
	public VendorRegistration getVendorProfileDetailsbyid(String vendor_reg_id) {
		VendorRegistration vendor = jdbcTemplate.query(Queries.GET_VENDOR_DETAILS_FOR_SELECTED_VENDOR_IN_ADMIN,
					new ResultSetExtractor<VendorRegistration>() {
						@Override
						public VendorRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
							VendorRegistration vendor = new VendorRegistration();
							while(rs.next()) {
								vendor.setVendor_id(rs.getInt("vendor_reg_id"));
								vendor.setName(rs.getString("name"));
								vendor.setMobile_no(rs.getString("mobile_no"));
								vendor.setEmail_id(rs.getString("email_id"));
								vendor.setDate_of_birth(rs.getString("date_of_birth"));
								vendor.setGender(rs.getString("gender"));
							    vendor.setBlood_group(rs.getString("blood_group"));
								vendor.setRegister_as(rs.getString("register_as"));								
							}
							return vendor;
						}
					},vendor_reg_id
					);
			System.out.println("vendor"+vendor);
			return vendor;
			}

	public void updateDoctorDegreeSpecializationstatu(DoctorSpecailization doctorSpecialization) {
		Object[] updateDoctorSpecializationstatus = new Object[] { doctorSpecialization.getStatus(), doctorSpecialization.getDoctor_specialization_id() };
		jdbcTemplate.update(Queries.UPDATE_DOCTORDEGREESPECIALIZATION_STATUS, updateDoctorSpecializationstatus);
	}

	public void updateFamilyMemberstatus(AddFamilyMembers members) {
		Object[] updateFamilyMemberStatus = new Object[] { members.getStatus(),members.getFamily_member_id() };
        jdbcTemplate.update(Queries.UPDATE_FAMILYMEMBER_STATUS, updateFamilyMemberStatus);
	}
}
