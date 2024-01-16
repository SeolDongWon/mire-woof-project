package com.woof.service;

import java.util.List;

import com.woof.domain.PageRequest;
import com.woof.domain.Service;

public interface ServiceService {
	public Service getService(Service service) throws Exception;

	public void insertService(Service service) throws Exception;

	public void modifyService(Service service) throws Exception;

	public void deleteService(Service service) throws Exception;
	
	public void responseService(Service service) throws Exception;

	public void addServiceViewCount(Service service) throws Exception;

	public int countServiceList(PageRequest pageRequest) throws Exception;
	
	public List<Service> getServiceList(PageRequest pageRequest) throws Exception;
}
