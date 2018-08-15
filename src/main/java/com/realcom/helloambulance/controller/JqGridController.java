package com.realcom.helloambulance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.realcom.helloambulance.pojo.Comments;
import com.realcom.helloambulance.pojo.JQGridParams;
import com.realcom.helloambulance.services.GridServices;
import com.realcom.helloambulance.util.JqgridObjectMapper;

@Controller
@RequestMapping(value = "/comments")
public class JqGridController {
	@Autowired
	GridServices gridServices;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list",  method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Comments list(
			@RequestParam("_search") Boolean _search,
			@RequestParam("rows") int rows,
			@RequestParam("page") int page,
			@RequestParam("sidx") String sidx,
			@RequestParam("sord") String sord,
			@RequestParam("filters") String filters,
			ModelMap model) {
		Comments comm = new Comments();
		JQGridParams jQGridParams = new JQGridParams();
		jQGridParams.set_search(_search);
		jQGridParams.setRows(rows);
		jQGridParams.setPage(page);
		jQGridParams.setSidx(sidx);
		jQGridParams.setSord(sord);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String searchParam = null;
			String searchField = null;
			System.out.println(jQGridParams.get_search());
			System.out.println(jQGridParams.getPage());
			System.out.println(jQGridParams.getSidx());
			System.out.println(jQGridParams.getSord());
			if (jQGridParams.get_search()) {
				com.realcom.helloambulance.util.JQGridFilter jQGridFilter = JqgridObjectMapper.map(filters);
				System.out.println(jQGridFilter + "##############################################");
				for(com.realcom.helloambulance.util.JQGridFilter.Rule rule: jQGridFilter.getRules()) {
				 if(rule.getField().equals("name")) {
						searchField = rule.getField();
						searchParam = rule.getData();
					} else if(rule.getField().equals("email_id")) {
						searchField = rule.getField();
						searchParam = rule.getData();
					}else if(rule.getField().equals("message")) {
							searchField = rule.getField();
							searchParam = rule.getData();
						}
				 else if(rule.getField().equals("date_of_message")) {
						searchField = rule.getField();
						searchParam = rule.getData();
					}
				}
				System.out.println(jQGridParams.getSearchParam() + "Search Param");
				System.out.println("FILTERS");
				map = gridServices.getCommentsData(searchField, searchParam, ((jQGridParams.getPage() - 1) * jQGridParams.getRows()), jQGridParams.getRows(), jQGridParams.getSord(), jQGridParams.getSidx());
				int size = jQGridParams.getRows();
				//int totalNumberOfRecords = (Integer) map.get("totalCount");
				//double totalPages = (((double) totalNumberOfRecords) / ((double) size));
				//totalPages = (totalPages == ((int) totalPages)) ? totalPages : (((int) totalPages) + 1);
		         //comm = new Comments(String.valueOf(totalNumberOfRecords), (int)totalPages, jQGridParams.getPage()-1, (List<Map<String, Object>>)map.get("rows"), size);
				comm.setRows((List<Map<String, Object>>)map.get("rows"));
			} else {
				System.out.println(" NO FILTERS");
				map = gridServices.getCommentsData(searchField, searchParam, ((jQGridParams.getPage() - 1) * jQGridParams.getRows()), jQGridParams.getRows(), jQGridParams.getSord(), jQGridParams.getSidx());
				int size = jQGridParams.getRows();
				//int totalNumberOfRecords = (Integer) map.get("totalCount");
				//double totalPages = (((double) totalNumberOfRecords) / ((double) size));
				//totalPages = (totalPages == ((int) totalPages)) ? totalPages : (((int) totalPages) + 1);
				//comm = new Comments(String.valueOf(totalNumberOfRecords), (int)totalPages, jQGridParams.getPage()-1, (List<Map<String, Object>>)map.get("rows"), size);
				comm.setRows((List<Map<String, Object>>)map.get("rows"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return comm;
	}

	/*@RequestMapping(value = "/createOrUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody JQGridResponse createOrUpdatePackages(
			@RequestParam String packid, 
			@RequestParam String packages,
			@RequestParam String packageprice, 
			@RequestParam String daysofvalidity, 
			@RequestParam String status) {
		Packages createAndUpdatepackage = new Packages(ApplicationUtil.stringInToInt(packid), packages, packageprice, daysofvalidity, status, ApplicationUtil.dateFormatLong());
		Boolean success = gridServices.createAndUpdatePackages(createAndUpdatepackage);
		JQGridResponse response = new JQGridResponse();
		if(success == true) {
			response.setSuccess(true);
			response.setMessage("Added Successfully..!");
			return response;
		} else {
			response.setSuccess(false);
			response.setMessage("Added Failure..!");
			return response;
		}
	}*/
}
