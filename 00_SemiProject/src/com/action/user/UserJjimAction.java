package com.action.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserJjimAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int user_no = Integer.parseInt(request.getParameter("no").trim());

		UserDAO user_dao = UserDAO.getInstance();
		UserDTO user_dto = user_dao.getUserContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user_dto);
		
		ArrayList<HotelDTO> list = new ArrayList<>();
		
		int[] jjimList = user_dto.getUser_jjimList();
		
		for(int i : jjimList) {
			if(i!=0) {
				list.add(HotelDAO.getInstance().getHotelContent(i));
			}
		}

		request.setAttribute("hotelList", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_jjim.jsp");
		return forward;
	}
}