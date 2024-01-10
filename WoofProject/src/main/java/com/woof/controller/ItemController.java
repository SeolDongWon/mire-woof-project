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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.woof.domain.Item;
import com.woof.service.ItemService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/item")
@MapperScan(basePackages = "com.woof.mapper")
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	@GetMapping("/getItem")
	public void getItem(Item item) throws Exception {
		log.info("/getItem GET");
		itemService.getItem(item);
	}
	
	@GetMapping("/itemList")
	public void getItemList(Model model) throws Exception {
		log.info("/itemList GET");
		List<Item> itemList = itemService.getItemList();
		model.addAttribute("itemList", itemList);
	}
	
	@GetMapping("/admin/insertItem")
	public void insertItemGet(Model model) throws Exception {
		log.info("/admin/insertItem GET");
		model.addAttribute(new Item());
	}
	
	@PostMapping("/admin/insertItem")
	public String insertItem(Item item) throws Exception {
		log.info("/admin/insertItem POST");
		List<MultipartFile> pictures = item.getPictures();
		for(int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			log.info("originalName: " + file.getOriginalFilename());
			log.info("size: " + file.getSize());
			log.info("contentType: " + file.getContentType());
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				if(i == 0) {
					item.setItemMainPic(savedName);
				} else if(i == 1) {
					item.setItemSubPic(savedName);
			}
		}
		itemService.insertItem(item);
		return "redirect:/item/itemList";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		log.info("uploadFile()");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@GetMapping("/modifyItem")
	public String modifyItemGet(Item item, Model model) throws Exception {
		log.info("/modifyItem GET");
		Item itemToModify = itemService.getItem(item);
		model.addAttribute(itemToModify);
		return "item/admin/modifyItem";
	}
	// NEED ITEMNO
	@PostMapping("/modifyItem")
	public void modifyItem(Item item) throws Exception {
		log.info("/modifyItem POST");
		List<MultipartFile> pictures = item.getPictures();
		for (int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			if (file != null && file.getSize() > 0) {
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				if (i == 0) {
					item.setItemMainPic(savedName);
				} else if (i == 1) {
					item.setItemSubPic(savedName);
				}
			}
		}
		itemService.modifyItem(item);
	}
	// NEED ITEMNO
	@PostMapping("/deleteItem")
	public void deleteItem(Item item) throws Exception {
		log.info("/deleteItem POST");
		itemService.deleteItem(item);
	}
	
	@ResponseBody
	@RequestMapping("/getItemMainPic")
	public ResponseEntity<byte[]> getItemMainPic(Integer itemNo) throws Exception {
		log.info("/getItemMainPic GET");
		InputStream inputStream = null;
		ResponseEntity<byte[]> responseEntity = null;
		String fileName = itemService.getItemMainPic(itemNo);
		try {
			String formattedName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mediaType = getMediaType(formattedName);
			HttpHeaders httpHeaders = new HttpHeaders();
			inputStream = new FileInputStream(uploadPath + File.separator + fileName);
			if (mediaType != null) {
				httpHeaders.setContentType(mediaType);
			}
			responseEntity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			responseEntity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			inputStream.close();
		}
		return responseEntity;
	}

	@ResponseBody
	@GetMapping("/getItemSubPic")
	public ResponseEntity<byte[]> getItemSubPic(Integer itemId) throws Exception {
		log.info("/getItemSubPic GET");
		InputStream inputStream = null;
		ResponseEntity<byte[]> responseEntity = null;
		String fileName = itemService.getItemSubPic(itemId);
		try {
			String formattedName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mediaType = getMediaType(formattedName);
			HttpHeaders httpHeaders = new HttpHeaders();
			inputStream = new FileInputStream(uploadPath + File.separator + fileName);
			if (mediaType != null) {
				httpHeaders.setContentType(mediaType);
			}
			responseEntity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			responseEntity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			inputStream.close();
		}
		return responseEntity;
	}
	
	private MediaType getMediaType(String formatName) {
		log.info("getMediaType()");
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
