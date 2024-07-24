package com.infosys.GymManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Feedback {
	
	@Id
	private Long id;
	private String name;
	
	@Lob
	private String content;
	
	
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback(Long id, String name, String content, byte[] reviewImage) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	
	
	

}
