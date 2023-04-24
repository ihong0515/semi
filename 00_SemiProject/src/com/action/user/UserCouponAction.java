package com.action.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.promotion.CouponDTO;
import com.model.promotion.PromotionDTO;
import com.model.user.UserDAO;

public class UserCouponAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		SessionRenewal.renewal(request);
		
		List<CouponDTO> coup_list = dao.getCouponList(user_no);
		request.setAttribute("couponList", coup_list);
		
		ArrayList<PromotionDTO> prom_list = dao.getPromContentbyuserno(user_no);
		request.setAttribute("promList", prom_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_coupon.jsp");
		
		return forward;
		
	}

}
