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
			
			sql = "insert into user1 values(?, ?, ?, ?, ?, ?, ?, ?)";
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
			sql = "select * from user1 where user_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getUser_no());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(dto.getUser_pwd().equals(rs.getString("user_pwd"))) {
					sql = "update user1 set user_phone = ?, user_birth = ?, user_email = ?, user_region = ? where user_no = ?";
					ps = con.prepareStatement(sql);
		
					ps.setString(1, dto.getUser_phone());
					ps.setString(2, dto.getUser_birth());
					ps.setString(3, dto.getUser_email());
					ps.setString(4, dto.getUser_region());
					ps.setInt(5, dto.getUser_no());
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
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public int insertReservContetn(ReserveDTO dto) {
		int result = 0;
		
		try {
			connect();
			sql = "select count(*) from reserv";
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
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	
}
