package com.storydetails.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="STORYCOMMENTS")
public class StoryComments {
	
	@Id
	@Column(name="COMMENT_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "STORYCOMMENTS")
	@SequenceGenerator(name = "STORYCOMMENTS", sequenceName = "STORYCOMMENTS_SEQ", allocationSize = 1)
	private int comment_id;
	
	@Column(name="STORY_ID")
	private int story_id;
	
	
	@Column(name="COMMENT")
	private String comment;


	public int getComment_id() {
		return comment_id;
	}


	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}


	public int getStory_id() {
		return story_id;
	}


	public void setStory_id(int story_id) {
		this.story_id = story_id;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
	
}
