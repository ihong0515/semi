package com.model.promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PromotionDAO {
	private static PromotionDAO instance;
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql;
	
	public PromotionDAO() {	}
	
	public static PromotionDAO getInstance() {
		if(instance == null) {
			instance = new PromotionDAO();
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

	public CouponDTO checkCouponContent(String serial) {
		CouponDTO dto = null;
		
		try {
			sql = "select * from coupon where coup_serialno = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, serial);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new CouponDTO();
				dto.setCoup_no(rs.getInt("coup_no"));
				dto.setCoup_promno(rs.getInt("coup_promno"));
				dto.setCoup_name(rs.getString("coup_name"));
				dto.setCoup_info(rs.getString("coup_info"));
				dto.setCoup_sale(rs.getInt("coup_sale"));
				dto.setCoup_serialno(rs.getString("coup_serialno"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	
	
	
}