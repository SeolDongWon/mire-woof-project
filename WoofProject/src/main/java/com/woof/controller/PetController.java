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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.domain.Pet;
import com.woof.domain.Review;
import com.woof.service.PetService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	private PetService service;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	@GetMapping("/getPet")
	public String getPet(Pet pet,Model model)  throws Exception{
		Pet pet_ = service.getPet(pet);
		model.addAttribute("pet", pet_);
		return "pet/pet";
	}

	@PostMapping("/getPet")
	public void getPetList(Pet pet) throws Exception{
		log.info("/getPet POST");
		service.getPet(pet);
	}
	
	@GetMapping("/getPetList")
	public String getPetList(Pet pet,Model model,PageRequest pageRequest,Pagination pagination)  throws Exception{
		if(null==pageRequest.getKeyword()) {
			pageRequest.setKeyword("");
		}
		
		pageRequest.setSizePerPage(9);
		pagination.setPageRequest(pageRequest);
//		log.info("getPetList().size() : "+service.getPetList().size());
		pagination.setTotalCount(service.countPetList(pageRequest));
		log.info("pagination : "+pagination.toString());
		model.addAttribute("pagination", pagination);
		List<Pet> petList = service.getPetList(pageRequest);
		model.addAttribute("petList", petList);
		return "pet/petList";
	}

	@GetMapping("/petList")
	public void getPetList(Model model,PageRequest pageRequest) throws Exception{
		log.info("/petList GET");
		List<Pet> petList = service.getPetList(pageRequest);
		model.addAttribute("petList", petList);
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/insertPet")
	public String insertPetForm(Pet pet)  throws Exception{
		return "pet/insertPet";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/pet/insertPet")
	public void insertPet(Model model) throws Exception{
		log.info("/pet/insertPet GET");
		model.addAttribute(new Pet());
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/insertPet")
	public String insertPet(Pet pet) throws Exception{
		log.info("/insertPet POST");
		List<MultipartFile> pictures = pet.getPictures();
		for(int i = 0 ; i < pictures.size() ; i++) {
			MultipartFile file = pictures.get(i);
//			log.info("originalName" + file.getOriginalFilename());
//			log.info("size:" + file.getSize());
//			log.info("contentType:" + file.getContentType());
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
			if(i == 0) {
				pet.setPetMainPic(savedName);
			}else if(i == 1) {
				pet.setPetSubPic(savedName);
			}
		}
//		log.info(pet.toString());
		
		
		String petname = pet.getPetName();
		for(int i=0;i<100;i++) {
			pet.setPetName(petname+i);
			service.insertPet(pet);			
		}
		
		
		return "redirect:/pet/getPetList";
	}
	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		log.info("UploadFile()");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modifyPet")
	public String modifyPet(Pet pet , Model model) throws Exception{
		log.info("/modifyPet GET");
		Pet petModify = this.service.getPet(pet);
//		log.info(petModify.toString());
		model.addAttribute(petModify);
//		log.info("model add attribute ");
		return "pet/modifyPet";
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modifyPet")
	public String modify(Pet pet, Model model)throws Exception{
		log.info("/modifyPet POST: " + pet.toString());
		List<MultipartFile> pictures = pet.getPictures();
		for(int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			if(file != null && file.getSize() > 0) {
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				if(i == 0) {
					pet.setPetMainPic(savedName);
				}else if(i == 1) {
					pet.setPetSubPic(savedName);
				}
			}
		}
		this.service.modifyPet(pet);
		model.addAttribute("수정이 완료되었습니다.");
		return "redirect:/pet/getPetList";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/deletePet")
	public String deletePet(Pet pet, Model model) throws Exception{
		this.service.deletePet(pet);
		return "redirect:/pet/getPetList";
	}

	@RequestMapping("/searchPetType")
	public void searchPetType(Pet pet)  throws Exception{
		service.searchPetType(pet);
	}
	
//----------------------------사진 업로드----------------------------------

	@ResponseBody
	@GetMapping("/getPetMainPic")
	public ResponseEntity<byte[]> getPetMainPic(Integer petNo) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.getPetMainPic(petNo);
//		log.info(fileName);
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
	@GetMapping("/getPetSubPic")
	public ResponseEntity<byte[]> getPetSubPic(Integer petNo) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.getPetSubPic(petNo);
	
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
//		log.info("getMediaType()");
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
