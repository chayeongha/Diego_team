package com.diego.mid.util;

public class MPager {
	private Integer curPage;
	private Integer perPager = 4;
	private String kind;
	private String search;
	private Integer startRow;
	private Integer lastRow;
	private Integer startNum;
	private Integer lastNum;
	private Integer curBlock;
	private Integer totalBlock;
	private Integer totalPage;
	private Integer pro_num;
	private String fcat_code;
	private String cat_ref;
	
	
	
	public String getFcat_code() {
		if( fcat_code == null) {
			 fcat_code="%%";
		}
		return fcat_code;
	}

	public void setFcat_code(String fcat_code) {
		this.fcat_code = fcat_code;
	}

	public String getCat_ref() {
		if( cat_ref == null) {
			cat_ref="%%";}
		return cat_ref;
	}

	public void setCat_ref(String cat_ref) {
		this.cat_ref = cat_ref;
	}

	public Integer getPro_num() {
		return pro_num;
	}

	public void setPro_num(Integer pro_num) {
		this.pro_num = pro_num;
	}

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public Integer getLastRow() {
		return lastRow;
	}

	public void setLastRow(Integer lastRow) {
		this.lastRow = lastRow;
	}

	public String getKind() {
		if (this.kind==null) {
			this.kind="kT";
		}
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if (this.search == null) {

			this.search="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Integer getTotalBlock() {
		return totalBlock;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}

	public Integer getLastNum() {
		return lastNum;
	}

	public void setCurBlock(Integer curBlock) {
		this.curBlock = curBlock;
	}

	public void setLastNum(Integer lastNum) {
		this.lastNum = lastNum;
	}

	public Integer getCurBlock() {
		return curBlock;
	}


	public Integer getTotalPage() {
		return totalPage;
	}

	public Integer getCurPage() {
		if (this.curPage==null || this.curPage==0) {
			this.curPage = 1;
		}
		return curPage;
	}

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	

	public Integer getPerPager() {
		return perPager;
	}

	public void setPerPager(Integer perPager) {
		this.perPager = perPager;
	}

	//DB
	public void rowMake() {
		startRow = (this.getCurPage()-1)*this.perPager + 1;
		lastRow = this.getCurPage() * this.perPager;
		
	}
	
	//View(JSP)
	public void makePager(int totalCount ) {
		//1.totalCount --> 매개변수
		//2.totalPage
		this.totalPage = totalCount/this.perPager;
		if (totalCount%perPager!=0) {
			totalPage++;
		}
		
		
		//3.totalBlock

		int perBlock = 10;
		totalBlock = totalPage/perBlock;
		if (totalPage%perBlock!=0) {
			totalBlock++;
		}

		//4.curPage 이용햇 현재 블록curBlock 표시

		curBlock = this.getCurPage()/perBlock;
		if (curPage%perBlock != 0) {
			curBlock++;
		}
		
		//5.curBlock 이용해서 startNum, lastNum 구하기
		this.startNum = (curBlock-1)*perBlock + 1; 
		this.lastNum = curBlock*perBlock;
		
		if (curBlock==totalBlock) {
			lastNum = totalPage;
		}
		if (totalPage ==0) {
			lastNum = 1;
		}
		
	}

}
