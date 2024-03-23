package com.itwillbs.domain;

public class ProductionDTO {
	
	// 라인 멤버변수
	private String lineCode;
	private String lineName;
	private String update;
	private String name;
	private int lineStatus;
	
	// 작업지시 멤버 변수
	private String instructionCode;	// 작업지시코드
	private int insVol;				// 지시수량
	private String instructionDate;	// 작업지시일
	private int instractionStatus;	// 작업상태

	private String contractCode;	// 수주코드
	private int contractVol;		// 수주량
	private String contractDueDate;	// 수주일
	private String contractDate;	// 수주 납기일
	private int conInfoStatus;		// 수주 상태
	private String paymentDate;		// 결제일

	private String productName;		// 품목이름
	private String productCode;		// 품목코드
	
	
	@Override
	public String toString() {
		return "ProductionDTO [lineCode=" + lineCode + ", lineName=" + lineName + ", update=" + update + ", name="
				+ name + ", lineStatus=" + lineStatus + ", instructionCode=" + instructionCode + ", insVol=" + insVol
				+ ", instructionDate=" + instructionDate + ", instractionStatus=" + instractionStatus
				+ ", contractCode=" + contractCode + ", contractVol=" + contractVol + ", contractDueDate="
				+ contractDueDate + ", contractDate=" + contractDate + ", conInfoStatus=" + conInfoStatus
				+ ", paymentDate=" + paymentDate + ", productName=" + productName + ", productCode=" + productCode
				+ "]";
	}
	
	// 라인관리 getter/setter
	public String getLineCode() {
		return lineCode;
	}
	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	public String getUpdate() {
		return update;
	}
	public void setUpdate(String update) {
		this.update = update;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLineStatus() {
		return lineStatus;
	}
	public void setLineStatus(int lineStatus) {
		this.lineStatus = lineStatus;
	}
	
	
	// 작업지시 getter/setter
	public String getInstructionCode() {
		return instructionCode;
	}
	public void setInstructionCode(String instructionCode) {
		this.instructionCode = instructionCode;
	}
	public int getInsVol() {
		return insVol;
	}
	public void setInsVol(int insVol) {
		this.insVol = insVol;
	}
	public String getInstructionDate() {
		return instructionDate;
	}
	public void setInstructionDate(String instructionDate) {
		this.instructionDate = instructionDate;
	}
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getContractDueDate() {
		return contractDueDate;
	}
	public void setContractDueDate(String contractDueDate) {
		this.contractDueDate = contractDueDate;
	}
	public String getContractDate() {
		return contractDate;
	}
	public void setContractDate(String contractDate) {
		this.contractDate = contractDate;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getConInfoStatus() {
		return conInfoStatus;
	}
	public void setConInfoStatus(int conInfoStatus) {
		this.conInfoStatus = conInfoStatus;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getInstractionStatus() {
		return instractionStatus;
	}
	public void setInstractionStatus(int instractionStatus) {
		this.instractionStatus = instractionStatus;
	}
	public int getContractVol() {
		return contractVol;
	}
	public void setContractVol(int contractVol) {
		this.contractVol = contractVol;
	}
	
}
