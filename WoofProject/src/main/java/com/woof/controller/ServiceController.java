package com.woof.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woof.domain.Account;
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

	// 글쓰기 화면
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/insertServiceForm")
	public String insertServiceForm(Account account, Principal principal, Model model) throws Exception {
		log.info("insertServiceForm");
		account.setUsername(principal.getName());
		log.info(principal.getName());
		model.addAttribute(account);
		return "service/insertService";
	}

	// 글 등록
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/insertService")
	public String insertService(Service service) throws Exception {
		log.info("insertService");
		log.info("service : " + service.toString());
		serviceService.insertService(service);

		// 샘플작성
		String desc = service.getServiceDesc();
		for (int i = 0; i < 30; i++) {
			service.setServiceDesc(desc + i);
			serviceService.insertService(service);
		}
		return "redirect:/service/getServiceList";
	}

	// 답변 화면
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/responseServiceForm")
	public String responseServiceForm(Service service, Model model) throws Exception {
		log.info("responseServiceForm");
		log.info("responseServiceForm : " + service.toString());
		model.addAttribute(serviceService.getService(service));
		return "service/responseService";
	}

	// 답변 등록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/respnoseService")
	public String respnoseService(Service service) throws Exception {
		log.info("respnoseService");
		log.info("respnoseService : " + service.toString());
		serviceService.responseService(service);
		return "redirect:/service/getServiceList";
	}

//	// 수정화면
//	@RequestMapping(value = "/modifyServiceForm/{ServiceNo}")
//	public String modifyServiceForm(@PathVariable("ServiceNo") int ServiceNo, Service dto, Model model)
//			throws Exception {
//		dto.setServiceNo(ServiceNo);
//		serviceService.addServiceViewCount(dto);
//		Service Service = serviceService.getService(dto);
//		model.addAttribute("Service", Service);
//		return "admin/Services/modifyService";
//	}
	// 수정화면
//	@RequestMapping(value = "/modifyServiceForm", method = RequestMethod.POST)
//	public String modifyServiceForm(Service Service, Model model) throws Exception {
//		dto.setServiceNo(ServiceNo);
//		serviceService.addServiceViewCount(dto);
//		Service Service = serviceService.getService(Service);
//		model.addAttribute(serviceService.getService(Service));
//		return "service/modifyService";
//	}

	// 수정
//	@PostMapping(value = "/modifyService")
//	public String modifyService(Service Service) throws Exception {
//		log.info("modifyService");
//		serviceService.modifyService(Service);
//		return "redirect:/service/getServiceList";
//	}

	// 삭제
	@PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
	@RequestMapping(value = "/deleteService")
	public String deleteService(Service service, Principal principal,RedirectAttributes rttr) throws Exception {
		 
		
		// Principal을 얻어오고
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    // UserDetails 객체에서 원하는 정보에 접근
	    // authList를 사용하여 필요한 작업 수행
	    String authList = userDetails.getAuthorities().toString();
	    
	    
	    Service serviceB = serviceService.getService(service);
	    
	    String msg=null;
	    
	    if(authList.equals("[ROLE_ADMIN]")) {
	    	serviceService.deleteService(service);
	    	return "redirect:/service/getServiceList";
	    }
	    
	    if(!principal.getName().equals(serviceB.getUsername())){
	    	msg="작성자가 아니면 삭제할 수 없어요";
	    }else if(serviceB.getResponse()!=null){
	    	msg="답변이 달린 글은 삭제할 수 없어요";
    	}else {
    		serviceService.deleteService(service);	    		
    	}
	    
	    log.info(msg);
	    rttr.addFlashAttribute("msg", msg);
		return "redirect:/service/getServiceList";
	}

	// 문의 리스트
	@RequestMapping(value = "/getServiceList")
	public String getServiceList(Model model, PageRequest pageRequest, Pagination pagination, Principal principal,
			Account account) throws Exception {
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
		if (null != principal) {
			account.setUsername(principal.getName());
			log.info(principal.getName());
			model.addAttribute(account);
		}
		/* log.info("serviceList : "+serviceList.toString()); */
		return "service/serviceList";
	}

	@RequestMapping(value = "/getFAQList")
	public String getFAQList(Service service) {
		return "service/FAQ";
	}

}
