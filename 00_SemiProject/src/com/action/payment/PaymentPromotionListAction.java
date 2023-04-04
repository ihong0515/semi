package com.action.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.payment.PromotionDAO;
import com.model.payment.PromotionDTO;

public class PaymentPromotionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		PromotionDAO dao = PromotionDAO.getInstance();
		
		List<PromotionDTO>list = dao.getpromotionList();
		
		request.setAttribute("Promotion", list);
		
		
	
		forward.setRedirect(false);
		forward.setPath("promotion/promotion.jsp");
		return forward;
	}

}
