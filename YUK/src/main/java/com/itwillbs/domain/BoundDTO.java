package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoundDTO {

	private String mib_cd;
	private String pib_cd;
	private String ord_cd;
	private String user_id;
	private String per_cd;
	private Timestamp mib_date;
	private Timestamp pib_date;
	private int mib_info_status;
	private int pib_info_status;
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
	private String pro_name;
	private int pro_type;
	private String ins_cd;
	
	
	public String getIns_cd() {
		return ins_cd;
	}
	public void setIns_cd(String ins_cd) {
		this.ins_cd = ins_cd;
	}
	public int getPro_type() {
		return pro_type;
	}
	public void setPro_type(int pro_type) {
		this.pro_type = pro_type;
	}
	public String getMib_cd() {
		return mib_cd;
	}
	public void setMib_cd(String mib_cd) {
		this.mib_cd = mib_cd;
	}
	public String getPib_cd() {
		return pib_cd;
	}
	public void setPib_cd(String pib_cd) {
		this.pib_cd = pib_cd;
	}
	public Timestamp getMib_date() {
		return mib_date;
	}
	public void setMib_date(Timestamp mib_date) {
		this.mib_date = mib_date;
	}
	public Timestamp getPib_date() {
		return pib_date;
	}
	public void setPib_date(Timestamp pib_date) {
		this.pib_date = pib_date;
	}
	public int getMib_info_status() {
		return mib_info_status;
	}
	public void setMib_info_status(int mib_info_status) {
		this.mib_info_status = mib_info_status;
	}
	public int getPib_info_status() {
		return pib_info_status;
	}
	public void setPib_info_status(int pib_info_status) {
		this.pib_info_status = pib_info_status;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
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
