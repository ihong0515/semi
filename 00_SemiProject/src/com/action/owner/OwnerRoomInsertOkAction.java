package com.action.owner;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.*;
import com.model.owner.ImageZipControll;
import com.model.owner.OwnerDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class OwnerRoomInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(request.getServletContext().getRealPath("\\WEB-INF\\classes\\com\\controller\\mapping.properties"));
		prop.load(new InputStreamReader(fis));
		fis.close();
		
		String saveFolder = prop.getProperty(System.getenv("USERPROFILE").substring(3))+"\\hotel";
		
		int fileSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		RoomDTO dto = new RoomDTO();
		int ho_no = Integer.parseInt(multi.getParameter("ho_no").trim());
		dto.setRoom_hotelno(Integer.parseInt(multi.getParameter("ho_no").trim()));
		dto.setRoom_price(Integer.parseInt(multi.getParameter("pri").trim()));
		dto.setRoom_size(multi.getParameter("size").trim());
		dto.setRoom_people_min(Integer.parseInt(multi.getParameter("peo_min").trim()));
		dto.setRoom_people_max(Integer.parseInt(multi.getParameter("peo_max").trim()));
		dto.setRoom_breakfast(multi.getParameter("bf").trim());
		String name = multi.getParameter("name").trim();
		dto.setRoom_name(name);
		dto.setRoom_photo_folder(name);
		dto.setRoom_bed(multi.getParameter("bed").trim());
		dto.setRoom_checkin(multi.getParameter("in").trim());
		dto.setRoom_checkout(multi.getParameter("out").trim());
		
		File file = multi.getFile("file");
		
		String fileName = file.getName();
		
		HotelDTO hotel = HotelDAO.getInstance().getHotelContent(ho_no);
		
		saveFolder += "/"+hotel.getHotel_photo_folder()+"/"+name;
		
		File dir = new File(saveFolder);
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		if(file.renameTo(new File(saveFolder+"/"+fileName))) {
			if(new ImageZipControll().zipController(saveFolder+"/", fileName, saveFolder+"/")) {
				
				File[] updList =new File(saveFolder).listFiles();
		        dto.setRoom_photo_folder_size(updList.length);
				
				for(int i=0; i<updList.length;i++) {
					updList[i].renameTo(new File(saveFolder+"/"+(i+1)+".jpg"));
				}
				
				int re = OwnerDAO.getInstance().insertRoomContent(dto);
				if(re>0) {
					ActionForward forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("owner_hotel_list.do");
					return forward;
				}else {
					response.getWriter().println("<script>"
							+ "alert('객실 등록에 실패하였습니다.');"
							+ "history.back();"
							+ "</script>");
					return null;
				}
			}else {
				System.out.println("압축풀기 실패");
				
				response.getWriter().println("<script>"
						+ "alert('사진파일 처리중 오류가 발생했습니다.');"
						+ "history.back();"
						+ "</script>");
				return null;
			}
		}else {
			System.out.println("파일 이동 실패");
			
			response.getWriter().println("<script>"
					+ "alert('사진파일 처리중 오류가 발생했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}