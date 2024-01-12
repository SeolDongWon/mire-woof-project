package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Item;
import com.woof.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/getItem")
	public void getItem(Item item) throws Exception {
		itemService.getItem(item);
	}
	
	@RequestMapping("/getItemList")
	public void getItemList(Model model) throws Exception {
		List<Item> itemList = itemService.getItemList();
		model.addAttribute("itemList", itemList);
	}
	
	@RequestMapping("/insertItem")
	public void insertItem(Item item) throws Exception {
		itemService.insertItem(item);
	}
	
	@RequestMapping("/modifyItem")
	public void modifyItem(Item item) throws Exception {
		itemService.modifyItem(item);
	}
	
	@RequestMapping("/deleteItem")
	public void deleteItem(Item item) throws Exception {
		itemService.deleteItem(item);
	}
	
	@RequestMapping("/searchItemType")
	public void searchItemType(Item item) throws Exception {
		itemService.searchItemType(item);
	}
	
	@RequestMapping("/searchItemKeyword")
	public void searchItemKeyword(Item item) throws Exception {
		itemService.searchItemKeyword(item);
	}
	
	
}
