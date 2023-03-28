package com.model.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			sql = "select * from hotel where hotel_no "
					+ "in(select room_hotelno from room where room_no "
					+ "not in(select reserv_roomno from reserv "
					+ "where (reserv_start <= ? and ? < reserv_end) "
					+ "or (reserv_start < ? and ? < reserv_end)))"
					+ "and hotel_location = '"+Location+"'";
			if(keyword != null) {
				sql += " and (hotel_location like '%"+keyword+"%' or hotel_name like '%"+keyword+"%')";
			}
			ps = con.prepareStatement(sql);
			ps.setString(1, startDate);
			ps.setString(2, startDate);
			ps.setString(3, endDate);
			ps.setString(4, endDate);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				HotelDTO dto = new HotelDTO();
				dto.setHotel_no(rs.getInt("hotel_no"));
				dto.setHotel_name(rs.getString("hotel_name"));
				dto.setHotel_phone(rs.getString("hotel_phone"));
				dto.setHotel_addr(rs.getString("hotel_addr"));
				dto.setHotel_location(rs.getString("hotel_location"));
				dto.setHotel_email(rs.getString("hotel_email"));
				dto.setHotel_room_count(rs.getInt("hotel_room_count"));
				dto.setHotel_establish(rs.getInt("hotel_establish"));
				dto.setHotel_photo_folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_price_min(rs.getInt("hotel_price_min"));
				dto.setHotel_price_max(rs.getInt("hotel_price_max"));
				dto.setHotel_people_min(rs.getInt("hotel_people_min"));
				dto.setHotel_people_max(rs.getInt("hotel_people_max"));
				dto.setHotel_star(rs.getInt("hotel_star"));
				dto.setHotel_point(rs.getInt("hotel_point"));
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

	public ArrayList<RoomDTO> getRoomList(int no) {
		ArrayList<RoomDTO> list = new ArrayList<>();
		
		try {
			sql = "select * from room where room_hotelno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while(rs.next()){
				RoomDTO dto = new RoomDTO();
				dto.setRoom_no(rs.getInt("room_no"));
				dto.setRoom_hotelno(rs.getInt("room_hotelno"));
				dto.setRoom_name(rs.getString("room_name"));
				dto.setRoom_price(rs.getInt("room_price"));
				dto.setRoom_bed(rs.getString("room_bed"));
				dto.setRoom_size(rs.getString("room_size"));
				dto.setRoom_people_min(rs.getInt("room_people_min"));
				dto.setRoom_people_max(rs.getInt("room_people_max"));
				dto.setRoom_photo_folder(rs.getString("room_photo_folder"));
				dto.setRoom_checkin(rs.getString("room_checkin"));
				dto.setRoom_checkout(rs.getString("room_checkout"));
				dto.setRoom_breakfast(rs.getString("room_breakfast"));
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

	public HotelDTO getHotelContent(int hotel_no) {
		HotelDTO dto = null;
		
		try {
			sql = "select * from hotel where hotel_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new HotelDTO();
				dto.setHotel_no(rs.getInt("hotel_no"));
				dto.setHotel_name(rs.getString("hotel_name"));
				dto.setHotel_phone(rs.getString("hotel_phone"));
				dto.setHotel_addr(rs.getString("hotel_addr"));
				dto.setHotel_location(rs.getString("hotel_location"));
				dto.setHotel_email(rs.getString("hotel_email"));
				dto.setHotel_room_count(rs.getInt("hotel_room_count"));
				dto.setHotel_establish(rs.getInt("hotel_establish"));
				dto.setHotel_photo_folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_price_min(rs.getInt("hotel_price_min"));
				dto.setHotel_price_max(rs.getInt("hotel_price_max"));
				dto.setHotel_people_min(rs.getInt("hotel_people_min"));
				dto.setHotel_people_max(rs.getInt("hotel_people_max"));
				dto.setHotel_star(rs.getInt("hotel_star"));
				dto.setHotel_point(rs.getInt("hotel_point"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}

	public HotelPolicyDTO getHotelPolicyContent(int hotel_no) {
		HotelPolicyDTO dto = null;
		
		try {
			sql = "select * from hotelpolicy where hp_hotelno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new HotelPolicyDTO();
				dto.setHp_HotelNo(rs.getInt("hp_hotelNo"));
				dto.setHp_Wifi(rs.getString("hp_Wifi"));
				dto.setHp_Parking(rs.getString("hp_Parking"));
				dto.setHp_Tub(rs.getString("hp_Tub"));
				dto.setHp_Pool(rs.getString("hp_Pool"));
				dto.setHp_Restaurant(rs.getString("hp_Restaurant"));
				dto.setHp_Fitness(rs.getString("hp_Fitness"));
				dto.setHp_Bar(rs.getString("hp_Bar"));
				dto.setHp_Terrace(rs.getString("hp_Terrace"));
				dto.setHp_Sauna(rs.getString("hp_Sauna"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}

	public RoomDTO getRoomCont(int room_no) {
		RoomDTO dto = null;
		
		try {
			sql = "select * from room where room_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, room_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new RoomDTO();
				dto.setRoom_no(rs.getInt("room_no"));
				dto.setRoom_hotelno(rs.getInt("room_hotelno"));
				dto.setRoom_name(rs.getString("room_name"));
				dto.setRoom_price(rs.getInt("room_price"));
				dto.setRoom_bed(rs.getString("room_bed"));
				dto.setRoom_size(rs.getString("room_size"));
				dto.setRoom_people_min(rs.getInt("room_people_min"));
				dto.setRoom_people_max(rs.getInt("room_people_max"));
				dto.setRoom_photo_folder(rs.getString("room_photo_folder"));
				dto.setRoom_checkin(rs.getString("room_checkin"));
				dto.setRoom_checkout(rs.getString("room_checkout"));
				dto.setRoom_breakfast(rs.getString("room_breakfast"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<HotelDTO>getHotelStarSearch(String location) {
		
		List<HotelDTO>list = new ArrayList<HotelDTO>();
		HotelDTO dto = null;
		try {
			connect();
			sql = "select hotel_Photo_Folder,hotel_name,hotel_Star,hotel_min_price"
					+ "from hotel"
					+ "where hotel_Location = ?"
					+ "order by hotel_star";
			ps = con.prepareStatement(sql);
			ps.setString(1, location);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto =new  HotelDTO();
				dto.setHotel_photo_folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_name(rs.getNString("hotel_name"));
				dto.setHotel_star(rs.getInt("hotel_star"));
				dto.setHotel_price_min(rs.getInt("hotel_price_min"));
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

	public ArrayList<HotelDTO> getHotelDetailList(int price_min, int price_max, int people, String[] list, String point,
			String bed) {
		ArrayList<HotelDTO> detail_list = new ArrayList<HotelDTO>();
		
		try {
			sql = "select * from hotel where hotel_price_min >= '"+price_min+"' and hotel_price_max <= '"+price_max+"'";
			if(people!=0) {
				sql += " and hotel_people_min >= '"+people+"' and hotel_people_max <= '"+people+"'";
			}
			if(list!=null) {
				sql += " and(";
				for(int i=0;i<list.length;i++) {
					sql += "hotel_star = '"+list[i]+"'";
					if(i<list.length-1) {
						sql += " or ";
					}
				}
				sql += ")";
			}
			if(point!=null) {
				sql += " and hotel_point >= '"+point+"'";
			}
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				HotelDTO dto = new HotelDTO();
				dto.setHotel_no(rs.getInt("hotel_no"));
				dto.setHotel_name(rs.getString("hotel_name"));
				dto.setHotel_phone(rs.getString("hotel_phone"));
				dto.setHotel_addr(rs.getString("hotel_addr"));
				dto.setHotel_location(rs.getString("hotel_location"));
				dto.setHotel_email(rs.getString("hotel_email"));
				dto.setHotel_room_count(rs.getInt("hotel_room_count"));
				dto.setHotel_establish(rs.getInt("hotel_establish"));
				dto.setHotel_photo_folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_price_min(rs.getInt("hotel_price_min"));
				dto.setHotel_price_max(rs.getInt("hotel_price_max"));
				dto.setHotel_people_min(rs.getInt("hotel_people_min"));
				dto.setHotel_people_max(rs.getInt("hotel_people_max"));
				dto.setHotel_star(rs.getInt("hotel_star"));
				dto.setHotel_point(rs.getInt("hotel_point"));
				detail_list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return detail_list;
	}

	public ArrayList<HotelDTO> getHotelListSort(String Location, String keyword, String startDate,
			String endDate, String field) {
		ArrayList<HotelDTO> list = new ArrayList<HotelDTO>();
		try {
			sql = "select * from hotel where hotel_no "
					+ "in(select room_hotelno from room where room_no "
					+ "not in(select reserv_roomno from reserv "
					+ "where (reserv_start <= ? and ? < reserv_end) "
					+ "or (reserv_start < ? and ? < reserv_end)))"
					+ "and hotel_location = '"+Location+"'";
			if(keyword != null) {
				sql += " and (hotel_location like '%"+keyword+"%' or hotel_name like '%"+keyword+"%')";
			}
			if(field.equals("hotel_price_min")) {
				sql += " order by "+field+" asc";
			}else {
				sql += " order by "+field+" desc";
			}
			ps = con.prepareStatement(sql);
			ps.setString(1, startDate);
			ps.setString(2, startDate);
			ps.setString(3, endDate);
			ps.setString(4, endDate);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				HotelDTO dto = new HotelDTO();
				dto.setHotel_no(rs.getInt("hotel_no"));
				dto.setHotel_name(rs.getString("hotel_name"));
				dto.setHotel_phone(rs.getString("hotel_phone"));
				dto.setHotel_addr(rs.getString("hotel_addr"));
				dto.setHotel_location(rs.getString("hotel_location"));
				dto.setHotel_email(rs.getString("hotel_email"));
				dto.setHotel_room_count(rs.getInt("hotel_room_count"));
				dto.setHotel_establish(rs.getInt("hotel_establish"));
				dto.setHotel_photo_folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_price_min(rs.getInt("hotel_price_min"));
				dto.setHotel_price_max(rs.getInt("hotel_price_max"));
				dto.setHotel_people_min(rs.getInt("hotel_people_min"));
				dto.setHotel_people_max(rs.getInt("hotel_people_max"));
				dto.setHotel_star(rs.getInt("hotel_star"));
				dto.setHotel_point(rs.getInt("hotel_point"));
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
	
}