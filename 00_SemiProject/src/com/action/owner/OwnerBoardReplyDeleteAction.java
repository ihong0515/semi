package com.action.owner;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;

public class OwnerBoardReplyDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		ArrayList<Integer> checkList = new ArrayList<>(); //삭제성공여부를 체크할 객체
		int re = 1;
		
		BoardDAO dao = BoardDAO.getInstance();
		
		ArrayList<Integer> nomalList = dao.deleteHotelBoardStep(no); //삭제할 글보다 큰 글 중 step=1 글 리스트 in-no return-group
		for(int j : nomalList) {
			dao.sequenceHotelBoardStep(j); //in-group return-update
		}
		checkList.add(dao.deleteHotelBoardContent(no)); //in-no return-delete / 시퀀스 작동
		
		for(int i : checkList) { //delete 성공여부 체크
			if(i<=0) {
				re = -1;
			}
		}
		
		if(re==1) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_board_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('문의글 삭제에 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}