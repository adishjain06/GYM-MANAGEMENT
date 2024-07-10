package com.infosys.GymManagementSystem.dao;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.GymManagementSystem.bean.SlotItem;
import com.infosys.GymManagementSystem.bean.SlotItemEmbed;

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
	@Override
	public List<SlotItem> displayAllItem() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public SlotItem findItemById(SlotItemEmbed id) {
		// TODO Auto-generated method stub
		return repository.findById(id).get();
	}
	
	@Override
	public Integer findSeatBookedById(SlotItemEmbed id) {
		return repository.findSeatBookedById(id);
	}
	@Override
	public Set<SlotItemEmbed> findAllEmbeds(){
		return repository.findAllEmbeds();
	}
	

}




	

