package com.woof.service;

import java.util.List;

import com.woof.domain.Item;
import com.woof.domain.PageRequest;
import com.woof.domain.Service;

public interface ItemService {
	
	public Item getItem(int itemNo) throws Exception;

	/* public List<Item> getItemList() throws Exception; */
	public List<Item> getItemList(PageRequest pageRequest) throws Exception;
	public List<Item> getMainItemList() throws Exception;
	
	public void insertItem(Item item) throws Exception;
	
	public void modifyItem(Item item) throws Exception;
	
	public void toggleItemStatus(int itemNo) throws Exception;
	
	public String getItemMainPic(Integer itemId) throws Exception;
	
	public String getItemSubPic(Integer itemId) throws Exception;
	
	public List<Item> searchItemType(PageRequest pageRequest) throws Exception;
	
	public List<Item> searchItemName(PageRequest pageRequest) throws Exception;
	
	public List<Item> listItemType(Item item) throws Exception;
	
	public int countItemList(PageRequest pageRequest) throws Exception;
	
	public List<Item> getAllItemList() throws Exception;
}
