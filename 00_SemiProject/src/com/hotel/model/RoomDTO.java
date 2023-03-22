package com.hotel.model;

public class RoomDTO {
	private int hotelId;
	private int roomId;
	private int roomFee;
	private int roomGuest;
	private String roomName;
	
	public RoomDTO() {	}

	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getRoomFee() {
		return roomFee;
	}

	public void setRoomFee(int roomFee) {
		this.roomFee = roomFee;
	}

	public int getRoomGuest() {
		return roomGuest;
	}

	public void setRoomGuest(int roomGuest) {
		this.roomGuest = roomGuest;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
}