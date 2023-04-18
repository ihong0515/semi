package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.RoomDTO;

public class OwnerRoomContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int room_no = Integer.parseInt(request.getParameter("room_no").trim());
		
		RoomDTO dto = HotelDAO.getInstance().getRoomContent(room_no);
		
		String str = "<info>";
			str += "<no>"+dto.getRoom_no()+"</no>";
			str += "<name>"+dto.getRoom_name()+"</name>";
			str += "<price>"+dto.getRoom_price()+"</price>";
			str += "<bed>"+dto.getRoom_bed()+"</bed>";
			str += "<size>"+dto.getRoom_size()+"</size>";
			str += "<peo_min>"+dto.getRoom_people_min()+"</peo_min>";
			str += "<peo_max>"+dto.getRoom_people_max()+"</peo_max>";
			str += "<in>"+dto.getRoom_checkin()+"</in>";
			str += "<out>"+dto.getRoom_checkout()+"</out>";
			str += "<bf>"+dto.getRoom_breakfast()+"</bf>";
		str += "</info>";
		
		response.getWriter().println(str);
		return null;
	}
}