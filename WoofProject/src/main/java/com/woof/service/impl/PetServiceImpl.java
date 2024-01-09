package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.Pet;
import com.woof.mapper.PetMapper;
import com.woof.service.PetService;

@Service
public class PetServiceImpl implements PetService {
	@Autowired
	private PetMapper mapper;

	@Override
	public Pet getPet(Pet pet)  throws Exception{
		return mapper.getPet(pet) ;
	}

	@Override
	public List<Pet> getPetList(Pet pet)  throws Exception{
		return mapper.getPetList(pet);
	}

	@Override
	public void insertPet(Pet pet)  throws Exception{
		mapper.insertPet(pet);
	}

	@Override
	public void modifyPet(Pet pet)  throws Exception{
		mapper.modifyPet(pet);
	}

	@Override
	public void deletePet(Pet pet)  throws Exception{
		mapper.insertPet(pet);
	}

	@Override
	public <List> Pet searchPetType(Pet pet)  throws Exception{
		return mapper.searchPetType(pet);
	}
	
	
	@Override
	public String petMainPic(Integer petId) throws Exception {
		return mapper.petMainPic(petId);
	}

	@Override
	public String petSubPic(Integer petId) throws Exception {
		return mapper.petSubPic(petId);
	}

}
