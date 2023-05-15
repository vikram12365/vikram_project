package com.storydetails.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
@Entity
@Table(name="STORYDETAILS")
public class StoryDetails {

	
	@Id
	@Column(name="STORY_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "STORYDETAILS")
	@SequenceGenerator(name = "STORYDETAILS", sequenceName = "STORYDETAILS_SEQ", allocationSize = 1)
	private int story_id;
	
	@Column(name="TITLE")
	private String title;
	
	@Column(name="STORY_DETAILS")
	private String story_details;
	
	@Column(name="CREATION_DATE")
	private Date creation_date;
	
	@Column(name="LAST_UPDATE_DATE")
	private Date last_update_date;

	public int getStory_id() {
		return story_id;
	}

	public void setStory_id(int story_id) {
		this.story_id = story_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStory_details() {
		return story_details;
	}

	public void setStory_details(String story_details) {
		this.story_details = story_details;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public Date getLast_update_date() {
		return last_update_date;
	}

	public void setLast_update_date(Date last_update_date) {
		this.last_update_date = last_update_date;
	}
	
	
	
	

}
