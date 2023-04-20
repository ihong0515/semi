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
import com.model.hotel.HotelDAO;
import com.model.hotel.RoomDTO;
import com.model.owner.ImageZipControll;
import com.model.owner.OwnerDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class OwnerRoomUpdateOkAction implements Action {

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
		
		int no = Integer.parseInt(multi.getParameter("no").trim());
		String name = multi.getParameter("name").trim();
		int price = Integer.parseInt(multi.getParameter("pri").trim());
		String bed = multi.getParameter("bed").trim();
		String size = multi.getParameter("size").trim();
		int min = Integer.parseInt(multi.getParameter("peo_min").trim());
		int max = Integer.parseInt(multi.getParameter("peo_max").trim());
		String in = multi.getParameter("in").trim();
		String out = multi.getParameter("out").trim();
		String bf = multi.getParameter("bf").trim();
		
		dto.setRoom_no(no);
		dto.setRoom_name(name);
		dto.setRoom_price(price);
		dto.setRoom_bed(bed);
		dto.setRoom_size(size);
		dto.setRoom_people_min(min);
		dto.setRoom_people_max(max);
		dto.setRoom_checkin(in);
		dto.setRoom_checkout(out);
		dto.setRoom_breakfast(bf);
		
		File file = multi.getFile("file");
		if(file!=null) {
			String fileName = file.getName();
			
			RoomDTO set = HotelDAO.getInstance().getRoomContent(no);
			String folder = set.getRoom_photo_folder();
			
			String realPath = saveFolder+"/"+folder;
			
			File delfile = new File(realPath);
			
			File[] delList = delfile.listFiles();
			
			for(File f : delList) {
				f.delete();
			}
			
			boolean result = file.renameTo(new File(realPath+"/"+fileName));
			
			if(result) {
				if(new ImageZipControll().zipController(realPath+"/", fileName, realPath+"/")) {
					File[] updList =new File(realPath).listFiles();
			        dto.setRoom_photo_folder_size(updList.length);
					
					for(int i=0; i<updList.length;i++) {
						updList[i].renameTo(new File(realPath+"/"+(i+1)+".jpg"));
					}
			        
				}else {
					System.out.println("압축 풀기 실패");
				}
			}else {
				System.out.println("파일 이동 실패");
			}
		}
		
		int re = OwnerDAO.getInstance().updateRoomContent(dto);
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_hotel_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('객실 수정에 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}