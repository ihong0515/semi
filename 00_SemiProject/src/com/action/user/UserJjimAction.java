package com.action.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.user.UserDTO;

public class UserJjimAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserDTO user_dto = (UserDTO)request.getSession().getAttribute("loginUser");
		
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