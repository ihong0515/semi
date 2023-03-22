package com.hotel.model;

public class HotelDTO {
	private int HOTELID;
	private String HOTELNAME;
	private String HOTELPHONE;
	private int HOTELSTAR;
	private int HOTELPOINT;
	private String WIFI;
	private String RESTAURANT;
	private String PARKING;
	
	public HotelDTO() {	}

	public int getHOTELID() {
		return HOTELID;
	}

	public void setHOTELID(int hOTELID) {
		HOTELID = hOTELID;
	}

	public String getHOTELNAME() {
		return HOTELNAME;
	}

	public void setHOTELNAME(String hOTELNAME) {
		HOTELNAME = hOTELNAME;
	}

	public String getHOTELPHONE() {
		return HOTELPHONE;
	}

	public void setHOTELPHONE(String hOTELPHONE) {
		HOTELPHONE = hOTELPHONE;
	}

	public int getHOTELSTAR() {
		return HOTELSTAR;
	}

	public void setHOTELSTAR(int hOTELSTAR) {
		HOTELSTAR = hOTELSTAR;
	}

	public int getHOTELPOINT() {
		return HOTELPOINT;
	}

	public void setHOTELPOINT(int hOTELPOINT) {
		HOTELPOINT = hOTELPOINT;
	}

	public String getWIFI() {
		return WIFI;
	}

	public void setWIFI(String wIFI) {
		WIFI = wIFI;
	}

	public String getRESTAURANT() {
		return RESTAURANT;
	}

	public void setRESTAURANT(String rESTAURANT) {
		RESTAURANT = rESTAURANT;
	}

	public String getPARKING() {
		return PARKING;
	}

	public void setPARKING(String pARKING) {
		PARKING = pARKING;
	}
}