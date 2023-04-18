package com.action.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.ReviewDAO;
import com.model.board.ReviewDTO;
import com.model.user.ReserveDTO;
import com.model.user.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(request.getServletContext().getRealPath("\\WEB-INF\\classes\\com\\controller\\mapping.properties"));
		prop.load(new InputStreamReader(fis));
		
		String saveFolder = prop.getProperty(System.getenv("USERPROFILE").substring(3))+"\\review";
		
		int fileSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		ReviewDTO dto = new ReviewDTO();

		int reserv_no = Integer.parseInt(multi.getParameter("review_reservno"));
		
		ReserveDTO reserv = UserDAO.getInstance().getReservContent(reserv_no);
		
		int check = ReviewDAO.getInstance().checkReview(reserv_no);
		int hotel_no = reserv.getReserv_hotelno();
		
		if(reserv.getReserv_usecheck().equals("Y")) { //사용 후
			if(check==1){ //리뷰 등록 가능
				String hotel_name = multi.getParameter("review_hotelname").trim();
				
				dto.setReview_hotelno(hotel_no);
				dto.setReview_userno(reserv.getReserv_userno());
				dto.setReview_roomno(reserv.getReserv_roomno());
				dto.setReview_reservno(reserv_no);
				dto.setReview_checkindate(reserv.getReserv_start().substring(0, 10));
				dto.setReview_writer(multi.getParameter("review_username").trim());
				dto.setReview_content(multi.getParameter("review_content").trim());
				dto.setReview_point(Integer.parseInt(multi.getParameter("review_point").trim()));
				
				File file = multi.getFile("review_file");
				if(file!=null) {
					String fileName = file.getName();
					String homedir = saveFolder+"\\"+hotel_name;
					File path1 = new File(homedir);
					if(!path1.exists()) {
						path1.mkdir();
						homedir += "\\"+dto.getReview_writer();
						File path2 = new File(homedir);
						if(!path2.exists()) {
							path2.mkdir();
						}
					}
					saveFolder += "\\"+hotel_name+"\\"+dto.getReview_writer();
					file.renameTo(new File(saveFolder+"\\"+fileName));
					dto.setReview_photo(hotel_name+"/"+dto.getReview_writer()+"/"+fileName);
				}
				int result = ReviewDAO.getInstance().insertReviewContent(dto);
				
				if(result>0) {
					ActionForward forward = new ActionForward();
					
					forward.setRedirect(true);
					forward.setPath("hotel_get_Content.do?hotel_no="+hotel_no);
					return forward;
				}else {
					response.getWriter().println("<script>"
							+ "alert('리뷰 등록 실패.');"
							+ "history.back();"
							+ "</script>");
					return null;
				}
			}else { //리뷰 중복
				response.getWriter().println("<script>"
						+ "alert('이미 리뷰가 등록되어 있습니다.');"
						+ "history.back();"
						+ "</script>");
				return null;
			}
		}else { //사용 전
			response.getWriter().println("<script>"
					+ "alert('사용하기 전에는 리뷰를 작성하실 수 없습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}