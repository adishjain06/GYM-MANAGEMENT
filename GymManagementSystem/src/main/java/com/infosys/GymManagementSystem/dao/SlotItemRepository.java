package com.infosys.GymManagementSystem.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.infosys.GymManagementSystem.bean.SlotItem;
import com.infosys.GymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{
	@Query("SELECT seatBooked from SlotItem a where embeddedId=?1")
	public Integer findSeatBookedById(SlotItemEmbed id);
	
	@Query("SELECT embeddedId from SlotItem")
	public Set<SlotItemEmbed> findAllEmbeds();
	
	@Query("SELECT si FROM SlotItem si WHERE si.id.slotId = :slotId")
    List<SlotItem> findBySlotId(@Param("slotId") Long slotId);

    @Query("SELECT si FROM SlotItem si WHERE si.id.itemId = :itemId")
    List<SlotItem> findByItemId(@Param("itemId") Long itemId);
}



