//user Responce(Rakesh)//
	package com.realcom.helloambulance.pojo;

	import java.util.List;
import java.util.Map;

	public class UserResponse {

		// User Response variables
		private List<Map<String, Object>> rows;
		private Integer total;
		private Integer records;
		private Integer page;

		public UserResponse(String valueOf, int totalPages, int i, List<Map<String, Object>> list, int size) {
		}

		public UserResponse() {
		}

		// Generate setters and getters
		public List<Map<String, Object>> getRows() {
			return rows;
		}

		public void setRows(List<Map<String, Object>> list) {
			this.rows = list;
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
			//end--user Responce(Rakesh)//
		}

		public void setSuccess(boolean b) {
			
		}

		public void setMessage(String string) {
			
		}
	}



