package com.storydetails.sevice;

import java.util.ArrayList;

import com.storydetails.model.StoryComments;
import com.storydetails.model.StoryDetails;

public interface StoryService {

	ArrayList<StoryDetails> getTopStories();

	ArrayList<StoryComments> getComments(int story_id);

}
