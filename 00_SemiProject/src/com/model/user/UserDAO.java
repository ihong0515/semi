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

import com.model.reserve.ReserveDTO;

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
				dto.setUser_jjim1(rs.getInt("user_jjim1"));
				dto.setUser_jjim2(rs.getInt("user_jjim2"));
				dto.setUser_jjim3(rs.getInt("user_jjim3"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public List<UserDTO> getUserList() {
		List<UserDTO> list = new ArrayList<UserDTO>();
		try {
			connect();
			sql = "select * from user1 order by user_no";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_region(rs.getString("user_region"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_id(rs.getString("user_id"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
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
	
	public int duplicateId(String id) {
		int cnt = 0;
		try {
			connect();
			sql = "select count(user_id) as cnt from user1 where user_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
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

	public PaymentDTO getPaymentContent(int card_no) {
		PaymentDTO dto = null;
		
		try {
			connect();
			sql = "select * from payment where pay_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, card_no);
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
	
	public int jjimCancel(int user_no, int jjim1_no, int jjim2_no, int jjim3_no) {
		
		int result = 0;
		
		try {
			connect();
			
//			호텔 넘버에 맞는 찜 넘버 삭제 -> 업데이트 시퀀스로 앞으로 줄줄이 땡겨주기!
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
}
