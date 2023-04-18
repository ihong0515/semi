package com.action.owner;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.owner.OwnerDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class OwnerHotelUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(request.getServletContext().getRealPath("\\WEB-INF\\classes\\com\\controller\\mapping.properties"));
		prop.load(fis);
		fis.close();
		
		String saveFolder = prop.getProperty(System.getenv("USERPROFILE").substring(3))+"\\hotel";
		
		int fileSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		HotelDTO dto = new HotelDTO();
		
		int ho_no = Integer.parseInt(multi.getParameter("no").trim());
		dto.setHotel_no(ho_no);
		String hotel_name = multi.getParameter("name").trim();
		dto.setHotel_name(hotel_name);
		dto.setHotel_addr(multi.getParameter("addr").trim());
		dto.setHotel_phone(multi.getParameter("phone").trim());
		dto.setHotel_location(multi.getParameter("location").trim());
		dto.setHotel_email(multi.getParameter("email").trim());
		dto.setHotel_room_count(Integer.parseInt(multi.getParameter("count").trim()));
		dto.setHotel_establish(Integer.parseInt(multi.getParameter("est").trim()));
		dto.setHotel_price_min(Integer.parseInt(multi.getParameter("pri_min").trim()));
		dto.setHotel_price_max(Integer.parseInt(multi.getParameter("pri_max").trim()));
		dto.setHotel_people_min(Integer.parseInt(multi.getParameter("peo_min").trim()));
		dto.setHotel_people_max(Integer.parseInt(multi.getParameter("peo_max").trim()));
		dto.setHotel_star(Integer.parseInt(multi.getParameter("star").trim()));
		ArrayList<String > hotel_hashtag = new ArrayList<String>();
		String[] hash = multi.getParameterValues("hashtag");
		for(String s : hash) {
			hotel_hashtag.add(s);
		}
		dto.setHotel_hashtag(hotel_hashtag);
		dto.setHotel_info(multi.getParameter("info").trim());
		
		File file = multi.getFile("file");
		if(file!=null) {
			String folder = HotelDAO.getInstance().getHotelContent(ho_no).getHotel_photo_folder();
			String realPath = saveFolder+"\\"+folder+"\\main.jpg";
			new File(realPath).delete();
			
			file.renameTo(new File(realPath));
		}
		int re = OwnerDAO.getInstance().updateHotelContent(dto);
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_hotel_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('호텔 수정에 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}