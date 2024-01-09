package com.woof.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@Value("${upload.path}")
	private String uploadPath;
	
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
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer petId) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.petMainPic(petId);
		log.info("FILE NAME: " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + File.separator + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/display2")
	public ResponseEntity<byte[]> displayFile2(Integer petId) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.petSubPic(petId);
		log.info("FILE NAME: " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + File.separator + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}
}
