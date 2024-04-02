package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

public class OrdercontractDTO {

	private String ord_cd;
	private String cli_cd;
	private String con_cd;
	private String pro_cd;
	private String user_id;
	private int ord_vol;
	private String cli_name;
	private String pro_name;
	private int pro_vol;
	private int pro_price;
	private int con_vol;
	private Timestamp ord_date;
	private Timestamp ord_due_date;
	private Timestamp ord_payment_date;
	private Timestamp con_date;
	private Timestamp con_due_date;
	private Timestamp con_payment_date;
	private int ord_info_status;
	private int con_info_status;
	
	
	
	@Override
	public String toString() {
		return "OrdercontractDTO [ord_cd=" + ord_cd + ", cli_cd=" + cli_cd + ", con_cd=" + con_cd + ", pro_cd=" + pro_cd
				+ ", user_id=" + user_id + ", ord_vol=" + ord_vol + ", cli_name=" + cli_name + ", pro_name=" + pro_name
				+ ", pro_vol=" + pro_vol + ", pro_price=" + pro_price + ", con_vol=" + con_vol + ", ord_date="
				+ ord_date + ", ord_due_date=" + ord_due_date + ", ord_payment_date=" + ord_payment_date + ", con_date="
				+ con_date + ", con_due_date=" + con_due_date + ", con_payment_date=" + con_payment_date
				+ ", ord_info_status=" + ord_info_status + ", con_info_status=" + con_info_status + "]";
	}
	public String getOrd_cd() {
		return ord_cd;
	}
	public void setOrd_cd(String ord_cd) {
		this.ord_cd = ord_cd;
	}
	public String getCli_cd() {
		return cli_cd;
	}
	public void setCli_cd(String cli_cd) {
		this.cli_cd = cli_cd;
	}
	public String getCon_cd() {
		return con_cd;
	}
	public void setCon_cd(String con_cd) {
		this.con_cd = con_cd;
	}
	public String getPro_cd() {
		return pro_cd;
	}
	public void setPro_cd(String pro_cd) {
		this.pro_cd = pro_cd;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOrd_vol() {
		return ord_vol;
	}
	public void setOrd_vol(int ord_vol) {
		this.ord_vol = ord_vol;
	}
	public String getCli_name() {
		return cli_name;
	}
	public void setCli_name(String cli_name) {
		this.cli_name = cli_name;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_vol() {
		return pro_vol;
	}
	public void setPro_vol(int pro_vol) {
		this.pro_vol = pro_vol;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getCon_vol() {
		return con_vol;
	}
	public void setCon_vol(int con_vol) {
		this.con_vol = con_vol;
	}
	public Timestamp getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Timestamp ord_date) {
		this.ord_date = ord_date;
	}
	public Timestamp getOrd_due_date() {
		return ord_due_date;
	}
	public void setOrd_due_date(Timestamp ord_due_date) {
		this.ord_due_date = ord_due_date;
	}
	public Timestamp getOrd_payment_date() {
		return ord_payment_date;
	}
	public void setOrd_payment_date(Timestamp ord_payment_date) {
		this.ord_payment_date = ord_payment_date;
	}
	public Timestamp getCon_date() {
		return con_date;
	}
	public void setCon_date(Timestamp con_date) {
		this.con_date = con_date;
	}
	public Timestamp getCon_due_date() {
		return con_due_date;
	}
	public void setCon_due_date(Timestamp con_due_date) {
		this.con_due_date = con_due_date;
	}
	public Timestamp getCon_payment_date() {
		return con_payment_date;
	}
	public void setCon_payment_date(Timestamp con_payment_date) {
		this.con_payment_date = con_payment_date;
	}
	public int getOrd_info_status() {
		return ord_info_status;
	}
	public void setOrd_info_status(int ord_info_status) {
		this.ord_info_status = ord_info_status;
	}
	public int getCon_info_status() {
		return con_info_status;
	}
	public void setCon_info_status(int con_info_status) {
		this.con_info_status = con_info_status;
	}
	
	
}