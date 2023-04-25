package com.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.model.hotel.HotelDTO;
import com.model.promotion.*;

public class UserDAO {
	
	private static UserDAO instance;
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public UserDAO() {	}
	
	public static UserDAO getInstance() {
		if(instance == null) {
			instance = new UserDAO();
		}
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
	
	public int insertUser(UserDTO dto) {
		int result = 0, count = 0;
		try {
			connect();
			sql = "select max(user_no) from user1";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			sql = "insert into user1 values(?, ?, ?, ?, ?, ?, ?, ?, '', '', '')";
			ps = con.prepareStatement(sql);
			ps.setInt(1, count + 1);
			ps.setString(2, dto.getUser_id());
			ps.setString(3, dto.getUser_pwd());
			ps.setString(4, dto.getUser_name());
			ps.setString(5, dto.getUser_phone());
			ps.setString(6, dto.getUser_birth());
			ps.setString(7, dto.getUser_email());
			ps.setString(8, dto.getUser_region());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public UserDTO getUserContent(int no) {
		UserDTO dto = null;
		try {
			connect();
			sql = "select * from user1 where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_region(rs.getString("user_region"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_id(rs.getString("user_id"));
				int[] jL = new int[3];
				jL[0] = rs.getInt("user_jjim1");
				jL[1] = rs.getInt("user_jjim2");
				jL[2] = rs.getInt("user_jjim3");
				dto.setUser_jjimList(jL);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public UserDTO loginUser(String id, String pwd) {
		UserDTO dto = null;
		
		try {
			connect();
			sql = "select * from user1 where user_id = ? and user_pwd = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_region(rs.getString("user_region"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_id(rs.getString("user_id"));
				int[] jL = new int[3];
				jL[0] = rs.getInt("user_jjim1");
				jL[1] = rs.getInt("user_jjim2");
				jL[2] = rs.getInt("user_jjim3");
				dto.setUser_jjimList(jL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public int updateUser(UserDTO dto) {
		int result = 0;
		try {
			connect();
			sql = "update user1 set user_phone = ?, user_birth = ?, user_region = ? where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_phone());
			ps.setString(2, dto.getUser_birth());
			ps.setString(3, dto.getUser_region());
			ps.setInt(4, dto.getUser_no());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int checkUserId(String id) {
		int result = 0;
		try {
			connect();
			sql = "select * from user1 where user_id = ?";
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
	
	public int checkUser(String user_id, String user_pwd) {
		int result = 0;
		
		try {
			connect();
			sql = "select * from user1 where user_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("user_pwd").equals(user_pwd)) {
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

	public ArrayList<PaymentDTO> getPaymentList(int user_no) {
		ArrayList<PaymentDTO> list = new ArrayList<PaymentDTO>();
		
		try {
			connect();
			sql = "select * from payment where pay_userno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				PaymentDTO dto = new PaymentDTO();
				dto.setPay_no(rs.getInt("pay_no"));
				dto.setPay_userno(rs.getInt("pay_userno"));
				dto.setPay_name(rs.getString("pay_name"));
				dto.setPay_cardno(rs.getString("pay_cardno"));
				dto.setPay_cardcom(rs.getString("pay_cardcom"));
				dto.setPay_cvc(rs.getInt("pay_cvc"));
				dto.setPay_pwd(rs.getString("pay_pwd"));
				dto.setPay_date(rs.getString("pay_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	public PaymentDTO getPaymentContent(int pay_no) {
		PaymentDTO dto = null;
		
		try {
			connect();
			sql = "select * from payment where pay_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pay_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new PaymentDTO();
				dto.setPay_no(rs.getInt("pay_no"));
				dto.setPay_userno(rs.getInt("pay_userno"));
				dto.setPay_name(rs.getString("pay_name"));
				dto.setPay_cardno(rs.getString("pay_cardno"));
				dto.setPay_cardcom(rs.getString("pay_cardcom"));
				dto.setPay_cvc(rs.getInt("pay_cvc"));
				dto.setPay_pwd(rs.getString("pay_pwd"));
				dto.setPay_date(rs.getString("pay_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public int insertReservContent(ReserveDTO dto) {
		int result = 0;
		
		try {
			connect();
			sql = "select max(reserv_no) from reserv";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setReserv_no(rs.getInt(1)+1);
				
				if(dto.getReserv_promno()!=0) {
					sql = "insert into reserv values(?,?,?,?,?,?,?,'"+dto.getReserv_promno()+"','"+dto.getReserv_coupno()+"',?"
							+ ",?,?,?,?,?,?,sysdate,default,?,?,?)";
				}else {
					sql = "insert into reserv values(?,?,?,?,?,?,?,default,default,?"
							+ ",?,?,?,?,?,?,sysdate,default,?,?,?)";
				}
				ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getReserv_no());
				ps.setInt(2, dto.getReserv_hotelno());
				ps.setString(3, dto.getReserv_hotelname());
				ps.setInt(4, dto.getReserv_roomno());
				ps.setString(5, dto.getReserv_roomname());
				ps.setInt(6, dto.getReserv_userno());
				ps.setString(7, dto.getReserv_username());
				ps.setInt(8, dto.getReserv_nomalprice());
				ps.setInt(9, dto.getReserv_realprice());
				ps.setString(10, dto.getReserv_start());
				ps.setString(11, dto.getReserv_end());
				ps.setInt(12, dto.getReserv_daycount());
				ps.setInt(13, dto.getReserv_people());
				ps.setString(14, dto.getReserv_request());
				ps.setInt(15, dto.getReserv_payment());
				ps.setInt(16, dto.getReserv_ins());
				ps.setString(17, dto.getReserv_phone());
				
				result = ps.executeUpdate();
				
				if(result>0) {
					if(dto.getReserv_coupno()!=0) {
						updateCouponUse(dto.getReserv_coupno());
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	private void updateCouponUse(int reserv_coupno) {
		try {
			sql = "update coupon set coup_usecheck = 'Y' where coup_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reserv_coupno);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Integer> checkReservDate(String inFormat, String outFormat, int hotel_no) {
		
		ArrayList<Integer> list = new ArrayList<>();
		
		try {
			connect();
			sql = "select reserv_roomno from "
					+ "(select reserv_roomno, reserv_hotelno from reserv "
					+ "where reserv_start <= '"+inFormat+"' and '"+inFormat+"' < reserv_end "
					+ "or reserv_start < '"+outFormat+"' and '"+outFormat+"' <= reserv_end) "
					+ "where reserv_hotelno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("reserv_roomno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public List<ReserveDTO> getReservList(int user_no) {
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		try {
			connect();
			sql = "select * from reserv where reserv_userno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setReserv_no(rs.getInt("reserv_no"));
				dto.setReserv_hotelno(rs.getInt("reserv_hotelno"));
				dto.setReserv_hotelname(rs.getString("reserv_hotelname"));
				dto.setReserv_roomno(rs.getInt("reserv_roomno"));
				dto.setReserv_roomname(rs.getString("reserv_roomname"));
				dto.setReserv_userno(rs.getInt("reserv_userno"));
				dto.setReserv_username(rs.getString("reserv_username"));
				dto.setReserv_promno(rs.getInt("reserv_promno"));
				dto.setReserv_coupno(rs.getInt("reserv_coupno"));
				dto.setReserv_nomalprice(rs.getInt("reserv_nomalprice"));
				dto.setReserv_realprice(rs.getInt("reserv_realprice"));
				dto.setReserv_start(rs.getString("reserv_start"));
				dto.setReserv_end(rs.getString("reserv_end"));
				dto.setReserv_daycount(rs.getInt("reserv_daycount"));
				dto.setReserv_people(rs.getInt("reserv_people"));
				dto.setReserv_request(rs.getString("reserv_request"));
				dto.setReserv_date(rs.getString("reserv_date"));
				dto.setReserv_usecheck(rs.getString("reserv_usecheck"));
				dto.setReserv_payment(rs.getInt("reserv_payment"));
				dto.setReserv_ins(rs.getInt("reserv_ins"));
				dto.setReserv_phone(rs.getString("reserv_phone"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	//특정유저, 특정호텔을 포함하는 예약정보 리스트 OverRiding
	public List<ReserveDTO> getReservList(int user_no, int hotel_no) {
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		try {
			connect();
			sql = "select * from reserv where reserv_userno = ? and reserv_hotelno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			ps.setInt(2, hotel_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setReserv_no(rs.getInt("reserv_no"));
				dto.setReserv_hotelno(rs.getInt("reserv_hotelno"));
				dto.setReserv_hotelname(rs.getString("reserv_hotelname"));
				dto.setReserv_roomno(rs.getInt("reserv_roomno"));
				dto.setReserv_roomname(rs.getString("reserv_roomname"));
				dto.setReserv_userno(rs.getInt("reserv_userno"));
				dto.setReserv_username(rs.getString("reserv_username"));
				dto.setReserv_promno(rs.getInt("reserv_promno"));
				dto.setReserv_coupno(rs.getInt("reserv_coupno"));
				dto.setReserv_nomalprice(rs.getInt("reserv_nomalprice"));
				dto.setReserv_realprice(rs.getInt("reserv_realprice"));
				dto.setReserv_start(rs.getString("reserv_start"));
				dto.setReserv_end(rs.getString("reserv_end"));
				dto.setReserv_daycount(rs.getInt("reserv_daycount"));
				dto.setReserv_people(rs.getInt("reserv_people"));
				dto.setReserv_request(rs.getString("reserv_request"));
				dto.setReserv_date(rs.getString("reserv_date"));
				dto.setReserv_usecheck(rs.getString("reserv_usecheck"));
				dto.setReserv_payment(rs.getInt("reserv_payment"));
				dto.setReserv_ins(rs.getInt("reserv_ins"));
				dto.setReserv_phone(rs.getString("reserv_phone"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public List<ReserveDTO> getReservListStatus(int user_no, String status) {
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		try {
			connect();
			sql = "select * from reserv where reserv_userno = ? and reserv_usecheck = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			ps.setString(2, status);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setReserv_no(rs.getInt("reserv_no"));
				dto.setReserv_hotelno(rs.getInt("reserv_hotelno"));
				dto.setReserv_hotelname(rs.getString("reserv_hotelname"));
				dto.setReserv_roomno(rs.getInt("reserv_roomno"));
				dto.setReserv_roomname(rs.getString("reserv_roomname"));
				dto.setReserv_userno(rs.getInt("reserv_userno"));
				dto.setReserv_username(rs.getString("reserv_username"));
				dto.setReserv_promno(rs.getInt("reserv_promno"));
				dto.setReserv_coupno(rs.getInt("reserv_coupno"));
				dto.setReserv_nomalprice(rs.getInt("reserv_nomalprice"));
				dto.setReserv_realprice(rs.getInt("reserv_realprice"));
				dto.setReserv_start(rs.getString("reserv_start"));
				dto.setReserv_end(rs.getString("reserv_end"));
				dto.setReserv_daycount(rs.getInt("reserv_daycount"));
				dto.setReserv_people(rs.getInt("reserv_people"));
				dto.setReserv_request(rs.getString("reserv_request"));
				dto.setReserv_date(rs.getString("reserv_date"));
				dto.setReserv_usecheck(rs.getString("reserv_usecheck"));
				dto.setReserv_payment(rs.getInt("reserv_payment"));
				dto.setReserv_ins(rs.getInt("reserv_ins"));
				dto.setReserv_phone(rs.getString("reserv_phone"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public HotelDTO getHotelContentbyUserNo(int user_no) {
		HotelDTO dto = null;
		try {
			connect();
			sql = "select * from hotel where hotel_no = (select hotel_no from hotel h join reserv r on hotel_no = reserv_hotelno where hotel_no = reserv_hotelno)";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new HotelDTO();
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
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	public int changeUserPwd(int no, String nowPwd, String newPwd) {
		int result = 0;
		
		try {
			connect();
			sql = "select user_pwd from user1 where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(nowPwd.equals(rs.getString("user_pwd"))) {
					sql = "update user1 set user_pwd = ? where user_no = ?";
					ps = con.prepareStatement(sql);
					ps.setString(1, newPwd);
					ps.setInt(2, no);
					result = ps.executeUpdate();
				} else {
					result = -1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//changeUserPwd(String, String) Overriding
	public int changeUserPwd(String id, String new_pwd) {
		int result = 0;
		
		try {
			connect();
			sql = "update user1 set user_pwd = ? where user_id = ?";
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
	
	public int jjimCancel(int user_no, int hotel_no) {
		
		int result = 0;
		
		try {
			connect();
			sql = "select user_jjim1, user_jjim2, user_jjim3 from user1 where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			
			if(rs.next()) { // 찜 내역 존재
				if(hotel_no == rs.getInt(1)) { // 찜1 취소
					sql = "update user1 set user_jjim1 = user_jjim2, user_jjim2 = user_jjim3, user_jjim3 = null where user_no = ?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, user_no);
					result = ps.executeUpdate();
				} else if(hotel_no == rs.getInt(2)) { // 찜2 취소
					sql = "update user1 set user_jjim2 = user_jjim3, user_jjim3 = null where user_no = ?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, user_no);
					result = ps.executeUpdate();
				} else { // 찜3 취소
					sql = "update user1 set user_jjim3 = null where user_no = ?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, user_no);
					result = ps.executeUpdate();
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int getUserReservCancel(int reserv_no) {
		int result = 0;
		try {
			connect();
			sql = "update reserv set reserv_usecheck = 'C' where reserv_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reserv_no);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	
	public int insertPayment(PaymentDTO dto, int user_no) {
		int result = 0, count = 0;
		try {
			connect();
			sql = "select max(pay_no) from payment";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			sql = "insert into payment values(?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, count + 1);
			ps.setInt(2, user_no);
			ps.setString(3, dto.getPay_name());
			ps.setString(4, dto.getPay_cardno());
			ps.setString(5, dto.getPay_cardcom());
			ps.setInt(6, dto.getPay_cvc());
			ps.setString(7, dto.getPay_pwd());
			ps.setString(8, dto.getPay_date());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int modifyPayment(PaymentDTO dto) {
		int result = 0;
		try {
			connect();
			sql = "update payment set pay_name = ?, pay_cardno = ?, pay_cardcom = ?, pay_cvc = ?, pay_pwd = ?, pay_date = ? where pay_no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPay_name());
			ps.setString(2, dto.getPay_cardno());
			ps.setString(3, dto.getPay_cardcom());
			ps.setInt(4, dto.getPay_cvc());
			ps.setString(5, dto.getPay_pwd());
			ps.setString(6, dto.getPay_date());
			ps.setInt(7, dto.getPay_no());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int jjimInsertContent(int hotel_no, int user_no) {
		int result = 0;
		
		try {
			connect();
			sql = "select user_jjim1, user_jjim2, user_jjim3 from user1 where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				sql = "update user1 set ";
				if(rs.getInt(1)==0||rs.getInt(1)==hotel_no) {
					sql += "user_jjim1 = '"+hotel_no+"' ";
				}else if(rs.getInt(2)==0||rs.getInt(2)==hotel_no) {
					sql += "user_jjim2 = '"+hotel_no+"' ";
				}else {
					sql += "user_jjim3 = '"+hotel_no+"' ";
				}
				sql += "where user_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, user_no);
				result = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public ArrayList<PromotionDTO> getPromContentbyuserno(int user_no) {
		ArrayList<PromotionDTO> list = new ArrayList<PromotionDTO>();
		try {
			connect();
			sql = "select a.* from promotion a join (select coup_promno from coupon where coup_userno = ?) b on prom_no = coup_promno";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				PromotionDTO dto =new PromotionDTO();
				dto.setProm_no(rs.getInt("prom_no"));
				dto.setProm_name(rs.getString("prom_name"));
				dto.setProm_folder(rs.getString("prom_folder"));
				dto.setProm_info(rs.getString("prom_info"));
				dto.setProm_sale(rs.getInt("prom_sale"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	public ArrayList<CouponDTO> getCouponList(int user_no) {
		ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
		
		try {
			connect();
			sql = "select * from coupon where coup_userno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				dto.setCoup_no(rs.getInt("coup_no"));
				dto.setCoup_promno(rs.getInt("coup_promno"));
				dto.setCoup_sale(rs.getInt("coup_sale"));
				dto.setCoup_serialno(rs.getString("coup_serialno"));
				dto.setCoup_userno(rs.getInt("coup_userno"));
				dto.setCoup_usecheck(rs.getString("coup_usecheck"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public int deletePayment(int pay_no) {
		int result = 0;
		try {
			connect();
			sql = "delete from payment where pay_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pay_no);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int quitUser(int user_no, String user_pwd) {
		int result = 0;
		try {
			connect();
			sql = "select * from user1 where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(user_pwd.equals(rs.getString("user_pwd"))) {
					sql = "delete user1 where user_no = ?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, user_no);
					result = ps.executeUpdate();
				} else {
					result = -1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public String getReservListbyStatus(String status) {
		String result = null;
		
		try {
			connect();
			sql = "select * from reserv where reserv_usecheck = ?  order by reserv_start";
			ps = con.prepareStatement(sql);
			ps.setString(1, status);
			rs = ps.executeQuery();
			
			result = "<reservations>";
			
			while(rs.next()) {
				result += "<reserv>";
				result += "<reserv_hotelname>" + rs.getString("reserv_hotelname") + "</reserv_hotelname>";
				result += "<reserv_roomname>" + rs.getString("reserv_roomname") + "</reserv_roomname>";
				result += "<reserv_start>" + rs.getString("reserv_start") + "</reserv_start>";
				result += "<reserv_end>" + rs.getString("reserv_end") + "</reserv_end>";
				result += "<reserv_realprice>" + rs.getInt("reserv_realprice") + "</reserv_realprice>";
				result += "</reserv>";
			}
			result = "</reservations>";
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public String insertEmailCode(String user_email) {
		String code = "";
		try {
			connect();
			code = PromotionDAO.getInstance().makeCoupon();
			sql = "select email_code from email_check where email_code = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, code);
			rs = ps.executeQuery();
			if(rs.next()) {
				code = insertEmailCode(user_email);
			}
			sql = "insert into email_check values(?, ?, default)";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_email);
			ps.setString(2, code);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return code;
	}

	public int checkEmailCode(String user_email, String code) {
		int result = 0;
		
		try {
			connect();
			sql = "select * from email_check where user_email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_email);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("email_code").equals(code)) {
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

	public void deleteEmailCode(String user_email) {
		try {
			connect();
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

	public void updateEmailCode(String user_email) {
		try {
			connect();
			sql = "update email_check set code_check = 'Y' where user_email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public String checkEmailUseable(String user_email) {
		String result = "";
		
		try {
			connect();
			sql = "select * from email_check where user_email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_email);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString("code_check");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public ReserveDTO getReservContent(int re_no) {
		ReserveDTO dto  = null;
		
		try {
			connect();
			sql = "select * from reserv where reserv_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, re_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new ReserveDTO();
				dto.setReserv_no(rs.getInt("reserv_no"));
				dto.setReserv_hotelno(rs.getInt("reserv_hotelno"));
				dto.setReserv_hotelname(rs.getString("reserv_hotelname"));
				dto.setReserv_roomno(rs.getInt("reserv_roomno"));
				dto.setReserv_roomname(rs.getString("reserv_roomname"));
				dto.setReserv_userno(rs.getInt("reserv_userno"));
				dto.setReserv_username(rs.getString("reserv_username"));
				dto.setReserv_promno(rs.getInt("reserv_promno"));
				dto.setReserv_coupno(rs.getInt("reserv_coupno"));
				dto.setReserv_nomalprice(rs.getInt("reserv_nomalprice"));
				dto.setReserv_realprice(rs.getInt("reserv_realprice"));
				dto.setReserv_start(rs.getString("reserv_start"));
				dto.setReserv_end(rs.getString("reserv_end"));
				dto.setReserv_daycount(rs.getInt("reserv_daycount"));
				dto.setReserv_people(rs.getInt("reserv_people"));
				dto.setReserv_request(rs.getString("reserv_request"));
				dto.setReserv_date(rs.getString("reserv_date"));
				dto.setReserv_usecheck(rs.getString("reserv_usecheck"));
				dto.setReserv_payment(rs.getInt("reserv_payment"));
				dto.setReserv_ins(rs.getInt("reserv_ins"));
				dto.setReserv_phone(rs.getString("reserv_phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public ArrayList<String> getSearchId(String name, String mail) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			connect();
			sql = "select * from user1 where user_email = ? and user_name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mail);
			ps.setString(2, name);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getSearchPwd(String id, String mail) {
		int result = 0;
		
		try {
			connect();
			sql = "select * from user1 where user_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("user_email").equals(mail)) {
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
}