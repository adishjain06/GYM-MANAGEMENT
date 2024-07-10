package com.infosys.GymManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class GymBook {
	@Id
	private Long bookingId;
	private Long slotId;
	private Long itemId;
	private String username;
	public GymBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GymBook(Long bookingId, Long slotId, Long itemId, String username) {
		super();
		this.bookingId = bookingId;
		this.slotId = slotId;
		this.itemId = itemId;
		this.username = username;
	}
	public Long getBookingId() {
		return bookingId;
	}
	public void setBookingId(Long bookingId) {
		this.bookingId = bookingId;
	}
	public Long getSlotId() {
		return slotId;
	}
	public void setSlotId(Long slotId) {
		this.slotId = slotId;
	}
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
