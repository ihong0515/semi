package com.action.promotion;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.action.Action;
import com.action.ActionForward;
import com.model.promotion.PromotionDAO;
import com.model.promotion.PromotionDTO;

public class PaymentPromotionContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		int prom_no = Integer.parseInt(request.getParameter("no"));
		
		PromotionDAO dao = PromotionDAO.getInstance();
		PromotionDTO dto = dao.getPromotionContent(prom_no);
		request.setAttribute("Promotion",dto);
		
		forward.setRedirect(false);
		forward.setPath("promotion/promotion_content.jsp");
		return forward;
	}

}
