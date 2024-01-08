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
	}

	@Override
	public void modifyPet(Pet pet)  throws Exception{
	}

	@Override
	public void deletePet(Pet pet)  throws Exception{
	}

	@Override
	public <List> Pet searchPetType(Pet pet)  throws Exception{
		return mapper.searchPetType(pet);
	}

}
