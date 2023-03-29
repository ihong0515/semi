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
			
			sql = "insert into user1 values(?, ?, ?, ?, ?, ?, 'F', ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, count + 1);
			ps.setString(2, dto.getUser_name());
			ps.setString(3, dto.getUser_phone());
			ps.setString(4, dto.getUser_birth());
			ps.setString(5, dto.getUser_email());
			ps.setString(6, dto.getUser_region());
			ps.setString(7, dto.getUser_pwd());
			ps.setString(8, dto.getUser_id());
			
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
	
}
