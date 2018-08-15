package com.realcom.helloambulance.util;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class ApplicationsUtil {

	private String getCommonStr(int size){
	return UUID.randomUUID()
	.toString()
	.replace("-", "")
	.substring(0,size);
	}

	public String getPwd(){
	return getCommonStr(21);
	}
	public String getToken(){
	return getCommonStr(6);
	}

	public static String addUserName(HttpServletRequest request) {
		Principal principal = request.getUserPrincipal();
		return principal.getName();
		}
	
	public static String getRemortIP(HttpServletRequest request) { 
		String ip = request.getHeader("X-Forwarded-For");
		       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		           ip = request.getHeader("Proxy-Client-IP");
		       }
		       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		           ip = request.getHeader("WL-Proxy-Client-IP");
		       }
		       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		           ip = request.getHeader("HTTP_CLIENT_IP");
		       }
		       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		           ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		       }
		       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		           ip = request.getRemoteAddr();
		       }
		       return ip;
		}
	 public static String getMACAddress(String ip){ 
		 
			//public static String  getSystemMac(){
				 //////////////////////formac
			      /* String str = ""; 
			       String macAddress = ""; 
			       try { 
			           Process p = Runtime.getRuntime().exec("nbtstat -A " + ip); 
			           InputStreamReader ir = new InputStreamReader(p.getInputStream()); 
			           LineNumberReader input = new LineNumberReader(ir); 
			           for (int i = 1; i <100; i++) { 
			               str = input.readLine(); 
			               if (str != null) { 
			                   if (str.indexOf("MAC Address") > 1) { 
			                       macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length()); 
			                       break; 
			                   } 
			               } 
			           } 
			       } catch (Exception e) { 
			           e.printStackTrace(System.out); 
			       } 
			       return macAddress; 
			   }
		
		
		
		*/
				 ////////////////////////////////////////////////////////////////////////////////for mac1////working
				
				 try{
			           InetAddress inetaddress=InetAddress.getLocalHost(); //Get LocalHost refrence
			            
			           //get Network interface Refrence by InetAddress Refrence
			           NetworkInterface network = NetworkInterface.getByInetAddress(inetaddress); 
			           byte[] macArray = network.getHardwareAddress();  //get Harware address Array
			           StringBuilder str = new StringBuilder();
			            
			           // Convert Array to String 
			           for (int i = 0; i < macArray.length; i++) {
			                   str.append(String.format("%02X%s", macArray[i], (i < macArray.length - 1) ? "-" : ""));
			           }
			           String macAddress=str.toString();
			        
			           return macAddress; //return MAc Address
			       }
			       catch(Exception E){
			           E.printStackTrace();  //print Exception StackTrace
			           return null;
			       } 
			   }
}

