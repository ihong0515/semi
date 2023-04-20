package com.action.owner;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.Inquiry_HotelDTO;
import com.model.owner.OwnerDAO;

public class OwnerBoardGetListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("hotel_no"));
		ArrayList<Inquiry_HotelDTO> list = OwnerDAO.getInstance().getBoardList(no);
		
		String str = "<boards>";
		for(Inquiry_HotelDTO i : list) {
			str += "<board>";
			str += "<board_no>"+i.getInqho_no()+"</board_no>"
				+ "<board_writer>"+i.getInqho_writer()+"</board_writer>"
				+ "<board_title>"+i.getInqho_title()+"</board_title>"
				+ "<board_date>"+i.getInqho_date().substring(5, 10)+"</board_date>";
				if(i.getInqho_update()==null) {
					str += "<board_update>null</board_update>";
				}else {
					str += "<board_update>"+i.getInqho_update().substring(5, 10)+"</board_update>";
				}
				str += "<board_group>"+i.getInqho_group()+"</board_group>"
						+ "<board_step>"+i.getInqho_step()+"</board_step>";
			str += "</board>";
		}
		str += "</boards>";
		response.getWriter().println(str);
		return null;
	}
}