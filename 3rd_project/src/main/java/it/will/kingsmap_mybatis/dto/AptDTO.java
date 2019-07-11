package it.will.kingsmap_mybatis.dto;

/*CREATE TABLE APART(
ADDROLD varchar2(100),  --구주소명
ADDRNUM varchar2(100), -- 구주소 번지(앞자리 + 뒷자리)
ADDRNUM1 varchar2(100),  -- 구주소 번지 앞자리
ADDRNUM2 varchar2(100), -- 구주소 번지 뒷자리
NAME varchar2(100), -- 아파트 이름
TYPE varchar2(100), -- 아파트 형태(전/ 월세 / 매매 )---
contract varchar2(100), -- 아파트 전용면적
ymdate varchar2(100), -- 아파트 거래년월
ddate varchar2(100), -- 아파트 거래일자
Trading varchar2(100), -- 아파트 매매가
deposit varchar2(100), -- 아파트 보증금
monthly varchar2(100), -- 아파트 월세 (추가)
floor varchar2(100), -- 아파트 층수
ybuild varchar2(100), --  아파트 건축년도
newaddr varchar2(100) --  아파트 도로명주소
);*/
public class AptDTO {

	private String ADDROLD;
	private String ADDRNUM;
	private String ADDRNUM1;
	private String ADDRNUM2;
	private String NAME;
	private String TYPE;
	private String CONTRACT;
	private String YMDATE;
	private String DDATE;
	private String TRADING;
	private String DEPOSIT;
	private String MONTHLY;
	private String FLOOR;
	private String YBUILD;
	private String NEWADDR;

	public String getADDROLD() {
		return ADDROLD;
	}

	public void setADDROLD(String aDDROLD) {
		ADDROLD = aDDROLD;
	}

	public String getADDRNUM() {
		return ADDRNUM;
	}

	public void setADDRNUM(String aDDRNUM) {
		ADDRNUM = aDDRNUM;
	}

	public String getADDRNUM1() {
		return ADDRNUM1;
	}

	public void setADDRNUM1(String aDDRNUM1) {
		ADDRNUM1 = aDDRNUM1;
	}

	public String getADDRNUM2() {
		return ADDRNUM2;
	}

	public void setADDRNUM2(String aDDRNUM2) {
		ADDRNUM2 = aDDRNUM2;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getCONTRACT() {
		return CONTRACT;
	}

	public void setCONTRACT(String cONTRACT) {
		CONTRACT = cONTRACT;
	}

	public String getYMDATE() {
		return YMDATE;
	}

	public void setYMDATE(String yMDATE) {
		YMDATE = yMDATE;
	}

	public String getDDATE() {
		return DDATE;
	}

	public void setDDATE(String dDATE) {
		DDATE = dDATE;
	}

	public String getTRADING() {
		return TRADING;
	}

	public void setTRADING(String tRADING) {
		TRADING = tRADING;
	}

	public String getDEPOSIT() {
		return DEPOSIT;
	}

	public void setDEPOSIT(String dEPOSIT) {
		DEPOSIT = dEPOSIT;
	}

	public String getMONTHLY() {
		return MONTHLY;
	}

	public void setMONTHLY(String mONTHLY) {
		MONTHLY = mONTHLY;
	}

	public String getFLOOR() {
		return FLOOR;
	}

	public void setFLOOR(String fLOOR) {
		FLOOR = fLOOR;
	}

	public String getYBUILD() {
		return YBUILD;
	}

	public void setYBUILD(String yBUILD) {
		YBUILD = yBUILD;
	}

	public String getNEWADDR() {
		return NEWADDR;
	}

	public void setNEWADDR(String nEWADDR) {
		NEWADDR = nEWADDR;
	}

	public AptDTO() {
	}

}
