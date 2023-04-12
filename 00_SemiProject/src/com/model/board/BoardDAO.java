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
				dto.setInqho_userno(rs.getInt("inqho_userno"));
				dto.setInqho_write_check(rs.getString("inqho_write_check"));
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
	
	public int getHotelBoardCount(int no) {
		int count = 0;
		
		try {
			openConn();
			if(no==1) {
				sql = "select count(*) from inquiry_hotel";
			}else {
				sql = "select count(*) from inquiry_hotel where inqho_userno = "+no;
			}
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
			sql = "select * from "
					+ "(select row_number() "
					+ "over(order by inqho_group desc, INQHO_STEP) rnum, "
					+ "b.* from inquiry_hotel b ";
			if(user_no!=1) {
				sql += " where inqho_userno = "+user_no+")";
			}else {
				sql += ")";
			}
			sql += " where rnum between ? and ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
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
				dto.setInqho_userno(rs.getInt("inqho_userno"));
				dto.setInqho_write_check(rs.getString("inqho_write_check"));
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
	
	public int insertBoardSiteContent(Inquiry_SiteDTO dto) {
		int result = 0;
		
		try {
			openConn();
			sql = "select count(*) from inquiry_site";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setInqsi_no(rs.getInt(1)+1);
				sql = "insert into inquiry_site values(?, ?, ?, ?, sysdate, default, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getInqsi_no());
				pstmt.setString(2, dto.getInqsi_writer());
				pstmt.setString(3, dto.getInqsi_title());
				pstmt.setString(4, dto.getInqsi_content());
				pstmt.setInt(5, dto.getInqsi_no());
				pstmt.setInt(6, dto.getInqsi_no());
				pstmt.setInt(7, dto.getInqsi_no());
				pstmt.setInt(8, dto.getInqsi_userno());
				result = pstmt.executeUpdate();
			}
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

	public int updateSiteBoardContent(Inquiry_SiteDTO dto) {
		int result = 0;
		
		try {
			openConn();
			sql = "update inquiry_site set inqsi_title = ?, inqsi_content = ?, inqsi_update = sysdate where inqsi_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getInqsi_title());
			pstmt.setString(2, dto.getInqsi_content());
			pstmt.setInt(3, dto.getInqsi_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return result;
	}

	public int deleteSiteBoardContent(int no) {
		int result =0;
		
		try {
			openConn();
			sql = "delete from inquiry_site where inqsi_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			if(result>0) {
				sequence_site(no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		
		return result;
	}

	private void sequence_site(int no) {
		try {
			openConn();
			sql = "update inquiry_site set inqsi_no = inqsi_no -1 where inqsi_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Inquiry_Site_ReplyDTO> getSiteReplyList(int no) {
		ArrayList<Inquiry_Site_ReplyDTO> list = new ArrayList<Inquiry_Site_ReplyDTO>();
		
		try {
			openConn();
			sql = "select * from inquiry_site_reply where inqsi_siteno = ? order by inqre_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Inquiry_Site_ReplyDTO dto = new Inquiry_Site_ReplyDTO();
				dto.setInqre_no(rs.getInt("inqre_no"));
				dto.setInqsi_siteno(rs.getInt("inqsi_siteno"));
				dto.setInqre_userno(rs.getInt("inqre_userno"));
				dto.setInqre_content(rs.getString("inqre_content"));
				dto.setInqre_date(rs.getString("inqre_date"));
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

	public int InsertReplySiteContent(Inquiry_Site_ReplyDTO dto) {
		int result = 0;
		
		try {
			openConn();
			sql = "select count(*) from inquiry_site_reply";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setInqre_no(rs.getInt(1)+1);
				
				sql = "insert into inquiry_site_reply values(?, ?, ?, ?, sysdate)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getInqre_no());
				pstmt.setInt(2, dto.getInqsi_siteno());
				pstmt.setInt(3, dto.getInqre_userno());
				pstmt.setString(4, dto.getInqre_content());
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		
		return result;
	}

	public int deleteSiteReplyContent(int no) {
		int result = 0;
		
		try {
			openConn();
			sql = "delete from inquiry_site_reply where inqre_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			if(result>0) {
				sequence_reply(no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return result;
	}

	private void sequence_reply(int no) {
		try {
			sql = "update inquiry_site_reply set inqre_no = inqre_no -1 where inqre_no > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Inquiry_HotelDTO getHotelBoardContent(int no) {
		Inquiry_HotelDTO dto = null;
		try {
			openConn();
			sql = "select * from inquiry_hotel where inqho_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new Inquiry_HotelDTO();
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
				dto.setInqho_userno(rs.getInt("inqho_userno"));
				dto.setInqho_write_check(rs.getString("inqho_write_check"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return dto;
	}

	public int updateHotelBoardContent(Inquiry_HotelDTO dto) {
		int result = 0;
		
		try {
			openConn();
			sql = "update inquiry_hotel set inqho_title = ?, inqho_content = ?, inqho_update = sysdate where inqho_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getInqho_title());
			pstmt.setString(2, dto.getInqho_content());
			pstmt.setInt(3, dto.getInqho_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return result;
	}

	public ArrayList<Integer> deleteHotelBoardList(int no, int group) {
		ArrayList<Integer> delList = new ArrayList<>();
		
		try {
			openConn();
			sql = "select inqho_no from inquiry_hotel where inqho_group = ? order by inqho_no desc"; //삭제 글 리스트
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				delList.add(rs.getInt("inqho_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return delList;
	}
	
	public ArrayList<Integer> deleteHotelBoardStep(int no) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			openConn();
			sql = "select inqho_group from inquiry_hotel where inqho_no > ? and inqho_step = 1"; //삭제글보다 높은 글 중 원글 리스트
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("inqho_group"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return list;
	}
	
	public void sequenceHotelBoardStep(int group) {
		try {
			openConn();
			sql = "update inquiry_hotel set inqho_group = inqho_group -1 where inqho_group = ?"; //위 원글 리스트들 그룹 -1
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
	}

	public int deleteHotelBoardContent(int no) {
		int result = 0;
		
		try {
			openConn();
			sql = "delete from inquiry_hotel where inqho_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			if(result>0) {
				sequence_hotel(no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn();
		}
		return result;
	}

	private void sequence_hotel(int no) {
		try {
			sql = "update inquiry_hotel set inqho_no = inqho_no - 1 where inqho_no > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	
	
}