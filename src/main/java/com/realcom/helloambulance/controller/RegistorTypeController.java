package com.realcom.helloambulance.controller;

import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.ApplicationUtil;
import com.realcom.helloambulance.pojo.JQGridParams;
import com.realcom.helloambulance.pojo.RegistorType;
import com.realcom.helloambulance.pojo.UserResponse;
import com.realcom.helloambulance.services.AdminServices;
import com.realcom.helloambulance.services.GridServices;
import com.realcom.helloambulance.util.JQGridFilter;
import com.realcom.helloambulance.util.JQGridFilter.Rule;
import com.realcom.helloambulance.util.JqgridObjectMapper;

@Controller
@RequestMapping(value = "/registor")
public class RegistorTypeController {

	@Autowired
	AdminServices adminServices;
	@Autowired
	GridServices gridServices;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/reg", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody UserResponse getregistor(@RequestParam("_search") Boolean _search,
			@RequestParam("rows") int rows, @RequestParam("page") int page, @RequestParam("sidx") String sidx,
			@RequestParam("sord") String sord, @RequestParam("filters") String filter, ModelMap model) {

		// To create UserResponse object.
		UserResponse jQGridData = new UserResponse();
		// To create JQGridparams object
		JQGridParams JQGridParams = new JQGridParams();
		// To set the values to the jqgridParams.
		JQGridParams.set_search(_search);
		JQGridParams.setRows(rows);
		JQGridParams.setPage(page);
		JQGridParams.setSidx(sidx);
		JQGridParams.setSord(sord);
		// To print the jqgridParams.
		System.out.println(JQGridParams);
		// To create Map object.
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String searchParam = null;
			String searchField = null;
			// print the JqgridParams values..
			System.out.println(JQGridParams.get_search());
			System.out.println(JQGridParams.getPage());
			System.out.println(JQGridParams.getSord());
			System.out.println(JQGridParams.getSidx());
			// conditions.
			if (JQGridParams.get_search()) {
				JQGridFilter jQGridFilter = JqgridObjectMapper.map(filter);

				System.out.println(jQGridFilter + "jqgrid filters");

				for (Rule rule : jQGridFilter.getRules()) {
					if (rule.getField().equals("register_as_id")) {
						searchField = rule.getField();
						searchParam = rule.getData();
					} else if (rule.getField().equals("register_type")) {
						searchField = rule.getField();
						searchParam = rule.getData();
					}
				}
				System.out.println(JQGridParams.getSearchParam() + "Search Param");
				System.out.println("FILTERS");
				// To get the values from the userServices.
				map = gridServices.getregistorData(searchField, searchParam,
						((JQGridParams.getPage() - 1) * JQGridParams.getRows()), JQGridParams.getRows(),
						JQGridParams.getSidx(), JQGridParams.getSord());
				// To get the Row size..
				int size = JQGridParams.getRows();
				System.out.println("rows");
				System.out.println("sidx");
				System.out.println("sord");
				System.out.println("size");
				// To get the totalNo.OfRecords..
				int totalNumberOfRecords = (Integer) map.get("totalCount");
				double totalPages = (((double) totalNumberOfRecords) / ((double) size));
				totalPages = (totalPages == ((int) totalPages)) ? totalPages : (((int) totalPages) + 1);
				// To create UserResponse..
				jQGridData = new UserResponse();
				jQGridData.setRows((List<Map<String, Object>>) map.get("rows"));

			} else {
				System.out.println(" NO FILTERS in register");
				// TO get the values from userServices...
				map = gridServices.getregistorData(searchField, searchParam,
						((JQGridParams.getPage() - 1) * JQGridParams.getRows()), JQGridParams.getRows(),
						JQGridParams.getSidx(), JQGridParams.getSord());
				jQGridData.setRows((List<Map<String, Object>>) map.get("rows"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return jQGridData;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView Add(ModelAndView model, @RequestParam String register_type) throws IOException {
		System.out.println("hiiii");
		@SuppressWarnings("unused")
		RegistorType registorType = new RegistorType();
		adminServices.insertRegistorType(register_type);
		System.out.println("adminServices");
		model.setViewName("RegistorType");
		return model;
	}

	// Active/InActive Status....

	@RequestMapping(value = "/RegistorStatus")
	public ModelAndView RegistorStatus(ModelAndView model, @RequestParam String status,
			@RequestParam String register_as_id) {
		System.out.println(status);
		RegistorType registor = new RegistorType();
		registor.setStatus(status);
		registor.setRegister_as_id(ApplicationUtil.stringToInt(register_as_id));
		adminServices.updateRegistorstatus(registor);
		model.setViewName("RegistorType");
		return model;
	}
}
