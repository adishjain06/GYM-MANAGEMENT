package com.infosys.GymManagementSystem.dao;

import java.util.List;

import com.infosys.GymManagementSystem.bean.GymItem;

public interface GymItemDao {
	public void saveNewItem(GymItem gymItem);
	public List<GymItem> displayAllItems();
	public GymItem findItemsById(Long id);
	public Long generateItemId();
	public Integer findTotalSeatById(long id);
	public void deleteById(Long id);
	
	public void updateGymItem(GymItem gymItem);

}
