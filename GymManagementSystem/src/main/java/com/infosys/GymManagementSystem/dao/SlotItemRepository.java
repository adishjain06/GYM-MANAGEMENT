package com.infosys.GymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infosys.GymManagementSystem.bean.SlotItem;
import com.infosys.GymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{
	
}
 