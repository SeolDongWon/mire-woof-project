package com.woof.service;

import java.util.List;

import com.woof.domain.Pet;

public interface PetService {
	// 팻 테이블 레코드 한줄 정보 보기
	public Pet getPet(Pet pet) throws Exception;
	// 팻 리스트 불러오기
	public List<Pet> getPetList(Pet pet) throws Exception;
	// 팻 추가
	public void insertPet(Pet pet) throws Exception;
	// 팻 정보 변경
	public void modifyPet(Pet pet) throws Exception;
	// 팻 삭제
	public void deletePet(Pet pet) throws Exception;
	// 키워드에 해당하는 팻 리스트 불러오기
	public <List> Pet searchPetType(Pet pet) throws Exception;
	
	// 사진
	public List<Pet> list() throws Exception;
	
	public String petMainPic(Integer petId) throws Exception;

	public String petSubPic(Integer petId) throws Exception;
}