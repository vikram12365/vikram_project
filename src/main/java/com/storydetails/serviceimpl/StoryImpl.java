package com.storydetails.serviceimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.storydetails.model.StoryComments;
import com.storydetails.model.StoryDetails;
import com.storydetails.sevice.StoryService;


@Repository
public class StoryImpl implements StoryService{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public ArrayList<StoryDetails> getTopStories() {
		
		String sql="select * from(" + 
				"select * from storydetails order by LAST_UPDATE_DATE) where rownum <=4";
		List<StoryDetails> dm=jdbcTemplate.query(sql, new RowMapper<StoryDetails>() {

			@Override
			public StoryDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				StoryDetails db = new StoryDetails();
				
				db.setStory_id(rs.getInt("STORY_ID"));
				db.setTitle(rs.getString("TITLE"));
				db.setStory_details(rs.getString("STORY_DETAILS"));
				db.setLast_update_date(rs.getDate("LAST_UPDATE_DATE"));
				db.setCreation_date(rs.getDate("CREATION_DATE"));
				
				return db;
			}
			
		});
		return (ArrayList<StoryDetails>) dm;
		
	}

	@Override
	public ArrayList<StoryComments> getComments(int story_id) {
		String sql="SELECT * FROM STORYCOMMENTS WHERE STORY_ID = "+story_id+"";
		List<StoryComments> dm=jdbcTemplate.query(sql, new RowMapper<StoryComments>() {

			@Override
			public StoryComments mapRow(ResultSet rs, int rowNum) throws SQLException {
				StoryComments db = new StoryComments();
				
				db.setStory_id(rs.getInt("STORY_ID"));
				db.setComment(rs.getString(""));
				return db;
			}
			
		});
		return (ArrayList<StoryComments>) dm;
	}	
}
