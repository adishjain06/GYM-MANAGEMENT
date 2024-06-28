package com.infosys.GymManagementSystem.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.GymManagementSystem.bean.SlotItem;

@Service
@Repository
public class SlotItemDaoImpl implements SlotItemDao{

	@Autowired
	private SlotItemRepository repository;
	
	@Override
	public void save(SlotItem slotItem) {
		// TODO Auto-generated method stub
		repository.save(slotItem);
	}

}
