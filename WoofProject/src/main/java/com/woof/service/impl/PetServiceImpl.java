package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.PageRequest;
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

	public List<Pet> getPetList(PageRequest pageRequest)  throws Exception{
		return mapper.getPetList(pageRequest);
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
		mapper.deletePet(pet);
	}

	@Override
	public <List> Pet searchPetType(Pet pet)  throws Exception{
		return mapper.searchPetType(pet);
	}
	
	
	@Override
	public String getPetMainPic(Integer petNo) throws Exception {
		return mapper.getPetMainPic(petNo);
	}

	@Override
	public String getPetSubPic(Integer petNo) throws Exception {
		return mapper.getPetSubPic(petNo);
	}

	@Override
	public List<Pet> getMainPetList() throws Exception {
		return mapper.getMainPetList();
	}

	@Override
	public int countPetList(PageRequest pageRequest) throws Exception {
		return mapper.countPetList(pageRequest);
	}

}
