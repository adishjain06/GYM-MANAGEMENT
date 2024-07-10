package com.infosys.GymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.GymManagementSystem.bean.GymBook;
@Service
@Repository
public class GymBookDaoImpl implements GymBookDao {

	
	@Autowired
	private GymBookRepository repository;
	
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
		repository.deleteById(id);
	}

}
