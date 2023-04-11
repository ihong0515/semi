package com.action.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_Site_ReplyDTO;
import com.model.user.UserDAO;

public class ReplySiteGetListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ArrayList<Inquiry_Site_ReplyDTO> list = BoardDAO.getInstance().getSiteReplyList(Integer.parseInt(request.getParameter("board_no")));
		
		String str = "<replys>";
		for(Inquiry_Site_ReplyDTO dto : list) {
			UserDAO dao = UserDAO.getInstance();
			
			str += "<reply>";
			str += "<reply_no>"+dto.getInqre_no()+"</reply_no>";
			str += "<reply_user_name>"+dao.getUserContent(dto.getInqre_userno()).getUser_name()+"</reply_user_name>";
			str += "<reply_content>"+dto.getInqre_content()+"</reply_content>";
			str += "<reply_date>"+dto.getInqre_date().substring(5, 10)+"</reply_date>";
			str += "</reply>";
		}
		str += "</replys>";
		response.getWriter().println(str);
		return null;
	}
}