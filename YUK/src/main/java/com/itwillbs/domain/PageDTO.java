package com.itwillbs.domain;

public class PageDTO {
	private int pageSize;
	private String pageNum; //출고, 자재입고
	private String pageNum2; //제품입고
	private int currentPage;
	private int currentPage2;
	
	private int startRow;
	private int endRow;
	
	private int pageBlock;
	private int startPage;
	private int startPage2;
	private int endPage;
	private int endPage2;
	
	private int count;
	private int count2;
	private int pageCount;
	private int pageCount2;

	
	//검색어 추가
	private String search1; //출고, 자재입고
	private String search2;
	private String search3;
	private String search4;
	private String search5; //제품입고
	private String search6;
	private String search7;
	private String search8;
	
	//검색어 추가
	private String warehouseCode; 
	private String warehouseName;
	private String warehouseLocal;
	private String productCode;
	private String productName;
	private String productType;
	private String clientCode;
	private String clientName;

	
	
	//검색 옵션 추가
	private String select1; //출고, 자재입고
	private String select2; //제품입고
	
	private int search0;
	
	public String getSelect1() {
		return select1;
	}
	public void setSelect1(String select1) {
		this.select1 = select1;
	}
	public String getSelect2() {
		return select2;
	}
	public void setSelect2(String select2) {
		this.select2 = select2;
	}
	public String getSearch5() {
		return search5;
	}
	public void setSearch5(String search5) {
		this.search5 = search5;
	}
	public String getSearch6() {
		return search6;
	}
	public void setSearch6(String search6) {
		this.search6 = search6;
	}
	public String getSearch7() {
		return search7;
	}
	public void setSearch7(String search7) {
		this.search7 = search7;
	}
	public String getSearch8() {
		return search8;
	}
	public void setSearch8(String search8) {
		this.search8 = search8;
	}
	public String getSearch3() {
		return search3;
	}
	public void setSearch3(String search3) {
		this.search3 = search3;
	}
	public String getSearch4() {
		return search4;
	}
	public void setSearch4(String search4) {
		this.search4 = search4;
	}
	public String getSearch2() {
		return search2;
	}
	public void setSearch2(String search2) {
		this.search2 = search2;
	}
	public String getSearch1() {
		return search1;
	}
	public void setSearch1(String search1) {
		this.search1 = search1;
	}
	public int getSearch0() {
		return search0;
	}
	public void setSearch0(int search0) {
		this.search0 = search0;
	}
	
	
	public String getPageNum2() {
		return pageNum2;
	}
	public void setPageNum2(String pageNum2) {
		this.pageNum2 = pageNum2;
	}
	public int getCurrentPage2() {
		return currentPage2;
	}
	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}
	public int getStartPage2() {
		return startPage2;
	}
	public void setStartPage2(int startPage2) {
		this.startPage2 = startPage2;
	}
	public int getEndPage2() {
		return endPage2;
	}
	public void setEndPage2(int endPage2) {
		this.endPage2 = endPage2;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getPageCount2() {
		return pageCount2;
	}
	public void setPageCount2(int pageCount2) {
		this.pageCount2 = pageCount2;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
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
	public String getWarehouseLocal() {
		return warehouseLocal;
	}
	public void setWarehouseLocal(String warehouseLocal) {
		this.warehouseLocal = warehouseLocal;
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
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
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
	
}
