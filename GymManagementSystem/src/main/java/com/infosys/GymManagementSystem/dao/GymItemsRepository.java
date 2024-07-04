package com.infosys.GymManagementSystem.dao;

import com.infosys.GymManagementSystem.bean.GymItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
 
public interface GymItemsRepository extends JpaRepository< GymItem,Long>{
		@Query("select max(itemId) from GymItem")
		public Long findLastItemId();
		@Query("select totalSeat from GymItem where itemId = ?1")
		public Integer findTotalSeatById(Long id);
}

 
