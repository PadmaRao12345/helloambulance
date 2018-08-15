package com.realcom.helloambulance.pojo;

public class JQGridParams {
	

	// variable to the JQGridParams
	private Boolean _search;
	private int rows;
	private int page;
	private String sidx;
	private String sord;
	private String filter;
    private String searchParam;
	private boolean success;
	private String message;
	
	
	//getters setters
	public Boolean get_search() {
		return _search;
	}
	public void set_search(Boolean _search) {
		this._search = _search;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getSearchParam() {
		return searchParam;
	}
	public void setSearchParam(String searchParam) {
		this.searchParam = searchParam;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	//To convert toString()..
	@Override
	public String toString() {
		return "JQGridParams [_search=" + _search + ", rows=" + rows + ", page=" + page + ", sidx=" + sidx + ", sord="
				+ sord + ", filter=" + filter + ", searchParam=" + searchParam + ", success=" + success + ", message="
				+ message + "]";
	}
	
	
	
	
}
