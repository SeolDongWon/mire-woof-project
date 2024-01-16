package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.domain.Service;
import com.woof.service.ServiceService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/service")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;

	@RequestMapping("/insertServiceForm")
	public String insertServiceForm(Service service) throws Exception {
		log.info("insertServiceForm");
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		UserDetails userDetails = (UserDetails)principal;

//		String username = principal.toString();
		return "service/insertService";
	}

	@RequestMapping("/insertService")
	public String insertService(Service service) throws Exception {
		log.info("insertService");
		log.info("service : "+ service.toString());

		serviceService.insertService(service);

		// 샘플작성
		String desc = service.getServiceDesc();
		for (int i = 0; i < 30; i++) {
			service.setServiceDesc(desc + i);
			serviceService.insertService(service);
		}

		return "redirect:/service/getServiceList";
	}
	
	@RequestMapping("/responseServiceForm")
	public String responseServiceForm(Service service) throws Exception {
		log.info("responseServiceForm");
		log.info("responseServiceForm : "+service.toString());
		return "service/responseService";
	}
	
	@RequestMapping("/respnoseService")
	public String respnoseService(Service service) throws Exception {
		log.info("respnoseService");
		log.info("respnoseService : "+service.toString());
		serviceService.responseService(service);
		return "redirect:/service/getServiceList";
	}

	// 공지사항 수정화면
	@RequestMapping("/modifyServiceForm/{ServiceNo}")
	public String modifyServiceForm(@PathVariable("ServiceNo") int ServiceNo, Service dto, Model model) throws Exception {
		dto.setServiceNo(ServiceNo);
		serviceService.addServiceViewCount(dto);
		Service Service = serviceService.getService(dto);
		model.addAttribute("Service", Service);
		return "admin/Services/modifyService";
	}

	// 공지사항 수정
	@PostMapping("/modifyService")
	public String modifyService(Service Service) throws Exception {
		log.info("modifyService");

		serviceService.modifyService(Service);

		return "redirect:/Service/getServiceList";
	}

	// 공지사항 삭제
	@RequestMapping("/deleteService")
	public String deleteService(Service Service) throws Exception {
		serviceService.deleteService(Service);
		return "redirect:/Service/getServiceList";
	}

	@RequestMapping("/getServiceList")
	public String getServiceList(Model model, PageRequest pageRequest, Pagination pagination) throws Exception {
		log.info("getServiceList");

		if (pageRequest.getCondition() == null) {
			pageRequest.setCondition("TITLE");
		}
		if (pageRequest.getKeyword() == null) {
			pageRequest.setKeyword("");
		}

		// 검색정보 Null Check
		switch (pageRequest.getCondition()) {
		case "TITLE": {
			pageRequest.setKeywordTitle(pageRequest.getKeyword());
			pageRequest.setKeywordDesc("");
			break;
		}
		case "CONTENT": {
			pageRequest.setKeywordDesc(pageRequest.getKeyword());
			pageRequest.setKeywordTitle("");
			break;
		}
		}
		
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(serviceService.countServiceList(pageRequest));
		model.addAttribute("pagination", pagination);
		List<Service> serviceList = serviceService.getServiceList(pageRequest);
		
		model.addAttribute("serviceList", serviceList);
		/* log.info("serviceList : "+serviceList.toString()); */
		return "service/serviceList";
	}

	@RequestMapping("/getFAQList")
	public String getFAQList(Service service) {
		return "service/FAQ";
	}

}
