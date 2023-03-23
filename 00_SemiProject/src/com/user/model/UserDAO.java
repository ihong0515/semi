package com.user.model;

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
	
	public int insertUser(UserDTO dto) {
		int result = 0, count = 0;
		try {
			sql = "select max(userNo) from user1";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			sql = "insert into user1 values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, count + 1);
			ps.setString(2, dto.getUser_name());
			ps.setString(3, dto.getUser_phone());
			ps.setString(4, dto.getUser_birth());
			ps.setString(5, dto.getUser_email());
			ps.setString(6, dto.getUser_egion());
			ps.setString(7, dto.getUser_reservation());
			ps.setString(8, dto.getUser_pwd());
			ps.setString(9, dto.getUser_id());
			
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
			sql = "select * from user1 where userNo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUser_no(rs.getInt(1));
				dto.setUser_name(rs.getString(2));
				dto.setUser_phone(rs.getString(3));
				dto.setUser_birth(rs.getString(4));
				dto.setUser_email(rs.getString(5));
				dto.setUser_egion(rs.getString(6));
				dto.setUser_reservation(rs.getString(7));
				dto.setUser_pwd(rs.getString(8));
				dto.setUser_id(rs.getString(9));
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
			sql = "select * from user1";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUser_no(rs.getInt(1));
				dto.setUser_name(rs.getString(2));
				dto.setUser_phone(rs.getString(3));
				dto.setUser_birth(rs.getString(4));
				dto.setUser_email(rs.getString(5));
				dto.setUser_egion(rs.getString(6));
				dto.setUser_reservation(rs.getString(7));
				dto.setUser_pwd(rs.getString(8));
				dto.setUser_id(rs.getString(9));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
