package com.woof.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.woof.domain.Item;
import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.service.ItemService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	// ALL function - retrieve item details
	@GetMapping("/getItem")
	public String getItem(@RequestParam("itemNo") int itemNo, Model model) throws Exception {
		log.info("/getItem GET");
		Item item = itemService.getItem(itemNo);
		model.addAttribute("item", item);
		return "item/item";
	}
	
	// ALL function - retrieve list of items
	@GetMapping("/itemList")
	public void getItemList(Item item, Model model, PageRequest pageRequest, Pagination pagination) throws Exception {
		log.info("/itemList GET getItemType() : " + item.getItemType());
		if(item.getItemType() == null) {
			item.setItemType("");
		}
		pageRequest.setKeywordTitle(item.getItemType());
		if(pageRequest.getKeyword() == null) {
			pageRequest.setKeyword("");
		}
		pageRequest.setKeywordDesc(pageRequest.getKeyword());
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(itemService.countItemList(pageRequest));
		model.addAttribute("pagination", pagination);
		
		List<Item> itemList = itemService.getItemList(pageRequest);
		model.addAttribute("itemList", itemList);
	}
	
	// ADMIN function - create a new item (view)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin/insertItem")
	public void insertItemGet(Model model) throws Exception {
		log.info("/admin/insertItem GET");
		model.addAttribute(new Item());
	}
	
	// ADMIN function - create a new item (business logic)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin/insertItem")
	public String insertItem(Item item) throws Exception {
		log.info("/admin/insertItem POST");
		List<MultipartFile> pictures = item.getPictures();
		for(int i = 0; i < pictures.size(); i++) {
			// store path of uploaded photos into DB
			MultipartFile file = pictures.get(i);
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				if(i == 0) {
					item.setItemMainPic(savedName);
				} else if(i == 1) {
					item.setItemSubPic(savedName);
			}
		}
		// create Item in DB
		itemService.insertItem(item);
		return "redirect:/item/itemList";
	}
	
	// method to upload file into path designated in application.properties with a unique UUID
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		log.info("uploadFile()");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	// ADMIN function - modify item details (view)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modifyItem")
	public String modifyItem(Item item, Model model,PageRequest pageRequest) throws Exception {
		
		if(item.getItemType()==null) {
			item.setItemType("");
		}
		pageRequest.setKeywordTitle(item.getItemType());
		
		if(pageRequest.getKeyword()==null) {
			pageRequest.setKeyword("");
		}
		pageRequest.setKeywordDesc(pageRequest.getKeyword());
		
		model.addAttribute(item);
		List<Item> itemList = itemService.getAllItemList();
		model.addAttribute(itemList);
		return "item/admin/modifyItem";
	}
	
	// ADMIN function - modify item details (business logic)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modifyItem")
	public String modifyItem(Item item) throws Exception {
		log.info("/modifyItem POST item: " + item.toString());
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
		return "redirect:/item/itemList";
	}
	
	// ADMIN function - toggle status of item CLOSED <-> OPEN (filtered in view)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/toggleItemStatus")
	public String toggleItemStatus(@RequestParam("itemNo") int itemNo) throws Exception {
		log.info("/toggleItemStatus GET");
		itemService.toggleItemStatus(itemNo);
		return "redirect:/item/itemList";
	}
	
	// ALL function - retrieve main picture using path uploaded into designated storage folder
	@ResponseBody
	@GetMapping("/getItemMainPic")
	public ResponseEntity<byte[]> getItemMainPic(Integer itemNo) throws Exception {
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
	
	// ALL function - retrieve sub picture using path uploaded into designated storage folder
	@ResponseBody
	@GetMapping("/getItemSubPic")
	public ResponseEntity<byte[]> getItemSubPic(Integer itemNo) throws Exception {
		InputStream inputStream = null;
		ResponseEntity<byte[]> responseEntity = null;
		String fileName = itemService.getItemSubPic(itemNo);
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
	
	// method to retrieve type of media uploaded
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
	
	// ADMIN function - get modifyItemForm.jsp, separate from modifyItem.jsp (view)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/getModifyItemForm")
	public String getModifyItemForm(Item item, Model model) throws Exception {
		log.info("/getModifyItemForm GET itemNo: " + item.getItemNo());
		Item item_ = itemService.getItem(item.getItemNo());
		model.addAttribute(item_);
		return "item/admin/modifyItemForm";
	}
	
	// ALL function - search item by condition and keywords
	@PostMapping("/searchByKeyword")
	public String searchByKeyword(PageRequest pageRequest, Model model) throws Exception {
		List<Item> itemList = new ArrayList<Item>();
		String condition = pageRequest.getCondition();
		
		log.info("/searchByKeyword POST condition: " + condition);
		switch(condition) {
			case "itemName": itemList = itemService.searchItemName(pageRequest); break;
			case "itemType": itemList = itemService.searchItemType(pageRequest); break;
		}
		model.addAttribute(itemList);
		return "item/itemList";
	}
	
	// ALL function - filter items by type, used in main menu - sub menu
	@GetMapping("/listItemType")
	public String listItemType(Item item, Model model) throws Exception {
		List<Item> itemList = new ArrayList<Item>();
		itemList = itemService.listItemType(item);
		log.info("/listItemType GET itemList: " + itemList.toString());
		model.addAttribute(itemList);
		return "item/itemList";
	}
}
