package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.woof.domain.PageRequest;
import com.woof.domain.Service;
import com.woof.mapper.ServiceMapper;
import com.woof.service.ServiceService;


@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {
	
	@Autowired
	private ServiceMapper Mapper;

	@Override
	public Service getService(Service service) throws Exception {
		return Mapper.getService(service);
	}

	@Override
	public void insertService(Service service) throws Exception {
		Mapper.insertService(service);
		
	}

	@Override
	public void modifyService(Service service) throws Exception {
		Mapper.modifyService(service);
	}

	@Override
	public void deleteService(Service service) throws Exception {
		Mapper.deleteService(service);
	}

	@Override
	public void addServiceViewCount(Service service) throws Exception {
		Mapper.addServiceViewCount(service);
	}

	@Override
	public int countServiceList(PageRequest pageRequest) throws Exception {
		return 	Mapper.countServiceList(pageRequest);
	}

	@Override
	public List<Service> getServiceList(PageRequest pageRequest) throws Exception {
		
		return 	Mapper.getServiceList(pageRequest);
	}

	@Override
	public void responseService(Service service) throws Exception {
		Mapper.responseService(service);
	}

	

}
