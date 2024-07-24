package com.infosys.GymManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.infosys.GymManagementSystem.bean.Feedback;
import com.infosys.GymManagementSystem.dao.FeedbackDao;
import com.infosys.GymManagementSystem.service.GymUserService;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackDao feedbackDao;
    
    @Autowired
    private GymUserService userService;

    @PostMapping("/feedback")
    public String submitFeedback(@ModelAttribute Feedback feedback) {
        Long newId = feedbackDao.generateFeedbackId();
        feedback.setId(newId);
        feedback.setName(userService.getUser().getUsername());
        feedbackDao.save(feedback);
        return "redirect:/index";
    }

    @GetMapping("/feedbacks")
    public String listFeedbacks(Model model) {
        model.addAttribute("feedbacks", feedbackDao.findAll());
        return "feedbackList";
    }
}