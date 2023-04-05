package com.action.promotion;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.promotion.PromotionDAO;
import com.model.user.UserDTO;

public class CouponMakeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		UserDTO loginUser= (UserDTO)session.getAttribute("loginUser"); 
		int user_no = loginUser.getUser_no();
		int prom_no = Integer.parseInt(request.getParameter("prom_no").trim());
		
		PromotionDAO dao = PromotionDAO.getInstance();
		
		String check = dao.coupon_receive_check(user_no, prom_no);
		String coupon_no = "";
		if(check.equals("1")) {
			coupon_no = dao.makeCoupon();
		}
		
		PrintWriter out = response.getWriter();
		
		
		out.println(check);
		out.println(coupon_no);
			
		return null;
	}

}
