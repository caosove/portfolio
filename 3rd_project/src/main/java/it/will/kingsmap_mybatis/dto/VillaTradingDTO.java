package it.will.kingsmap_mybatis.dto;

/*
이름            널? 유형            
------------- -- ------------- 
VI_ADDROLD       VARCHAR2(200) 
VI_ADDRNUM       VARCHAR2(200) 
VI_ADDRNUM1      VARCHAR2(200) 
VI_ADDRNUM2      VARCHAR2(200) 
VI_NAME          VARCHAR2(200) 
VI_CONTRCAT      VARCHAR2(200) 
VI_ACTUAL        VARCHAR2(200) 
VI_TRACTMONTH    VARCHAR2(200) 
VI_TRACTDAY      VARCHAR2(200) 
VI_COST          VARCHAR2(200) 
VI_FLOOR         VARCHAR2(200) 
VI_BUILDYEAR     VARCHAR2(200) 
VI_NEWADDR       VARCHAR2(200) 
*/

// 빌라 매매 테이블
public class VillaTradingDTO {

	private String vi_addrold;	   // 구주소명
	private String vi_addrnum;     // 구주소 번지(앞자리 + 뒷자리)
	private String vi_addrnum1;    // 구주소 번지 앞자리
	private String vi_addrnum2;	   // 구주소 번지 뒷자리
	private String vi_name;        // 빌라 이름
	
	private String vi_contrcat;    // 빌라 전용면적
	private String vi_actual;      // 빌라 실면적
	private String vi_tractmonth;  // 빌라 거래년월
	private String vi_tractday;    // 빌라 거래일자
	private String vi_cost;        // 빌라 거래가격
								   // 빌라 
	private String vi_floor;       // 빌라 층수
	private String vi_buildyear;   // 빌라 건축년도
	private String vi_newaddr;     // 빌라 도로명주소
	
	
	/*
	 private String vi_addrold;     // 구주소명
	private String vi_addrnum;     // 구주소 번지(앞자리 + 뒷자리)
	private String vi_addrnum1;    // 구주소 번지 앞자리
	private String vi_addrnum2;    // 구주소 번지 뒷자리
	private String vi_name;		   // 빌라 이름
	
	private String vi_type;        // 빌라 형태(전/ 월세 구분 매매 )---
	
	private String vi_contrcat;    // 빌라 전용면적
									// 빌라 실면적
	private String vi_tractmonth;  // 빌라 거래년월
	private String vi_tractday;    // 빌라 거래일자
								   // 빌라 매매가
	private String vi_deposit;     // 빌라 보증금
	private String vi_monthly;     // 빌라 월세 (추가)
	private String vi_floor;       // 빌라 층수
	private String vi_buildyear;   // 빌라 건축년도
	private String vi_newaddr;     // 빌라 도로명주소
*/	
	public VillaTradingDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getVi_addrold() {
		return vi_addrold;
	}

	public void setVi_addrold(String vi_addrold) {
		this.vi_addrold = vi_addrold;
	}

	public String getVi_addrnum() {
		return vi_addrnum;
	}

	public void setVi_addrnum(String vi_addrnum) {
		this.vi_addrnum = vi_addrnum;
	}

	public String getVi_addrnum1() {
		return vi_addrnum1;
	}

	public void setVi_addrnum1(String vi_addrnum1) {
		this.vi_addrnum1 = vi_addrnum1;
	}

	public String getVi_addrnum2() {
		return vi_addrnum2;
	}

	public void setVi_addrnum2(String vi_addrnum2) {
		this.vi_addrnum2 = vi_addrnum2;
	}

	public String getVi_name() {
		return vi_name;
	}

	public void setVi_name(String vi_name) {
		this.vi_name = vi_name;
	}

	public String getVi_contrcat() {
		return vi_contrcat;
	}

	public void setVi_contrcat(String vi_contrcat) {
		this.vi_contrcat = vi_contrcat;
	}

	public String getVi_actual() {
		return vi_actual;
	}

	public void setVi_actual(String vi_actual) {
		this.vi_actual = vi_actual;
	}

	public String getVi_tractmonth() {
		return vi_tractmonth;
	}

	public void setVi_tractmonth(String vi_tractmonth) {
		this.vi_tractmonth = vi_tractmonth;
	}

	public String getVi_tractday() {
		return vi_tractday;
	}

	public void setVi_tractday(String vi_tractday) {
		this.vi_tractday = vi_tractday;
	}

	public String getVi_cost() {
		return vi_cost;
	}

	public void setVi_cost(String vi_cost) {
		this.vi_cost = vi_cost;
	}

	public String getVi_floor() {
		return vi_floor;
	}

	public void setVi_floor(String vi_floor) {
		this.vi_floor = vi_floor;
	}

	public String getVi_buildyear() {
		return vi_buildyear;
	}

	public void setVi_buildyear(String vi_buildyear) {
		this.vi_buildyear = vi_buildyear;
	}

	public String getVi_newaddr() {
		return vi_newaddr;
	}

	public void setVi_newaddr(String vi_newaddr) {
		this.vi_newaddr = vi_newaddr;
	}

	@Override
	public String toString() {
		return "VillaTradingDTO [vi_addrold=" + vi_addrold + ", vi_addrnum=" + vi_addrnum + ", vi_addrnum1="
				+ vi_addrnum1 + ", vi_addrnum2=" + vi_addrnum2 + ", vi_name=" + vi_name + ", vi_contrcat=" + vi_contrcat
				+ ", vi_actual=" + vi_actual + ", vi_tractmonth=" + vi_tractmonth + ", vi_tractday=" + vi_tractday
				+ ", vi_cost=" + vi_cost + ", vi_floor=" + vi_floor + ", vi_buildyear=" + vi_buildyear + ", vi_newaddr="
				+ vi_newaddr + "]";
	}
}
