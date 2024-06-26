package com.itwillbs.domain;

public class ProductionDTO {
	
	// LINE
	private String lineCode;
	private String lineName;
	private String update;
	private String name;
	private int lineStatus;
	
	// instruction 
	private String instructionCode;	// �۾������ڵ�
	private int insVol;				// ���ü���
	private String instructionDate;	// �۾�������
	private int instractionStatus;	// �۾�����

	// contract
	private String contractCode;	// �����ڵ�
	private int contractVol;		// ���ַ�
	private String contractDueDate;	// ������
	private String contractDate;	// ���� ������
	private int conInfoStatus;		// ���� ����
	private String paymentDate;		// ������

	// product
	private String productName;		// ǰ���̸�
	private String productCode;		// ǰ���ڵ�
	private int productVol;
	
	// performance
	private String perCode;
	private int perVol;
	private String perDate;
	private String perNote;			// 불량사유
	private int perACA;				// 실적수량
	private int perGood;			// 양불구분
	
	// required
	private String reqCode;
	private String pProCode;
	private String mProCode;
	private String reqVol;
	
	// pinbound
	private String pibCode;
	private int pibStatus;
	
	// etc
	private String proName1;
	private String proName2;
	private int vol;
	private String defectRate;
	private String userName;
	
	
	@Override
	public String toString() {
		return "ProductionDTO [lineCode=" + lineCode + ", lineName=" + lineName + ", update=" + update + ", name="
				+ name + ", lineStatus=" + lineStatus + ", instructionCode=" + instructionCode + ", insVol=" + insVol
				+ ", instructionDate=" + instructionDate + ", instractionStatus=" + instractionStatus
				+ ", contractCode=" + contractCode + ", contractVol=" + contractVol + ", contractDueDate="
				+ contractDueDate + ", contractDate=" + contractDate + ", conInfoStatus=" + conInfoStatus
				+ ", paymentDate=" + paymentDate + ", productName=" + productName + ", productCode=" + productCode
				+ ", productVol=" + productVol + ", perCode=" + perCode + ", perVol=" + perVol + ", perDate=" + perDate
				+ ", perNote=" + perNote + ", perACA=" + perACA + ", perGood=" + perGood + ", reqCode=" + reqCode
				+ ", pProCode=" + pProCode + ", mProCode=" + mProCode + ", reqVol=" + reqVol + ", pibCode=" + pibCode
				+ ", pibStatus=" + pibStatus + ", proName1=" + proName1 + ", proName2=" + proName2 + ", vol=" + vol
				+ ", defectRate=" + defectRate + "]";
	}
	// ���ΰ��� getter/setter
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
	
	
	// �۾����� getter/setter
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
	public int getProductVol() {
		return productVol;
	}
	public void setProductVol(int productVol) {
		this.productVol = productVol;
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

	// performance g/s
	public String getPerCode() {
		return perCode;
	}

	public void setPerCode(String perCode) {
		this.perCode = perCode;
	}

	public int getPerVol() {
		return perVol;
	}

	public void setPerVol(int perVol) {
		this.perVol = perVol;
	}

	public String getPerDate() {
		return perDate;
	}

	public void setPerDate(String perDate) {
		this.perDate = perDate;
	}

	public String getPerNote() {
		return perNote;
	}

	public void setPerNote(String perNote) {
		this.perNote = perNote;
	}

	public int getPerACA() {
		return perACA;
	}

	public void setPerACA(int perACA) {
		this.perACA = perACA;
	}

	public int getPerGood() {
		return perGood;
	}

	public void setPerGood(int perGood) {
		this.perGood = perGood;
	}

	public String getReqCode() {
		return reqCode;
	}

	public void setReqCode(String reqCode) {
		this.reqCode = reqCode;
	}

	public String getpProCode() {
		return pProCode;
	}

	public void setpProCode(String pProCode) {
		this.pProCode = pProCode;
	}

	public String getmProCode() {
		return mProCode;
	}

	public void setmProCode(String mProCode) {
		this.mProCode = mProCode;
	}

	public String getReqVol() {
		return reqVol;
	}

	public void setReqVol(String reqVol) {
		this.reqVol = reqVol;
	}

	public String getPibCode() {
		return pibCode;
	}

	public void setPibCode(String pibCode) {
		this.pibCode = pibCode;
	}

	public int getPibStatus() {
		return pibStatus;
	}

	public void setPibStatus(int pibStatus) {
		this.pibStatus = pibStatus;
	}

	public int getVol() {
		return vol;
	}

	public void setVol(int vol) {
		this.vol = vol;
	}

	public String getProName1() {
		return proName1;
	}

	public void setProName1(String proName1) {
		this.proName1 = proName1;
	}

	public String getProName2() {
		return proName2;
	}

	public void setProName2(String proName2) {
		this.proName2 = proName2;
	}

	public String getDefectRate() {
		return defectRate;
	}

	public void setDefectRate(String defectRate) {
		this.defectRate = defectRate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
