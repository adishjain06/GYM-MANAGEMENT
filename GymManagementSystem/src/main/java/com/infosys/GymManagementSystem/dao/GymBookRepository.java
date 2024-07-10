package com.infosys.GymManagementSystem.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.GymManagementSystem.bean.GymBook;


public interface GymBookRepository extends JpaRepository<GymBook, Long> {

	@Query("SELECT max(bookingId) from GymBook")
	public Long findLastBookingId();
	
}