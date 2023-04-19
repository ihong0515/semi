package com.action.owner;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.RoomDTO;
import com.model.owner.OwnerDAO;

public class OwnerRoomDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		RoomDTO dto = HotelDAO.getInstance().getRoomContent(no);
		
		int re = OwnerDAO.getInstance().deleteRoomContent(no);
		if(re>0) {
			Properties prop = new Properties();
			FileInputStream fis = new FileInputStream(request.getServletContext().getRealPath("\\WEB-INF\\classes\\com\\controller\\mapping.properties"));
			prop.load(fis);
			fis.close();
			String saveFolder = prop.getProperty(System.getenv("USERPROFILE").substring(3))+"\\hotel";
			saveFolder += "/"+dto.getRoom_photo_folder();
			
			File fol = new File(saveFolder);
			File[] fols = fol.listFiles();
			for(File f : fols) {
				f.delete();
			}
			fol.delete();
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_hotel_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('등록 객실의 삭제를 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}