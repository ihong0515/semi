package com.hotel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HotelDAO {
	private static HotelDAO instance;
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql;
	
	public HotelDAO() {	}
	
	public static HotelDAO getInstance() {
		if(instance == null) {
			instance = new HotelDAO();
		}
		instance.connect();
		return instance;
	}
	
	private void connect() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc/myoracle");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<HotelDTO> getHotelList(String Location, String keyword, String startDate, String endDate) {
		ArrayList<HotelDTO> list = new ArrayList<HotelDTO>();
		try {
			sql = "select distinct a.* from hotel a join " + 
					"(select r.* from room r, " + 
					"(select reserv_roomno from reserv " + 
					"where (reserv_start <= ? and ? < reserv_end) " + 
					"or (reserv_start < ? and ? < reserv_end)) " + 
					"where room_no != reserv_roomno " + 
					"order by room_hotelno asc) b " + 
					"on a.hotel_no = b.room_hotelno " + 
					"where room_hotelno " + 
					"in(select hotel_no from hotel where " + 
					"hotel_location like '%"+keyword+"%' " + 
					"or hotel_name like '%"+keyword+"%')";
			ps = con.prepareStatement(sql);
			ps.setString(1, startDate);
			ps.setString(2, startDate);
			ps.setString(3, endDate);
			ps.setString(4, endDate);
		
			rs = ps.executeQuery();
			if(rs.next()) {
				HotelDTO dto = new HotelDTO();
				dto.setHotel_No(rs.getInt("hotel_no"));
				dto.setHotel_Name(rs.getString("hotel_name"));
				dto.setHotel_Phone(rs.getString("hotel_phone"));
				dto.setHotel_Addr(rs.getString("hotel_addr"));
				dto.setHotel_Location(rs.getString("hotel_location"));
				dto.setHotel_Email(rs.getString("hotel_email"));
				dto.setHotel_Room_Count(rs.getInt("hotel_room_count"));
				dto.setHotel_Establish(rs.getInt("hotel_establish"));
				dto.setHotel_Photo_Folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_price_Min(rs.getInt("hotel_price_min"));
				dto.setHotel_price_Max(rs.getInt("hotel_price_max"));
				dto.setHotel_People_Min(rs.getInt("hotel_people_min"));
				dto.setHotel_People_Max(rs.getInt("hotel_people_max"));
				dto.setHotel_Star(rs.getInt("hotel_star"));
				dto.setHotel_Point(rs.getInt("hotel_point"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	public ArrayList<RoomDTO> getRoomCont(int no) {
		ArrayList<RoomDTO> list = new ArrayList<>();
		
		try {
			sql = "select * from room where room_hotelno = ?;";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while(rs.next()){
				RoomDTO dto = new RoomDTO();
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}