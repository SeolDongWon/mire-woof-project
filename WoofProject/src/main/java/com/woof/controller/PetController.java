package com.woof.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woof.domain.Pet;
import com.woof.service.PetService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/pet")
@MapperScan(basePackages = "com.woof.mapper")
public class PetController {
	@Autowired
	private PetService service;
	
	@RequestMapping(value="/getPet")
	public String getPet(Pet pet)  throws Exception{
		service.getPet(pet) ;
		return "/getPet";
	}

	@RequestMapping(value="/getPetList")
	public String getPetList(Pet pet)  throws Exception{
//		service.getPetList(pet);
		return "/pet/petList";
	}

	@RequestMapping(value="/insertPet", method = RequestMethod.POST)
	public String insertPet(Pet pet)  throws Exception{
		service.insertPet(pet);
		return "/insertPet";
	}

	@RequestMapping(value="/modifyPet", method = RequestMethod.POST)
	public String modifyPet(Pet pet)  throws Exception{
		service.modifyPet(pet);
		return "/modifyPet";
	}

	@RequestMapping(value="/deletePet", method = RequestMethod.POST)
	public String deletePet(Pet pet)  throws Exception{
		service.deletePet(pet);
		return "/deletePet";
	}

	@RequestMapping(value="/searchPetType")
	public String searchPetType(Pet pet)  throws Exception{
		service.searchPetType(pet);
		return "/searchPetType";
	}
}
