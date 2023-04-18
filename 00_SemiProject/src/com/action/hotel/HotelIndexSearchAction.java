package com.action.hotel;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.user.UserDTO;

public class HotelIndexSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String location = request.getParameter("param");
		String type = request.getParameter("search");
		ArrayList<HotelDTO> list = new ArrayList<>();
		PrintWriter out = response.getWriter();
		
		if(type.equals("Starlocation")) {
			list = HotelDAO.getInstance().getHotelIndexSearch(location, "hotel_star desc");
		}else {
			list = HotelDAO.getInstance().getHotelIndexSearch(location, "hotel_price_min asc");
		}
		
		UserDTO user = null;
		if(request.getSession().getAttribute("loginUser")!=null) {
			user = (UserDTO)request.getSession().getAttribute("loginUser");
		}
		String str = "<hotels>";
		for(HotelDTO dto : list) {
			int jjim_check = -1;
			if(user!=null){
				for(int i : user.getUser_jjimList()) {
					if(i==dto.getHotel_no()) {
						jjim_check = 1;
					}
				}
			}
			str += "<hotel>";
			str += "<hotel_no>" + dto.getHotel_no() + "</hotel_no>";
			str += "<hotel_photo_folder>" + dto.getHotel_photo_folder() + "</Hotel_photo_folder>";
			str += "<hotel_name>" + dto.getHotel_name() + "</hotel_name>";
			str += "<hotel_star>" + dto.getHotel_star() + "</hotel_star>";
			str += "<hotel_point>" + dto.getHotel_point() + "</hotel_point>";
			str += "<hotel_price_min>" + dto.getHotel_price_min() + "</hotel_price_min>";
			str += "<hotel_info>" + dto.getHotel_info() + "</hotel_info>";
			str += "<hotel_jjim_check>"+jjim_check+"</hotel_jjim_check>";
			str += "<hotel_hashtag1>"+dto.getHotel_hashtag().get(0)+"</hotel_hashtag1>";
			str += "<hotel_hashtag2>"+dto.getHotel_hashtag().get(1)+"</hotel_hashtag2>";
			str += "<hotel_hashtag3>"+dto.getHotel_hashtag().get(2)+"</hotel_hashtag3>";
			
			str += "</hotel>";
		}
		str += "</hotels>";
		
		out.println(str);
		return null;
	}
}