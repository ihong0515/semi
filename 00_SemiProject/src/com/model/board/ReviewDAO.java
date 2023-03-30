package com.model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	private static ReviewDAO instance;
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql;
	
	public ReviewDAO() {	}
	
	public static ReviewDAO getInstance() {
		if(instance == null) {
			instance = new ReviewDAO();
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


	public ArrayList<ReviewDTO> getReviewList(int hotel_no) {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		try {
			sql = "select * from review where review_hotelno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReview_no(rs.getInt("review_no"));
				dto.setReview_userno(rs.getInt("review_userno"));
				dto.setReview_hotelno(rs.getInt("review_hotelno"));
				dto.setReview_roomno(rs.getInt("review_roomno"));
				dto.setReview_reservno(rs.getInt("review_reservno"));
				dto.setReview_writer(rs.getString("review_writer"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_date(rs.getString("review_date"));
				dto.setReview_update(rs.getString("review_update"));
				dto.setReview_photo(rs.getString("review_photo"));
				dto.setReview_checkindate(rs.getString("review_checkindate"));
				dto.setReview_point(rs.getInt("review_point"));
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

	public int checkReserve(ReviewDTO dto) {
		int result = 0;
		try {
			sql = "select * from reserv where reserv_userno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getReview_userno());
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("reserv_usecheck").equalsIgnoreCase("Y")) {
					dto.setReview_reservno(rs.getInt("reserv_no"));
					dto.setReview_checkindate(rs.getString("reserv_start").substring(0,10));
					dto.setReview_roomno(rs.getInt("reserv_roomno"));
					
					result = checkReview(dto.getReview_reservno());
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

	private int checkReview(int reserv_no) {
		int result = 0;
		
		try {
			sql = "select count(*) from review where review_reservno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reserv_no);
			if(rs.next()) {
				result = -1;
			}else {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int insertReviewContent(ReviewDTO dto) {
		int result = 0;
		
		try {
			sql = "select count(*) from review";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setReview_no(rs.getInt(1)+1);
			}
			if(dto.getReview_photo()!=null) {
				sql = "insert into review values(?, ?, ?, ?, ?, ?, ?, sysdate, default, '"+dto.getReview_photo()+"', ?, ?)";
			}else {
				sql = "insert into review values(?, ?, ?, ?, ?, ?, ?, sysdate, default, default, ?, ?)";
			}
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getReview_no());
			ps.setInt(2, dto.getReview_userno());
			ps.setInt(3, dto.getReview_hotelno());
			ps.setInt(4, dto.getReview_roomno());
			ps.setInt(5, dto.getReview_reservno());
			ps.setString(6, dto.getReview_writer());
			ps.setString(7, dto.getReview_content());
			ps.setString(8, dto.getReview_checkindate());
			ps.setInt(9, dto.getReview_point());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	public int deleteReviewContent(int review_no) {
		int result = 0;
		
		try {
			sql = "delete from review where review_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			result = ps.executeUpdate();
			if(result>0) {
				sequence(review_no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	private void sequence(int review_no) {
		try {
			sql = "update review set review_no = review_no-1 where review_no > ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ReviewDTO getReviewContent(int review_no) {
		ReviewDTO dto = null;
		
		try {
			sql = "select * from review where review_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new ReviewDTO();
				dto.setReview_no(rs.getInt("review_no"));
				dto.setReview_userno(rs.getInt("review_userno"));
				dto.setReview_hotelno(rs.getInt("review_hotelno"));
				dto.setReview_roomno(rs.getInt("review_roomno"));
				dto.setReview_reservno(rs.getInt("review_reservno"));
				dto.setReview_writer(rs.getString("review_writer"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_date(rs.getString("review_date"));
				dto.setReview_update(rs.getString("review_update"));
				dto.setReview_photo(rs.getString("review_photo"));
				dto.setReview_checkindate(rs.getString("review_checkindate"));
				dto.setReview_point(rs.getInt("review_point"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public String getReviewFileName(int review_no) {
		String fileName = null;
		
		try {
			sql = "select review_photo from review where review_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				fileName = rs.getString("review_photo");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileName;
	}
	
	
}