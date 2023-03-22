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

	
	private int getHotelPrice(int no) {
		int price = 0;
		
		try {
			sql = "select min(roomfee) from room where hotelid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			if(rs.next()) {
				price = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	
	public HotelDTO getHotelCont(int no) {
		HotelDTO dto = null;
		
		try {
			sql = "select * from hotel a join hotelpolicy b on a.hotelid = b.hotelid where hotelid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new HotelDTO();
				dto.setHotelId(rs.getInt("hotelid"));
				dto.setHotelName(rs.getString("hotelname"));
				dto.setHotelPhone(rs.getString("hotelphone"));
				dto.setHotelStar(rs.getInt("hotelstar"));
				dto.setHotelPoint(rs.getInt("hotelpoint"));
				dto.setWifi(rs.getString("wifi"));
				dto.setRestaurant(rs.getString("restaurant"));
				dto.setParking(rs.getString("parking"));
				dto.setPrice(getHotelPrice(no));
				dto.setLocation(rs.getString("loc"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public ArrayList<RoomDTO> getRoomCont(int no) {
		ArrayList<RoomDTO> list = new ArrayList<>();
		
		try {
			sql = "select * from room where hotelid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while(rs.next()){
				RoomDTO dto = new RoomDTO();
				dto.setRoomId(rs.getInt("roomid"));
				dto.setRoomFee(rs.getInt("roomfee"));
				dto.setRoomGuest(rs.getInt("roomguest"));
				dto.setRoomName(rs.getString("roomname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}