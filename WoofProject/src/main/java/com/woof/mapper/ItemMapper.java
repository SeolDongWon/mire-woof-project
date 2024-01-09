package com.woof.mapper;

import java.util.List;

import com.woof.domain.Item;

public interface ItemMapper {
	
	public Item getItem(Item item) throws Exception;

	public List<Item> getItemList() throws Exception;
	
	public void insertItem(Item item) throws Exception;
	
	public void modifyItem(Item item) throws Exception;
	
	public void deleteItem(Item item) throws Exception;
	
	public String getItemMainPic(Integer itemId) throws Exception;
	
	public String getItemSubPic(Integer itemId) throws Exception;
	
	public List<Item> searchItemType(Item item) throws Exception;
	
	public List<Item> searchItemKeyword(Item item) throws Exception;
}
