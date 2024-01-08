package com.woof.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String getPetList(Pet pet,Model model)  throws Exception{
		List<Pet> petList = service.getPetList(pet);
		model.addAttribute("petList", petList);
		return "/pet/petList";
	}

	@GetMapping(value="/insertPet")
	public String insertPetForm(Pet pet)  throws Exception{
		return "/admin/pets/insertPet";
	}
	@PostMapping(value="/insertPet")
	public String insertPet(Pet pet)  throws Exception{
		log.info("insertPet start");
		log.info("pet:"+pet.toString());
		service.insertPet(pet);
		return "/pet/petList";
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
