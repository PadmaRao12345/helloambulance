package com.realcom.helloambulance.pojo;

import java.util.ArrayList;
//Rakesh
public class JqgridFilter {
  //variables
	private String source;
	private String groupOp;
	private ArrayList<Rule> rules;
	//constructor default
	public JqgridFilter() {
		super();
	}
	//Parameterized constructor
	public JqgridFilter(String source) {
		super();
		this.source = source;
	}
   //setters and getters..
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getGroupOp() {
		return groupOp;
	}

	public void setGroupOp(String groupOp) {
		this.groupOp = groupOp;
	}

	public ArrayList<Rule> getRules() {
		return rules;
	}

	public void setRules(ArrayList<Rule> rules) {
		this.rules = rules;
	}
	
	
	//Inner class
	public static class Rule {
		private String junction;
		private String field;
		private String op;
		private String data;
         //default constructor
		public Rule() {}
		//Parameterized constructor
		public Rule(String junction, String field, String op, String data) {
			super();
			this.junction = junction;
			this.field = field;
			this.op = op;
			this.data = data;
		}
          //setters and getters..
		public String getJunction() {
			return junction;
		}

		public void setJunction(String junction) {
			this.junction = junction;
		}

		public String getField() {
			return field;
		}

		public void setField(String field) {
			this.field = field;
		}

		public String getOp() {
			return op;
		}

		public void setOp(String op) {
			this.op = op;
		}

		public String getData() {
			return data;
		}

		public void setData(String data) {
			this.data = data;
		}
	}
}
