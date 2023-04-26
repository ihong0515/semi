package com.model.promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

	public CouponDTO getCouponContent(int no) {
		CouponDTO dto = null;
		
		try {
			sql = "select * from coupon where coup_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new CouponDTO();
				dto.setCoup_no(rs.getInt("coup_no"));
				dto.setCoup_promno(rs.getInt("coup_promno"));
				dto.setCoup_sale(rs.getInt("coup_sale"));
				dto.setCoup_serialno(rs.getString("coup_serialno"));
				dto.setCoup_userno(rs.getInt("coup_userno"));
				dto.setCoup_usecheck(rs.getString("coup_usecheck"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	public List<PromotionDTO>getpromotionList(){
		List<PromotionDTO>list = new ArrayList<PromotionDTO>();
		
		try {
			sql = "select * from promotion";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				PromotionDTO dto = new PromotionDTO();
				dto.setProm_no(rs.getInt("prom_no"));
				dto.setProm_folder(rs.getString("prom_folder"));
				dto.setProm_name(rs.getString("prom_name"));
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
				dto.setProm_sale(rs.getInt("prom_sale"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	public String makeCoupon() {
		final char[] possibleCharacters =
				{'1','2','3','4','5','6','7','8','9','0'
				,'A','B','C','D'
				,'E','F','G','H'
				,'I','J','K','L'
				,'M','N','O','P'
				,'Q','R','S','T'
				,'u','V','W','X','Y','Z'};
		final int possibleCharacterCount = possibleCharacters.length;
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer(12);
		for (int i=12;i>0;i--) {
			buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
		}
		String coupon_no = buf.toString();
		return coupon_no;
	}
		
	public String coupon_receive_check(int user_no, int prom_no) {
		String result = "";
		
		try {
			sql = "select * from coupon where coup_userno = ? and coup_promno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,user_no);
			ps.setInt(2, prom_no);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("coup_usecheck").equals("N")) { //쿠폰 ㅇ 사용 ㅇ
					result = rs.getString("coup_serialno");
				}else { //쿠폰 ㅇ 사용 x
					result = "-1";
				}
			}else { //쿠폰 x
				result = "1";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<CouponDTO> getUseableCoupon(int user_no) {
		ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
		
		try {
			sql = "select * from coupon where coup_userno = ? and coup_usecheck = 'N'";
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
	
	public String couponCheck() {
		String coup_serial = makeCoupon();
		
		try {
			sql = "select coup_serialno from coupon where coup_serialno = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, coup_serial);
			rs = ps.executeQuery();
			if(rs.next()) {
				coup_serial = couponCheck();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return coup_serial;
	}
	
	public void insertCoupon(int user_no,int prom_no,String coupon_serial) {
		int count = 0;
		
		try {
			sql = "select max(coup_no) from coupon";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1)+1;
				
				PromotionDTO prodto = getPromotionContent(prom_no);
				connect();
				sql = "insert into coupon values(?,?,?,?,?,default)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, count);
				ps.setInt(2,prom_no);
				ps.setInt(3, prodto.getProm_sale());
				ps.setString(4,coupon_serial);
				ps.setInt(5, user_no);
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateCouponUseAble(int reserv_coupno) {
		try {
			sql = "update coupon set coup_usecheck = 'N' where coup_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reserv_coupno);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}