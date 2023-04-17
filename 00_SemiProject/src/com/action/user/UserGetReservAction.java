package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.user.ReserveDTO;
import com.model.user.UserDAO;

public class UserGetReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String status = request.getParameter("param");
		UserDAO dao = UserDAO.getInstance();
				
		List<ReserveDTO> reserv_list = new ArrayList<ReserveDTO>();
		reserv_list = dao.getReservListStatus(user_no, status);
		
		String result = "";
		if(reserv_list == null) {
			result += "<reserv><p>예약 내역이 존재하지 않습니다.</p></reserv>";
		} else {
			result += "<reservations>";
			for(ReserveDTO dto : reserv_list) {
				String photo = HotelDAO.getInstance().getHotelContent(dto.getReserv_hotelno()).getHotel_photo_folder();
				result += "<reserv>";
				result += "<reserv_no>"+dto.getReserv_no()+"</reserv_no>";
				result += "<reserv_hotelname>"+dto.getReserv_hotelname()+"</reserv_hotelname>";
				result += "<reserv_roomname>"+dto.getReserv_roomname()+"</reserv_roomname>";
				result += "<reserv_start>"+dto.getReserv_start().subSequence(0, 4)+"년 "+dto.getReserv_start().subSequence(5, 7)+"월 "+dto.getReserv_start().subSequence(8, 10)+"일</reserv_start>";
				result += "<reserv_end>"+dto.getReserv_end().subSequence(0, 4)+"년 "+dto.getReserv_end().subSequence(5, 7)+"월 "+dto.getReserv_end().subSequence(8, 10)+"일</reserv_end>";
				result += "<reserv_realprice>"+dto.getReserv_realprice()+"</reserv_realprice>";
				result += "<photo>"+photo+"</photo>";
				result += "</reserv>";
			}
			result += "</reservations>";
		}
		
		PrintWriter out = response.getWriter();
		out.println(result);
		
		return null;
	}

	
}
