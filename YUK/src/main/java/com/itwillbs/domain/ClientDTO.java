package com.itwillbs.domain;

public class ClientDTO {

	private String clientCode;               //거래처 코드
	private String clientName;               //거래처 이름   
	private String clientType;               //거래처 유형
	private String clientCEO;                //거래처 대표자
	private String businessNumber;           //사업자 등록번호
	private int clientZipNumber;             //거래처 우편번호
	private String clientBasicAddress;       //거래처 기본주소
	private String clientDetailAddress;      //거래처 상세주소
	private int clientTelNumber;             //거래처 전화번호
	private int clientFaxNumber;             //거래처 팩스번호
	private String clientBusinessType;       //거래처 업태
	private String clientCategory;           //거래처 종목
	private String clientNote;               //거래처 참고
	private String clientEmail;              //거래처 이메일
	private String name;
	
	@Override
	public String toString() {
		return "ClientDTO [clientCode=" + clientCode + ", clientName=" + clientName + ", clientType=" + clientType
				+ ", clientCEO=" + clientCEO + ", businessNumber=" + businessNumber + ", clientZipNumber="
				+ clientZipNumber + ", clientBasicAddress=" + clientBasicAddress + ", clientDetailAddress="
				+ clientDetailAddress + ", clientTelNumber=" + clientTelNumber + ", clientFaxNumber=" + clientFaxNumber
				+ ", clientBusinessType=" + clientBusinessType + ", clientCategory=" + clientCategory + ", clientNote="
				+ clientNote + ", clientEmail=" + clientEmail + ", name=" + name + "]";
	}
	
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientType() {
		return clientType;
	}
	public void setClientType(String clientType) {
		this.clientType = clientType;
	}
	public String getClientCEO() {
		return clientCEO;
	}
	public void setClientCEO(String clientCEO) {
		this.clientCEO = clientCEO;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public int getClientZipNumber() {
		return clientZipNumber;
	}
	public void setClientZipNumber(int clientZipNumber) {
		this.clientZipNumber = clientZipNumber;
	}
	public String getClientBasicAddress() {
		return clientBasicAddress;
	}
	public void setClientBasicAddress(String clientBasicAddress) {
		this.clientBasicAddress = clientBasicAddress;
	}
	public String getClientDetailAddress() {
		return clientDetailAddress;
	}
	public void setClientDetailAddress(String clientDetailAddress) {
		this.clientDetailAddress = clientDetailAddress;
	}
	public int getClientTelNumber() {
		return clientTelNumber;
	}
	public void setClientTelNumber(int clientTelNumber) {
		this.clientTelNumber = clientTelNumber;
	}
	public int getClientFaxNumber() {
		return clientFaxNumber;
	}
	public void setClientFaxNumber(int clientFaxNumber) {
		this.clientFaxNumber = clientFaxNumber;
	}
	public String getClientBusinessType() {
		return clientBusinessType;
	}
	public void setClientBusinessType(String clientBusinessType) {
		this.clientBusinessType = clientBusinessType;
	}
	public String getClientCategory() {
		return clientCategory;
	}
	public void setClientCategory(String clientCategory) {
		this.clientCategory = clientCategory;
	}
	public String getClientNote() {
		return clientNote;
	}
	public void setClientNote(String clientNote) {
		this.clientNote = clientNote;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
