package com.action.promotion;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.promotion.*;

public class CouponGetSaleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int coup_no = Integer.parseInt(request.getParameter("coup_no").trim());
		int price = Integer.parseInt(request.getParameter("price").trim());
		
		CouponDTO coup = PromotionDAO.getInstance().getCouponContent(coup_no);
		PromotionDTO prom = PromotionDAO.getInstance().getPromotionContent(coup.getCoup_promno());
		
		int salePrice = price*coup.getCoup_sale()/100;
		int realPrice = price - salePrice;
		
		String str = "<coupons>"
				+ "<coupon>"
				+ "<coup_no>"+coup.getCoup_no()+"</coup_no>"
				+ "<prom_no>"+coup.getCoup_promno()+"</prom_no>"
				+ "<name>"+prom.getProm_name()+"</name>"
				+ "<sale>"+coup.getCoup_sale()+"</sale>"
				+ "<saleP>"+salePrice+"</saleP>"
				+ "<price>"+realPrice+"</price>"
				+ "</coupon>"
				+ "</coupons>";
		
		response.getWriter().println(str);
		return null;
	}
}