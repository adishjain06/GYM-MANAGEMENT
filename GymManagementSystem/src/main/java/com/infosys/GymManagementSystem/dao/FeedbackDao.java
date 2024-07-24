package com.infosys.GymManagementSystem.dao;

import java.util.List;

import com.infosys.GymManagementSystem.bean.Feedback;

public interface FeedbackDao {
	void save(Feedback feedback);
    Long generateFeedbackId();
    List<Feedback> findAll();
    Feedback findById(Long id);
}
