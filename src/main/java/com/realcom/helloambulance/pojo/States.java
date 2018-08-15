package com.realcom.helloambulance.pojo;
public class States { 
	private int StateId;
	private String StateName;
	private String CountryId;

	public int getStateId() {
		return StateId;
	}

	public void setStateId(int StateId) {
		this.StateId = StateId;
	}

	public String getStateName() {
		return StateName;
	}

	public void setStateName(String StateName) {
		this.StateName = StateName;
	}

	public String getCountryId() {
		return CountryId;
	}

	public void setCountryId(String StateCountryId) {
		this.CountryId = StateCountryId;
	}

	@Override
	public String toString() {
		return "Cities [state_id=" + StateId + ", StateName=" + StateName + ", CountryId=" + CountryId + ",]";

	}
}
