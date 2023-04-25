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

import com.model.board.Inquiry_HotelDTO;
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
	public int insertOwner(OwnerDTO dto) {
		int result = 0, count = 0;
		
		try {
			sql = "select max(owner_no) from owner";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			sql = "insert into owner values(?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, count + 1);
			ps.setString(2, dto.getOwner_id());
			ps.setString(3, dto.getOwner_pwd());
			ps.setString(4, dto.getOwner_name());
			ps.setString(5, dto.getOwner_phone());
			ps.setString(6, dto.getOwner_email());
			ps.setString(7,dto.getOwner_business());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int checkUserId(String id) {
		int result = 0;
		
		try {
			sql = "select * from owner where owner_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public ArrayList<String> getSearchId(String name, String mail) {
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			sql = "select * from owner where owner_email = ? and owner_name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mail);
			ps.setString(2, name);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("owner_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteEmailCode(String user_email) {
		try {
			sql = "delete from email_check where user_email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public int changeUserPwd(String id, String new_pwd) {
		int result = 0;
		
		try {
			sql = "update owner set owner_pwd = ? where owner_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, new_pwd);
			ps.setString(2, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int getSearchPwd(String id, String mail) {
		int result = 0;
		
		try {
			sql = "select * from owner where owner_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("owner_email").equals(mail)) {
					result = 1; //일치
				}else { //이메일 불일치
					result = -1;
				}
			}else { //id 없음
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
			if(owner_no==1) {
				sql = "select * from hotel order by hotel_no";
			}else {
				sql = "select * from hotel where hotel_ownerno = '"+owner_no+"' order by hotel_no";
			}
			ps = con.prepareStatement(sql);
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
					+ "hotel_hashtag = ? "
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

	public int insertRoomContent(RoomDTO dto) {
		int result = 0;
		
		try {
			sql = "select max(room_no) from room";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setRoom_no(rs.getInt(1)+1);
				
				sql = "insert into room values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getRoom_no());
				ps.setInt(2, dto.getRoom_hotelno());
				ps.setString(3, dto.getRoom_name());
				ps.setInt(4, dto.getRoom_price());
				ps.setString(5, dto.getRoom_bed());
				ps.setString(6, dto.getRoom_size());
				ps.setInt(7, dto.getRoom_people_min());
				ps.setInt(8, dto.getRoom_people_max());
				ps.setString(9, dto.getRoom_photo_folder());
				ps.setInt(10, dto.getRoom_photo_folder_size());
				ps.setString(11, dto.getRoom_checkin());
				ps.setString(12, dto.getRoom_checkout());
				ps.setString(13, dto.getRoom_breakfast());
				result = ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public int updatePolicyContent(int no, String[] str) {
		int result = 0; 
		
		try {
			sql = "update hotelpolicy set hp_wifi = ?, "
					+ "hp_parking = ?, "
					+ "hp_tub = ?, "
					+ "hp_pool = ?, "
					+ "hp_restaurant = ?, "
					+ "hp_fitness = ?, "
					+ "hp_bar = ?, "
					+ "hp_terrace = ?, "
					+ "hp_sauna = ? "
					+ "where hp_hotelno = ?";
			ps = con.prepareStatement(sql);
			for(int i = 0; i<str.length;i++) {
				if(str[i]==null) {
					ps.setInt((i+1), 0);
				}else {
					ps.setInt((i+1), 1);
				}
			}
			ps.setInt(10, no);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public void insertPolicyContent(int hotel_no, String[] str) {
		try {
			sql = "insert into hotelpolicy values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			for(int i=0;i<str.length;i++) {
				if(str[i].equals("on")) {
					ps.setString((i+2), "Y");
				}else {
					ps.setString((i+2), "N");
				}
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public ArrayList<Inquiry_HotelDTO> getBoardList(int no) {
		ArrayList<Inquiry_HotelDTO> list = new ArrayList<Inquiry_HotelDTO>();
		
		try {
			sql = "select * from (select row_number() over(order by inqho_group desc, INQHO_STEP) rnum, b.* from inquiry_hotel b ) where inqho_hotelno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while(rs.next()) {
				Inquiry_HotelDTO dto = new Inquiry_HotelDTO();
				dto.setInqho_no(rs.getInt("inqho_no"));
				dto.setInqho_ownerno(rs.getInt("inqho_ownerno"));
				dto.setInqho_hotelno(rs.getInt("inqho_hotelno"));
				dto.setInqho_writer(rs.getString("inqho_writer"));
				dto.setInqho_title(rs.getString("inqho_title"));
				dto.setInqho_content(rs.getString("inqho_content"));
				dto.setInqho_date(rs.getString("inqho_date"));
				dto.setInqho_update(rs.getString("inqho_update"));
				dto.setInqho_group(rs.getInt("inqho_group"));
				dto.setInqho_step(rs.getInt("inqho_step"));
				dto.setInqho_userno(rs.getInt("inqho_userno"));
				dto.setInqho_write_check(rs.getString("inqho_write_check"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	public int insertBoardReplyContent(Inquiry_HotelDTO dto) {
		int result = 0;
		
		try {
			sql = "select max(inqho_no) from inquiry_hotel";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setInqho_no(rs.getInt(1)+1);
				
				sql = "select max(inqho_step) from inquiry_hotel where inqho_group = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getInqho_group());
				rs = ps.executeQuery();
				if(rs.next()) {
					dto.setInqho_step(rs.getInt(1)+1);
					
					sql = "insert into inquiry_hotel values(?, ?, ?, ?, ?, ?, sysdate, default, ?, ?, ?, ?)";
					ps = con.prepareStatement(sql);
					ps.setInt(1, dto.getInqho_no());
					ps.setInt(2, dto.getInqho_ownerno());
					ps.setInt(3, dto.getInqho_hotelno());
					ps.setString(4, dto.getInqho_writer());
					ps.setString(5, dto.getInqho_title());
					ps.setString(6, dto.getInqho_content());
					ps.setInt(7, dto.getInqho_group());
					ps.setInt(8, dto.getInqho_step());
					ps.setInt(9, dto.getInqho_userno());
					ps.setString(10, dto.getInqho_write_check());
					result = ps.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateOwnerContent(OwnerDTO dto) {
		int result = 0;
		
		try {
			sql = "update owner set owner_name = ?, owner_pwd = ?, owner_phone = ?, owner_email = ?, owner_update = sysdate where owner_no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getOwner_name());
			ps.setString(2, dto.getOwner_pwd());
			ps.setString(3, dto.getOwner_phone());
			ps.setString(4, dto.getOwner_email());
			ps.setInt(5, dto.getOwner_no());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
}