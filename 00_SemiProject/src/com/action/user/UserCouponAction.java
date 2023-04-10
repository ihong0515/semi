package com.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.promotion.CouponDTO;
import com.model.promotion.PromotionDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserCouponAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO user_dto = dao.getUserContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user_dto);
		
		List<CouponDTO> list = dao.getCouponList(user_no);
		request.setAttribute("couponList", list);
		
		PromotionDTO prom_dto = dao.getPromContentbyuserno(user_no);
		request.setAttribute("prom_dto", prom_dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_coupon.jsp");
		
		return forward;
		
	}

}
