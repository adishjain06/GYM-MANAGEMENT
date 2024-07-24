
package com.infosys.GymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infosys.GymManagementSystem.bean.Feedback;


@Repository
public class FeedbackDaoImpl implements FeedbackDao {

    @Autowired
    private FeedbackRepository feedbackRepository;

    @Override
    public void save(Feedback feedback) {
        feedbackRepository.save(feedback);
    }

    @Override
    public Long generateFeedbackId() {
        Long maxId = feedbackRepository.findMaxId();
        return (maxId != null ? maxId : 1000000L) + 1;
    }

    @Override
    public List<Feedback> findAll() {
        return feedbackRepository.findAll();
    }

    @Override
    public Feedback findById(Long id) {
        return feedbackRepository.findById(id).orElse(null);
    }
}
