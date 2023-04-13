package com.action.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;

public class BoardHotelDeleteContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("board_no").trim());
		int group = Integer.parseInt(request.getParameter("group_no").trim());
		int step = Integer.parseInt(request.getParameter("step_no").trim());
		
		ArrayList<Integer> checkList = new ArrayList<>(); //삭제성공여부를 체크할 객체
		int re = 1;
		
		ArrayList<Integer> delList = new ArrayList<Integer>();//삭제할 리스트를 담을 객체
		
		BoardDAO dao = BoardDAO.getInstance();
		
		if(step==1) {
			delList = dao.deleteHotelBoardList(no, group); //원본글일 경우 삭제할 글 리스트 return no
		}else {
			delList.add(no); //답변일시 답변만 삭제
		}
		
		for(int i : delList) {
			ArrayList<Integer> nomalList = dao.deleteHotelBoardStep(i); //삭제할 글보다 큰 글 중 step=1 글 리스트 in-no return-group
			for(int j : nomalList) {
				dao.sequenceHotelBoardStep(j); //in-group return-update
			}
			checkList.add(dao.deleteHotelBoardContent(i)); //in-no return-delete / 시퀀스 작동
		}
		
		for(int i : checkList) { //delete 성공여부 체크
			if(i<=0) {
				re = -1;
			}
		}
		
		if(re==1) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("user_board_main.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('삭제 중 오류가 발생했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
			
		}
	}
}