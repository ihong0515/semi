package com.action.owner;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.RoomDTO;
import com.model.owner.OwnerDAO;

public class OwnerHotelDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());

		ArrayList<RoomDTO> roomList = OwnerDAO.getInstance().getRoomList(no);
		
		
		
		return null;
	}
}