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
		PrintWriter out = response.getWriter();
		
		int user_no = loginUser.getUser_no();
		
		int prom_no = Integer.parseInt(request.getParameter("prom_no").trim());
		
		PromotionDAO dao = PromotionDAO.getInstance();
		
		String check = dao.coupon_receive_check(user_no, prom_no);
		String coupon_no = "";
		if(check.equals("1")) {
			//쿠폰 테이블에서 해당 시리얼 번호가 있는지 조회 해보기.
			coupon_no = dao.couponCheck(); // 쿠폰 테이블에서 조회 쿠폰 유저 넘버가 user_no인 값의 serial no가 있느냐.
			PromotionDAO.getInstance().insertCoupon(user_no,prom_no,coupon_no);
		}else if(check.equals("-1")){
			coupon_no = "발급된 쿠폰을 이미 사용하셨습니다.";
		}else {
			coupon_no = "이미 쿠폰을 수령하셨습니다.<br> 보유하신 쿠폰 번호는 <br> " + check;
		}
		
		
		//유저보유 쿠폰 or 사용 불가 -1 or 새로운 쿠폰
		out.println(coupon_no);
			
		return null;
	}

}
