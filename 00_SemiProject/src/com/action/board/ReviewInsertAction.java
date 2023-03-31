package com.action.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.ReviewDAO;
import com.model.board.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String saveFolder = "C:\\NCS\\workspace_semi\\00_SemiProject\\WebContent\\image\\review";
		int fileSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		ReviewDTO dto = new ReviewDTO();
		int user_no = Integer.parseInt(multi.getParameter("review_userno").trim());
		
		dto.setReview_userno(user_no);
		int check = ReviewDAO.getInstance().checkReserve(dto);
		
		if(check == 1) {
			int hotel_no = Integer.parseInt(multi.getParameter("review_hotelno").trim());
			String hotel_name = multi.getParameter("review_hotelname").trim();
			dto.setReview_writer(multi.getParameter("review_userid").trim());
			dto.setReview_content(multi.getParameter("review_content").trim());
			dto.setReview_hotelno(hotel_no);
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
		}else if(check ==-1) {
			response.getWriter().println("<script>"
					+ "alert('이미 리뷰가 등록되어 있습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}else {
			response.getWriter().println("<script>"
					+ "alert('사용 하신 상품에만 리뷰를 등록할 수 있습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}