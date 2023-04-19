package com.model.owner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.model.hotel.HotelDTO;
import com.model.hotel.RoomDTO;

public class OwnerDAO {
private static OwnerDAO instance;
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql;
	
	public OwnerDAO() {	}
	
	public static OwnerDAO getInstance() {
		if(instance == null) {
			instance = new OwnerDAO();
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
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int LoginCheck(String id, String pwd) {
		int result = 0;
		
		try {
			sql = "select * from owner where owner_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("owner_pwd").equals(pwd)) {
					result = 1;
				}else {
					result = -1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public OwnerDTO getOwnerContent(String id) {
		OwnerDTO dto = null;
		try {
			sql = "select * from owner where owner_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new OwnerDTO();
				dto.setOwner_no(rs.getInt("owner_no"));
				dto.setOwner_id(rs.getString("owner_id"));
				dto.setOwner_pwd(rs.getString("owner_pwd"));
				dto.setOwner_name(rs.getString("owner_name"));
				dto.setOwner_phone(rs.getString("owner_phone"));
				dto.setOwner_email(rs.getString("owner_email"));
				dto.setOwner_business(rs.getString("owner_business"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public ArrayList<HotelDTO> getHotelList(int owner_no) {
		ArrayList<HotelDTO> list = new ArrayList<>();
		
		try {
			sql = "select * from hotel where hotel_ownerno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, owner_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				HotelDTO dto = new HotelDTO();
				dto.setHotel_no(rs.getInt("hotel_no"));
				dto.setHotel_ownerNo(rs.getInt("hotel_ownerno"));
				dto.setHotel_name(rs.getString("hotel_name"));
				dto.setHotel_phone(rs.getString("hotel_phone"));
				dto.setHotel_addr(rs.getString("hotel_addr"));
				dto.setHotel_location(rs.getString("hotel_location"));
				dto.setHotel_email(rs.getString("hotel_email"));
				dto.setHotel_info(rs.getString("hotel_info"));
				dto.setHotel_room_count(rs.getInt("hotel_room_count"));
				dto.setHotel_establish(rs.getInt("hotel_establish"));
				dto.setHotel_photo_folder(rs.getString("hotel_photo_folder"));
				dto.setHotel_price_min(rs.getInt("hotel_price_min"));
				dto.setHotel_price_max(rs.getInt("hotel_price_max"));
				dto.setHotel_people_min(rs.getInt("hotel_people_min"));
				dto.setHotel_people_max(rs.getInt("hotel_people_max"));
				dto.setHotel_star(rs.getInt("hotel_star"));
				dto.setHotel_point(rs.getInt("hotel_point"));

				String hash = rs.getNString("hotel_hashtag");
				StringTokenizer st = new StringTokenizer(hash, ",");
				ArrayList<String> hashtag = new ArrayList<String>();
				while(st.hasMoreTokens()) {
					hashtag.add(st.nextToken());
				}
				
				dto.setHotel_hashtag(hashtag);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}

	public ArrayList<RoomDTO> getRoomList(int hotel_no) {
		ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
		
		
		try {
			sql = "select * from room where room_hotelno = ? order by room_no";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			rs = ps.executeQuery();
			while(rs.next()) {
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
				dto.setRoom_photo_folder_size(rs.getInt("room_photo_folder_size"));
				dto.setRoom_checkin(rs.getString("room_checkin"));
				dto.setRoom_checkout(rs.getString("room_checkout"));
				dto.setRoom_breakfast(rs.getString("room_breakfast"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	public int updateHotelContent(HotelDTO dto) {
		int result = 0;
		
		try {
			sql = "update hotel set hotel_name = ?, "
					+ "hotel_phone = ?, "
					+ "hotel_addr = ?, "
					+ "hotel_location = ?, "
					+ "hotel_email = ?, "
					+ "hotel_info = ?, "
					+ "hotel_room_count = ?, "
					+ "hotel_establish = ?, "
					+ "hotel_price_min = ?, "
					+ "hotel_price_max = ?, "
					+ "hotel_people_min = ?, "
					+ "hotel_people_max = ?, "
					+ "hotel_star = ?, "
					+ "hotel_hashtag = ?, "
					+ "where hotel_no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getHotel_name());
			ps.setString(2, dto.getHotel_phone());
			ps.setString(3, dto.getHotel_addr());
			ps.setString(4, dto.getHotel_location());
			ps.setString(5, dto.getHotel_email());
			ps.setString(6, dto.getHotel_info());
			ps.setInt(7, dto.getHotel_room_count());
			ps.setInt(8, dto.getHotel_establish());
			ps.setInt(9, dto.getHotel_price_min());
			ps.setInt(10, dto.getHotel_price_max());
			ps.setInt(11, dto.getHotel_people_min());
			ps.setInt(12, dto.getHotel_people_max());
			ps.setInt(13, dto.getHotel_star());
			
			String str = dto.getHotel_hashtag().get(0)+","+dto.getHotel_hashtag().get(1)+","+dto.getHotel_hashtag().get(2);
			
			ps.setString(14, str);
			ps.setInt(15, dto.getHotel_no());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public int deleteHotelContent(int no) {
		int result = 0;
		
		try {
			sql = "delete from hotel where hotel_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public int updateRoomContent(RoomDTO dto) {
		int result = 0;
		
		try {
			sql = "update room set room_name = ?, "
					+ "room_price = ?, "
					+ "room_bed = ?, "
					+ "room_size = ?, "
					+ "room_people_min = ?, "
					+ "room_people_max = ?, "
					+ "room_checkin = ?, "
					+ "room_checkout = ?, ";
			if(dto.getRoom_photo_folder_size()!=0) {
				sql += "room_photo_folder_size = '"+dto.getRoom_photo_folder_size()+"', ";
			}
			sql += "room_breakfast = ? "
				+ "where room_no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getRoom_name());
			ps.setInt(2, dto.getRoom_price());
			ps.setString(3, dto.getRoom_bed());
			ps.setString(4, dto.getRoom_size());
			ps.setInt(5, dto.getRoom_people_min());
			ps.setInt(6, dto.getRoom_people_max());
			ps.setString(7, dto.getRoom_checkin());
			ps.setString(8, dto.getRoom_checkout());
			ps.setString(9, dto.getRoom_breakfast());
			ps.setInt(10, dto.getRoom_no());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public int deleteRoomContent(int no) {
		int result = 0;
		
		try {
			sql = "delete from room where room_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public int insertHotelContent(HotelDTO dto) {
		int result = 0;
		
		try {
			sql = "select max(hotel_no) from hotel";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setHotel_no(rs.getInt(1)+1);
				
				sql = "insert into hotel values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, ?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getHotel_no());
				ps.setInt(2, dto.getHotel_ownerNo());
				ps.setString(3, dto.getHotel_name());
				ps.setString(4, dto.getHotel_phone());
				ps.setString(5, dto.getHotel_addr());
				ps.setString(6, dto.getHotel_location());
				ps.setString(7, dto.getHotel_email());
				ps.setString(8, dto.getHotel_info());
				ps.setInt(9, dto.getHotel_room_count());
				ps.setInt(10, dto.getHotel_establish());
				ps.setString(11, dto.getHotel_photo_folder());
				ps.setInt(12, dto.getHotel_price_min());
				ps.setInt(13, dto.getHotel_price_max());
				ps.setInt(14, dto.getHotel_people_min());
				ps.setInt(15, dto.getHotel_people_max());
				ps.setInt(16, dto.getHotel_star());
				String str = dto.getHotel_hashtag().get(0)+","+dto.getHotel_hashtag().get(1)+","+dto.getHotel_hashtag().get(2);
				ps.setString(17, str);
				result = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	


}
