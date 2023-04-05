package com.model.promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			connect();
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
	
	public List<PromotionDTO>getpromotionList(){
		List<PromotionDTO>list = new ArrayList<PromotionDTO>();
		PromotionDTO dto = null;
		try {
			sql = "select * from promotion";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto =new PromotionDTO();
				dto.setProm_no(rs.getInt("prom_no"));
				dto.setProm_folder(rs.getString("prom_folder"));
				dto.setProm_name(rs.getString("prom_name"));
				dto.setProm_info(rs.getString("prom_info"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}//list end
	public PromotionDTO getPromotionContent(int no) {
		
		PromotionDTO dto = null;
		
		
		
		try {
			sql = "select * from promotion where prom_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new PromotionDTO();
				dto.setProm_no(rs.getInt("prom_no"));
				dto.setProm_folder(rs.getString("prom_folder"));
				dto.setProm_name(rs.getString("prom_name"));
				dto.setProm_info(rs.getString("prom_info"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}return dto;
		
		
		
		
		
	}
	
}