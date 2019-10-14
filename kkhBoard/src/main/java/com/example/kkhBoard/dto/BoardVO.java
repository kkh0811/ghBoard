package com.example.kkhBoard.dto;
import java.sql.Date;

public class BoardVO {
	private int id;
	private String title;
	private String content;
	private String writer;
	private Date createdDate;
	private Date modifiedDate;
	private boolean statusT_F;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public boolean isStatusT_F() {
		return statusT_F;
	}
	public void setStatusT_F(boolean statusT_F) {
		this.statusT_F = statusT_F;
	}
}

