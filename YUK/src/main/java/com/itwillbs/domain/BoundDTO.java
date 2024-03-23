package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoundDTO {

	private String ib_cd;
	private String ord_cd;
	private String user_id;
	private String per_cd;
	private Timestamp ib_date;
	private int ib_info_status;
	private String ob_cd;
	private String con_cd;
	private Timestamp ob_date;
	private int ob_info_status;
	private int ord_vol;
	private int con_vol;
	private String pro_cd;
	private int actual_completion_amount;
	private int per_good;
	private String wh_name;
	
	
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public int getActual_completion_amount() {
		return actual_completion_amount;
	}
	public void setActual_completion_amount(int actual_completion_amount) {
		this.actual_completion_amount = actual_completion_amount;
	}
	public int getPer_good() {
		return per_good;
	}
	public void setPer_good(int per_good) {
		this.per_good = per_good;
	}
	public String getIb_cd() {
		return ib_cd;
	}
	public void setIb_cd(String ib_cd) {
		this.ib_cd = ib_cd;
	}
	public String getOrd_cd() {
		return ord_cd;
	}
	public void setOrd_cd(String ord_cd) {
		this.ord_cd = ord_cd;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPer_cd() {
		return per_cd;
	}
	public void setPer_cd(String per_cd) {
		this.per_cd = per_cd;
	}
	public Timestamp getIb_date() {
		return ib_date;
	}
	public void setIb_date(Timestamp ib_date) {
		this.ib_date = ib_date;
	}
	public int getIb_info_status() {
		return ib_info_status;
	}
	public void setIb_info_status(int ib_info_status) {
		this.ib_info_status = ib_info_status;
	}
	public String getOb_cd() {
		return ob_cd;
	}
	public void setOb_cd(String ob_cd) {
		this.ob_cd = ob_cd;
	}
	public String getCon_cd() {
		return con_cd;
	}
	public void setCon_cd(String con_cd) {
		this.con_cd = con_cd;
	}
	public Timestamp getOb_date() {
		return ob_date;
	}
	public void setOb_date(Timestamp ob_date) {
		this.ob_date = ob_date;
	}
	public int getOb_info_status() {
		return ob_info_status;
	}
	public void setOb_info_status(int ob_info_status) {
		this.ob_info_status = ob_info_status;
	}
	public int getOrd_vol() {
		return ord_vol;
	}
	public void setOrd_vol(int ord_vol) {
		this.ord_vol = ord_vol;
	}
	public int getCon_vol() {
		return con_vol;
	}
	public void setCon_vol(int con_vol) {
		this.con_vol = con_vol;
	}
	public String getPro_cd() {
		return pro_cd;
	}
	public void setPro_cd(String pro_cd) {
		this.pro_cd = pro_cd;
	}
	
	
	
}
