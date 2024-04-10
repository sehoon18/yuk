package com.itwillbs.domain;

public class WarehouseDTO {
	
	private String warehouseCode;        //창고 코드
	private String warehouseName;        //창고명
	private String warehouseArea;        //구역
	private int warehouseMvol;           //최대적재량
	private String warehouseLocal;       //창고위치(지역)
	private String warehouseTelNumber;   //창고 전화번호
	private String productCode;          //품목코드
	private String productName;		     //품명
	private int prodcutVol;			     //적재량
	private int productType;			 //품목구분
	private int realAmount;              //실사량
	private String name;
	
	
	@Override
	public String toString() {
		return "WarehouseDTO [warehouseCode=" + warehouseCode + ", warehouseName=" + warehouseName + ", warehouseArea="
				+ warehouseArea + ", warehouseMvol=" + warehouseMvol + ", warehouseLocal=" + warehouseLocal
				+ ", warehouseTelNumber=" + warehouseTelNumber + ", productCode=" + productCode + ", productName="
				+ productName + ", prodcutVol=" + prodcutVol + ", productType=" + productType + ", realAmount="
				+ realAmount + ", name=" + name + "]";
	}
	
	
	public String getWarehouseCode() {
		return warehouseCode;
	}
	public void setWarehouseCode(String warehouseCode) {
		this.warehouseCode = warehouseCode;
	}
	public String getWarehouseName() {
		return warehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}
	public String getWarehouseArea() {
		return warehouseArea;
	}
	public void setWarehouseArea(String warehouseArea) {
		this.warehouseArea = warehouseArea;
	}
	public int getWarehouseMvol() {
		return warehouseMvol;
	}
	public void setWarehouseMvol(int warehouseMvol) {
		this.warehouseMvol = warehouseMvol;
	}
	public String getWarehouseLocal() {
		return warehouseLocal;
	}
	public void setWarehouseLocal(String warehouseLocal) {
		this.warehouseLocal = warehouseLocal;
	}
	public String getWarehouseTelNumber() {
		return warehouseTelNumber;
	}
	public void setWarehouseTelNumber(String warehouseTelNumber) {
		this.warehouseTelNumber = warehouseTelNumber;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProdcutVol() {
		return prodcutVol;
	}
	public void setProdcutVol(int prodcutVol) {
		this.prodcutVol = prodcutVol;
	}
	public int getProductType() {
		return productType;
	}
	public void setProductType(int productType) {
		this.productType = productType;
	}
	public int getRealAmount() {
		return realAmount;
	}
	public void setRealAmount(int realAmount) {
		this.realAmount = realAmount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}	