package com.infosys.GymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.GymManagementSystem.bean.Slot;
@Repository
@Service
public class SlotDaoImpl implements SlotDao {

	@Autowired
	private GymBookDao gymBookDao;

	@Autowired
	private SlotItemDao slotItemDao;

	@Autowired
	private SlotRepository repository;
	@Override
	public void saveNewSlot(Slot slotItem) {
		// TODO Auto-generated method stub
		repository.save(slotItem);
	}
	@Override
	public List<Slot> displayAllSlot() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}
	@Override
	public Slot findSlotById(Long id) {
		// TODO Auto-generated method stub
		return repository.findById(id).get();
	}
	@Override
	public Long generateSlotId() {
		// TODO Auto-generated method stub
		Long val=repository.findLastSlotId();
		if(val==null)
			val=1L;
		else
			val=val+1;
		
		return val;
		
	}
	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		 gymBookDao.deleteBookingsBySlotId(id);
		    slotItemDao.deleteSlotItemsBySlotId(id);
		repository.deleteById(id);
		
	}
	
	@Override
	public void updateSlot(Slot slot) {
	    repository.save(slot);
	}

	
	
	
	
	
}
