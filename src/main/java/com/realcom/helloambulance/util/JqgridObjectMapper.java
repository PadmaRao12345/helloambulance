package com.realcom.helloambulance.util;

import org.codehaus.jackson.map.ObjectMapper;

public class JqgridObjectMapper {
public static JQGridFilter map(String jsonString) {
		
    	if (jsonString != null) {
        	ObjectMapper mapper = new ObjectMapper();
        	
        	try {
				return mapper.readValue(jsonString, JQGridFilter.class);
        	} catch (Exception e) {
				throw new RuntimeException (e);
			}
    	}
    	
		return null;
	}

}
