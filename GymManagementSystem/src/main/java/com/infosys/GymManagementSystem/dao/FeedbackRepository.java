package com.infosys.GymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.GymManagementSystem.bean.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
	 @Query("SELECT max(f.id) FROM Feedback f")
	    Long findMaxId();
}


