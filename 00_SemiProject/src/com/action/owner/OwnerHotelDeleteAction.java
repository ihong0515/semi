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
import com.model.hotel.HotelDTO;
import com.model.owner.OwnerDAO;

public class OwnerHotelDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		HotelDTO dto = HotelDAO.getInstance().getHotelContent(no);

		int re = OwnerDAO.getInstance().deleteHotelContent(no);
		
		if(re>0) {
			Properties prop = new Properties();
			FileInputStream fis = new FileInputStream(request.getServletContext().getRealPath("\\WEB-INF\\classes\\com\\controller\\mapping.properties"));
			prop.load(fis);
			fis.close();
			String saveFolder = prop.getProperty(System.getenv("USERPROFILE").substring(3))+"\\hotel";
			saveFolder += "/"+dto.getHotel_photo_folder();
			
			File fol = new File(saveFolder);
			File[] fols = fol.listFiles();
			for(File f : fols) {
				if(f.isDirectory()) {
					File[] f1 = f.listFiles();
					for(File o : f1) {
						o.delete();
					}
				}
				f.delete();
			}
			fol.delete();
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_hotel_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('등록 호텔의 삭제를 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}