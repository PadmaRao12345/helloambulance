package com.realcom.helloambulance.pojo;

import java.util.List;
import java.util.Map;

public class Comments{	
	private List<Map<String, Object>> rows;
    private Integer total;
    private Integer records;
    private Integer page;
    private Boolean success;
    private String message;
   
	
	public Comments() {
		// TODO Auto-generated constructor stub
	}
	
		public Comments(String string, int totalPages, int i, List<Map<String, Object>> list, int size) {
		// TODO Auto-generated constructor stub
	}

		//setters getters
	    public List<Map<String, Object>> getRows() {
		return rows;
	}
	public void setRows(List<Map<String, Object>> rows) {
		this.rows = rows;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Comments [rows=" + rows + ", total=" + total + ", records=" + records + ", page=" + page + ", success="
				+ success + ", message=" + message + "]";
	}
		
} 


