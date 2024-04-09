package com.itwillbs.domain;

public class ProductDTO {
	
	
	private String productCode;     	//품목코드
	private String materialProductCode;	//자재코드
	private int productType;			//품목구분
	private String productName;			//완제품명
	private String productPName;		//자재품명
	private int productPrice;			//단가
	private String productOrigin;		//원산지
	private int prodcutVol;				//적재량
	private String requiredCode;		//소요량코드
	private int requiredVol;			//소요량
	private String name;
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "ProductDTO [productCode=" + productCode + ", materialProductCode=" + materialProductCode
				+ ", productType=" + productType + ", productName=" + productName + ", productPName=" + productPName
				+ ", productPrice=" + productPrice + ", productOrigin=" + productOrigin + ", prodcutVol=" + prodcutVol
				+ ", requiredCode=" + requiredCode + ", requiredVol=" + requiredVol + ", name=" + name + "]";
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getProductType() {
		return productType;
	}
	public void setProductType(int productType) {
		this.productType = productType;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	public int getProdcutVol() {
		return prodcutVol;
	}
	public void setProdcutVol(int prodcutVol) {
		this.prodcutVol = prodcutVol;
	}
	public String getRequiredCode() {
		return requiredCode;
	}
	public void setRequiredCode(String requiredCode) {
		this.requiredCode = requiredCode;
	}
	public int getRequiredVol() {
		return requiredVol;
	}
	public void setRequiredVol(int requiredVol) {
		this.requiredVol = requiredVol;
	}
	public String getMaterialProductCode() {
		return materialProductCode;
	}
	public void setMaterialProductCode(String materialProductCode) {
		this.materialProductCode = materialProductCode;
	}


	public String getProductPName() {
		return productPName;
	}


	public void setProductPName(String productPName) {
		this.productPName = productPName;
	}


	


	
	
	
	
	
	
}
