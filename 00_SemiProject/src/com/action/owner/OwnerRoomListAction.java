package com.action.owner;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.hotel.RoomDTO;
import com.model.owner.OwnerDAO;

public class OwnerRoomListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		ArrayList<RoomDTO> list = OwnerDAO.getInstance().getRoomList(hotel_no);
		HotelDTO dto = HotelDAO.getInstance().getHotelContent(hotel_no);
		
		
		String str = "<info>";
		for(RoomDTO r : list) {
			str += "<room>";
			str += "<room_no>"+r.getRoom_no()+"</room_no>";
			str += "<room_name>"+r.getRoom_name()+"</room_name>";
			str += "</room>";
		}
			str += "<ho_no>"+dto.getHotel_no()+"</ho_no>";
			str += "<ho_name>"+dto.getHotel_name()+"</ho_name>";
			str += "<ho_phone>"+dto.getHotel_phone()+"</ho_phone>";
			str += "<ho_addr>"+dto.getHotel_addr()+"</ho_addr>";
			str += "<ho_location>"+dto.getHotel_location()+"</ho_location>";
			str += "<ho_email>"+dto.getHotel_email()+"</ho_email>";
			str += "<ho_info>"+dto.getHotel_info()+"</ho_info>";
			str += "<ho_room_count>"+dto.getHotel_room_count()+"</ho_room_count>";
			str += "<ho_est>"+dto.getHotel_establish()+"</ho_est>";
			str += "<ho_photo>"+dto.getHotel_photo_folder()+"</ho_photo>";
			str += "<ho_pri_min>"+dto.getHotel_price_min()+"</ho_pri_min>";
			str += "<ho_pri_max>"+dto.getHotel_price_max()+"</ho_pri_max>";
			str += "<ho_peo_min>"+dto.getHotel_people_min()+"</ho_peo_min>";
			str += "<ho_peo_max>"+dto.getHotel_people_max()+"</ho_peo_max>";
			str += "<ho_star>"+dto.getHotel_star()+"</ho_star>";
			str += "<ho_hash>"+dto.getHotel_hashtag()+"</ho_hash>";
			
		str += "</info>";
		
		response.getWriter().println(str);
		return null;
	}

}
