package com.model.user;

public class PaymentDTO {
	private int pay_no;
	private int pay_userno;
	private String pay_name;
	private int pay_cardno;
	private String pay_cardcom;
	private int pay_cvc;
	private String pay_pwd;
	private String pay_date;
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getPay_userno() {
		return pay_userno;
	}
	public void setPay_userno(int pay_userno) {
		this.pay_userno = pay_userno;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public int getPay_cardno() {
		return pay_cardno;
	}
	public void setPay_cardno(int pay_cardno) {
		this.pay_cardno = pay_cardno;
	}
	public String getPay_cardcom() {
		return pay_cardcom;
	}
	public void setPay_cardcom(String pay_cardcom) {
		this.pay_cardcom = pay_cardcom;
	}
	public int getPay_cvc() {
		return pay_cvc;
	}
	public void setPay_cvc(int pay_cvc) {
		this.pay_cvc = pay_cvc;
	}
	public String getPay_pwd() {
		return pay_pwd;
	}
	public void setPay_pwd(String pay_pwd) {
		this.pay_pwd = pay_pwd;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
}