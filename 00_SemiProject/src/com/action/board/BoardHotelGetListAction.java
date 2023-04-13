package com.action.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_HotelDTO;
import com.model.hotel.HotelDAO;
import com.model.user.UserDTO;

public class BoardHotelGetListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int page = 0; //현재 페이지를 지정하는 변수
		int rowsize = 5; // 페이지의 게시물 갯수, 크기
		int totalRecord = 0; //전체 게시물 수
		int allPage = 0; //전체 페이지네이션의 수
		
		UserDTO user = (UserDTO)request.getSession().getAttribute("loginUser");
		
		totalRecord = BoardDAO.getInstance().getHotelBoardCount(user.getUser_no()); //전체 게시물의 수를 확인
		allPage = (int)(Math.ceil(totalRecord/(double)rowsize)); //Math.ceil() 나머지 올림 메서드
		
		if(request.getParameter("page") != null) {
			if(Integer.parseInt(request.getParameter("page").trim())<1) {
				page = 1;
			}else if(Integer.parseInt(request.getParameter("page").trim())>allPage) {
				page = allPage;
			}else {
				page = Integer.parseInt(request.getParameter("page").trim());
			}
		}else {
			page = 1;
		}
		
		int startNo = (page *rowsize) - (rowsize - 1); //시작번호
		int endNo = (page*rowsize);  //끝번호
		
		ArrayList<Inquiry_HotelDTO> list = BoardDAO.getInstance().getHotelPageBoardList(user.getUser_no(), startNo, endNo);
		
		int listSize = totalRecord - ((page-1)*rowsize);
		
		String board_list = "<board_list>";
		
		for(Inquiry_HotelDTO dto : list) {
			String hotel_name = HotelDAO.getInstance().getHotelContent(dto.getInqho_hotelno()).getHotel_name();
			
			board_list += "<board>"
					+ "<board_no>"+dto.getInqho_no()+"</board_no>"
					+ "<board_view_no>"+listSize+"</board_view_no>"
					+ "<board_writer>"+dto.getInqho_writer()+"</board_writer>"
					+ "<board_title>"+dto.getInqho_title()+"</board_title>"
					+ "<board_content>"+dto.getInqho_content()+"</board_content>"
					+ "<board_date>"+dto.getInqho_date().substring(5, 10)+"</board_date>";
			if(dto.getInqho_update()==null) {
				board_list += "<board_update>null</board_update>";
			}else {
				board_list += "<board_update>"+dto.getInqho_update().substring(5, 10)+"</board_update>";
			}
			board_list += "<board_group>"+dto.getInqho_group()+"</board_group>"
					+ "<board_step>"+dto.getInqho_step()+"</board_step>";

			board_list += "<board_ownerno>"+dto.getInqho_ownerno()+"</board_ownerno>";
			board_list += "<board_userno>"+dto.getInqho_userno()+"</board_userno>";
			board_list += "<board_hotelname>"+hotel_name+"</board_hotelname>";
			board_list += "</board>";
			
			listSize--;
		}
		
		board_list += "<pagenation>"
				+ "<page>"+page+"</page>"
				+ "<allPage>"+allPage+"</allPage>";
		board_list += "</pagenation>";
		board_list += "</board_list>";
		response.getWriter().println(board_list);
		
		return null;
	}
}