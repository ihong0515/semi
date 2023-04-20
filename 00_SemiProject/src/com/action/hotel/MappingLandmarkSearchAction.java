package com.action.hotel;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.LandmarkDTO;

public class MappingLandmarkSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String location = request.getParameter("param");
		
		ArrayList<LandmarkDTO> list = new ArrayList<>();
		PrintWriter out = response.getWriter();
		
		list = HotelDAO.getInstance().getLandmarkIndexSearch(location);
		
		String str = "<landmarks>";
		
		for(LandmarkDTO dto : list) {
			str += "<landmark>";
			str += "<landmark_location>" + dto.getLandmark_location() + "</landmark_location>";
			str += "<landmark_name>" + dto.getLandmark_name() + "</landmark_name>";
			str += "<landmark_image>" + dto.getLandmark_image() + "</landmark_image>";
			str += "<landmark_addr>" + dto.getLandmark_addr() + "</landmark_addr>";
			str += "<landmark_info>" + dto.getLandmark_info() + "</landmark_location_info>";
			str += "</landmark>";
		}
		
		str += "</landmarks>";
		
		out.println(str);
		return null;
	}
}