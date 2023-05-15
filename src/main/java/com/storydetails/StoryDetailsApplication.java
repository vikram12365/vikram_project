package com.storydetails;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
@ComponentScan({ "com.storydetails" })
@EntityScan("com.storydetails")
public class StoryDetailsApplication {

	public static void main(String[] args) {
		SpringApplication.run(StoryDetailsApplication.class, args);
	}

}
