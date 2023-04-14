package com.action.hotel;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.*;
import com.model.board.*;
import com.model.hotel.*;
import com.model.user.*;

public class HotelContentAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		UserDTO user = (UserDTO)session.getAttribute("loginUser");
		
		if(user!=null) {
			List<ReserveDTO> reserv_list = UserDAO.getInstance().getReservList(user.getUser_no(), hotel_no);
			request.setAttribute("Re_list", reserv_list);
		}
		
		ArrayList<Date> checkdate = (ArrayList<Date>)session.getAttribute("CheckDate");
		ArrayList<Integer> hotel_no_list = new ArrayList<Integer>();
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		String inFormat = "";
		String outFormat = "";
		if(checkdate!=null) {
			inFormat = SDF.format(checkdate.get(0));
			outFormat = SDF.format(checkdate.get(1));
		}else {
			Calendar cal = Calendar.getInstance();
			inFormat = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
			outFormat = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+(cal.get(Calendar.DAY_OF_MONTH)+1);
		}
		hotel_no_list = UserDAO.getInstance().checkReservDate(inFormat, outFormat, hotel_no);
		
		ArrayList<RoomDTO> roomList = HotelDAO.getInstance().getRoomList(hotel_no, hotel_no_list);
		
		HotelDTO hDTO = HotelDAO.getInstance().getHotelContent(hotel_no);
		HotelPolicyDTO pDTO = HotelDAO.getInstance().getHotelPolicyContent(hotel_no);
		ArrayList<ReviewDTO> reviewList = ReviewDAO.getInstance().getReviewList(hotel_no);
		
		request.setAttribute("RoomList", roomList);
		request.setAttribute("HotelDTO", hDTO);
		request.setAttribute("HPDTO", pDTO);
		request.setAttribute("ReviewList", reviewList);
		
		ArrayList<HotelDTO> visitList = null;
		
		if(session.getAttribute("VisitList")==null) {
			visitList = new ArrayList<>();
		}else {
			visitList = (ArrayList<HotelDTO>)session.getAttribute("VisitList");
		}
		
		if(visitList.size()>0) {
			for(int i = 0; i<visitList.size();i++) {
				if(visitList.get(i).getHotel_no()==hotel_no) {
					visitList.remove(i);
				}
			}
		}
		
		ArrayList<HotelDTO> realList = new ArrayList<>();
		
		realList.add(hDTO);
		
		if(visitList.size()>0) {
			for(int i = 0; i<visitList.size();i++) {
				realList.add(visitList.get(i));
			}
		}
		
		if(realList.size()>3) {
			realList.remove(3);
		}
		
		session.setAttribute("VisitList", realList);
		
		forward.setRedirect(false);
		forward.setPath("hotel/hotel_content.jsp");
		return forward;
	}
}