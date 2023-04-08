package com.model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	private static BoardDAO instance;
	
	private BoardDAO() {  }
	
	public static BoardDAO getInstance() {
		
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	private void openConn() {
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
	
	private void closeConn() {
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}  // closeConn() 메서드 end

	
	public ArrayList<Inquiry_SiteDTO> getSiteBoardList() {
		ArrayList<Inquiry_SiteDTO> list = new ArrayList<Inquiry_SiteDTO>();
		
		try {
			openConn();
			sql = "select * from inquiry_site order by inqsi_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Inquiry_SiteDTO dto = new Inquiry_SiteDTO();
				dto.setInqsi_no(rs.getInt("inqsi_no"));
				dto.setInqsi_writer(rs.getString("inqsi_writer"));
				dto.setInqsi_title(rs.getString("inqsi_title"));
				dto.setInqsi_content(rs.getString("inqsi_content"));
				dto.setInqsi_date(rs.getString("inqsi_date"));
				dto.setInqsi_update(rs.getString("inqsi_update"));
				dto.setInqsi_group(rs.getInt("inqsi_group"));
				dto.setInqsi_step(rs.getInt("inqsi_step"));
				dto.setInqsi_indent(rs.getInt("inqsi_indent"));
				dto.setInqsi_userno(rs.getInt("inqsi_userno"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return list;
	}

	public ArrayList<Inquiry_HotelDTO> getHotelBoardList(int user_no) {
		ArrayList<Inquiry_HotelDTO> list = new ArrayList<Inquiry_HotelDTO>();
		
		try {
			openConn();
			sql = "select * from inquiry_hotel where inqho_userno = ? order by inqho_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			rs = pstmt.executeQuery();
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
				dto.setInqho_indent(rs.getInt("inqho_indent"));
				dto.setInqho_userno(rs.getInt("inqho_userno"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return list;
	}
	
	public int getSiteBoardCount() {
		int count = 0;
		
		try {
			openConn();
			sql = "select count(*) from inquiry_site";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return count;
	}

	public ArrayList<Inquiry_SiteDTO> getSitePageBoardList(int startNo, int endNo) {
		ArrayList<Inquiry_SiteDTO> list = new ArrayList<Inquiry_SiteDTO>();
		
		try {
			openConn();
			sql = "select * from " + 
					"(select row_number() over(order by inqsi_no desc) rnum, " + 
					"b.* from inquiry_site b) " + 
					"where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Inquiry_SiteDTO dto = new Inquiry_SiteDTO();
				dto.setInqsi_no(rs.getInt("inqsi_no"));
				dto.setInqsi_writer(rs.getString("inqsi_writer"));
				dto.setInqsi_title(rs.getString("inqsi_title"));
				dto.setInqsi_content(rs.getString("inqsi_content"));
				dto.setInqsi_date(rs.getString("inqsi_date"));
				dto.setInqsi_update(rs.getString("inqsi_update"));
				dto.setInqsi_group(rs.getInt("inqsi_group"));
				dto.setInqsi_step(rs.getInt("inqsi_step"));
				dto.setInqsi_indent(rs.getInt("inqsi_indent"));
				dto.setInqsi_userno(rs.getInt("inqsi_userno"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return list;
	}
	
	public int getHotelBoardCount() {
		int count = 0;
		
		try {
			openConn();
			sql = "select count(*) from inquiry_hotel";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return count;
	}

	public ArrayList<Inquiry_HotelDTO> getHotelPageBoardList(int user_no, int startNo, int endNo) {
		ArrayList<Inquiry_HotelDTO> list = new ArrayList<Inquiry_HotelDTO>();
		
		try {
			openConn();
			sql = "select * from " + 
					"(select row_number() over(order by inqho_no desc) rnum, " + 
					"b.* from inquiry_hotel b) " + 
					"where rnum between ? and ? "
					+ "and inqho_userno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			pstmt.setInt(3, user_no);
			rs = pstmt.executeQuery();
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
				dto.setInqho_indent(rs.getInt("inqho_indent"));
				dto.setInqho_userno(rs.getInt("inqho_userno"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return list;
	}
	
	public int insertSite(Inquiry_SiteDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			openConn();
			
			sql = "select max(inqsi_no) from inquiry_site";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into inquiry_site values(?, ?, ?, ?, sysdate, '', ?, 0, 0, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getInqsi_title());
			pstmt.setNString(3, dto.getInqsi_content());
			pstmt.setInt(4, count);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			closeConn();
		}
		
		return result;
		
	}
	
	public Inquiry_SiteDTO getSiteContent(int no) {
		
		Inquiry_SiteDTO dto = null;
		
		try {
			openConn();
			
			sql = "select * from inquiry_site where inqsi_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new Inquiry_SiteDTO();
				
				dto.setInqsi_no(rs.getInt("inqsi_no"));
				dto.setInqsi_writer(rs.getString("inqsi_writer"));
				dto.setInqsi_title(rs.getString("inqsi_title"));
				dto.setInqsi_content(rs.getString("inqsi_content"));
				dto.setInqsi_date(rs.getString("inqsi_date"));
				dto.setInqsi_update(rs.getString("inqsi_update"));
				dto.setInqsi_group(rs.getInt("inqsi_group"));
				dto.setInqsi_step(rs.getInt("inqsi_step"));
				dto.setInqsi_indent(rs.getInt("inqsi_indent"));
				dto.setInqsi_userno(rs.getInt("inqsi_userno"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn();
		}
		
		return dto;

	}
	
}