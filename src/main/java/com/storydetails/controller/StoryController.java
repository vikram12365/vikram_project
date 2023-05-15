package com.storydetails.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.storydetails.model.StoryComments;
import com.storydetails.model.StoryDetails;
import com.storydetails.sevice.StoryService;

@CrossOrigin("*")
@RestController
public class StoryController {
	
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Autowired
	StoryService storyservice;
	
	@GetMapping("/getStoryDetails")
	public String getStoryDetails()
	{
		return "Prashant";
	}
	
	@Transactional
	@PostMapping("/saveStoryDetails")
	public StoryDetails saveStoryDetails(@RequestBody StoryDetails sd)
	{
		
		StoryDetails story = new StoryDetails();
		
		story.setCreation_date(new Date());
		story.setStory_details(sd.getStory_details());
		story.setTitle(sd.getTitle());
		story.setLast_update_date(new Date());
		
		hibernateTemplate.save(story);
		
		return story;
	}
	
	@GetMapping("/getTopStories")
	public ArrayList<StoryDetails> getTopStories()
	{
		System.out.println("in top stories");
		ArrayList<StoryDetails> stories = storyservice.getTopStories();
		
		return stories;
	}
	
	@RequestMapping("/")
	public ModelAndView viewStories()
	{
		System.out.println("in viewStories");
		
		return new ModelAndView("viewstories");
	}
	
	@GetMapping("/getComments")
	public ArrayList<StoryComments> getComments(@RequestParam int story_id)
	{
		System.out.println("in top stories"+story_id);
		ArrayList<StoryComments> comments = storyservice.getComments(story_id);
		return comments;
	}
}
