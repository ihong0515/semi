package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.promotion.PromotionDAO;
import com.model.promotion.PromotionDTO;
import com.model.user.PaymentDTO;
import com.model.user.ReserveDTO;
import com.model.user.UserDAO;

public class UserReservContentGetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int re_no = Integer.parseInt(request.getParameter("reserv_no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		
		ReserveDTO dto = dao.getReservContent(re_no);
		PaymentDTO payDto = dao.getPaymentContent(dto.getReserv_payment());
		PromotionDTO promDto = PromotionDAO.getInstance().getPromotionContent(dto.getReserv_promno());
		
		
		request.setAttribute("Dto", dto);
		request.setAttribute("PayDto", payDto);
		request.setAttribute("PromDto", promDto);
		return null;
	}
}