package com.realcom.helloambulance.pojo;

import org.codehaus.jackson.map.ObjectMapper;
//Rakesh
public class JqgridObjectMapper {
public static JqgridFilter map(String jsonString) {
		
    	if (jsonString != null) {
        	ObjectMapper mapper = new ObjectMapper();
        	
        	try {
				return mapper.readValue(jsonString, JqgridFilter.class);
        	} catch (Exception e) {
				throw new RuntimeException (e);
			}
    	}
    	
		return null;
	}

}
