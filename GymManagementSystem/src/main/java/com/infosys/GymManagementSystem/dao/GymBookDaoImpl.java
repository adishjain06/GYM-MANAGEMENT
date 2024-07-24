package com.infosys.GymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.GymManagementSystem.bean.GymBook;
import com.infosys.GymManagementSystem.bean.SlotItem;
import com.infosys.GymManagementSystem.bean.SlotItemEmbed;
@Service
@Repository
public class GymBookDaoImpl implements GymBookDao {

	
	@Autowired
	private GymBookRepository repository;
	
	@Autowired
	private SlotItemDao slotItemDao;
	
	@Override
	public void save(GymBook gymBook) {
		// TODO Auto-generated method stub
		repository.save(gymBook);
	}

	@Override
	public Long generateBookingId() {
		// TODO Auto-generated method stub
		Long newId= repository.findLastBookingId();
		if(newId==null)
			newId=1000001L;
		else
			newId=newId+1;
		
		return newId;
	}

	@Override
	public List<GymBook> getBookList() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public GymBook findBookInfoById(Long id) {
		// TODO Auto-generated method stub
		return repository.findById(id).get();
	}

	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		GymBook gymBook = repository.findById(id).orElse(null);
	    if (gymBook != null) {
	        SlotItemEmbed embedId = new SlotItemEmbed(gymBook.getSlotId(), gymBook.getItemId());
	        SlotItem slotItem = slotItemDao.findItemById(embedId);
	        if (slotItem != null) {
	            slotItem.setSeatBooked(slotItem.getSeatBooked() - 1);
	            slotItemDao.save(slotItem);
	        }
	    }
		repository.deleteById(id);
	}

	@Override
	public List<GymBook> findBookingsByUsername(String username) {
		// TODO Auto-generated method stub
		return repository.findByUsername(username);
	}
	
	@Override
	public void deleteBookingsBySlotId(Long slotId) {
	    List<GymBook> bookings = repository.findBySlotId(slotId);
	    repository.deleteAll(bookings);
	}

	@Override
	public void deleteBookingsByItemId(Long itemId) {
	    List<GymBook> bookings = repository.findByItemId(itemId);
	    repository.deleteAll(bookings);
	}



    
}
