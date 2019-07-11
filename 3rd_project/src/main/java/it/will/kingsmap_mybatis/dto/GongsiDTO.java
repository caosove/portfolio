package it.will.kingsmap_mybatis.dto;

/*num varchar2(100), --  고유번호
code varchar2(100), --   법정동코드	
addrold varchar2(100), --  법정동명	
Specialcode varchar2(100), -- 특수지구분코드	
Specialtype  varchar2(100), --  특수지구분명	
addrnum varchar2(100), --  지번	
standardyear varchar2(100), --   기준년도	
standardmonth varchar2(100), -- 기준월	
Officialprice varchar2(100), --  공시지가	
Officialdate varchar2(100), -- 공시일자(yyyy-mm-dd) 
document varchar2(100), -- 표준지 여부(n/y)
standarddata varchar2(100) --  데이터 기준일자(yyyy-mm-dd) 
*/

public class GongsiDTO {

	private String NUM;
	private String CODE;
	private String ADDROLD;
	private String SPECIALCODE;
	private String SPECIALTYPE;
	private String ADDRNUM;
	private String STANDARDYEAR;
	private String STANDARDMONTH;
	private String OFFICIALPRICE;
	private String OFFICIALDATE;
	private String DOCUMENT;
	private String STANDARDDATA;

	public String getNUM() {
		return NUM;
	}

	public void setNUM(String nUM) {
		NUM = nUM;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getADDROLD() {
		return ADDROLD;
	}

	public void setADDROLD(String aDDROLD) {
		ADDROLD = aDDROLD;
	}

	public String getSPECIALCODE() {
		return SPECIALCODE;
	}

	public void setSPECIALCODE(String sPECIALCODE) {
		SPECIALCODE = sPECIALCODE;
	}

	public String getSPECIALTYPE() {
		return SPECIALTYPE;
	}

	public void setSPECIALTYPE(String sPECIALTYPE) {
		SPECIALTYPE = sPECIALTYPE;
	}

	public String getADDRNUM() {
		return ADDRNUM;
	}

	public void setADDRNUM(String aDDRNUM) {
		ADDRNUM = aDDRNUM;
	}

	public String getSTANDARDYEAR() {
		return STANDARDYEAR;
	}

	public void setSTANDARDYEAR(String sTANDARDYEAR) {
		STANDARDYEAR = sTANDARDYEAR;
	}

	public String getSTANDARDMONTH() {
		return STANDARDMONTH;
	}

	public void setSTANDARDMONTH(String sTANDARDMONTH) {
		STANDARDMONTH = sTANDARDMONTH;
	}

	public String getOFFICIALPRICE() {
		return OFFICIALPRICE;
	}

	public void setOFFICIALPRICE(String oFFICIALPRICE) {
		OFFICIALPRICE = oFFICIALPRICE;
	}

	public String getOFFICIALDATE() {
		return OFFICIALDATE;
	}

	public void setOFFICIALDATE(String oFFICIALDATE) {
		OFFICIALDATE = oFFICIALDATE;
	}

	public String getDOCUMENT() {
		return DOCUMENT;
	}

	public void setDOCUMENT(String dOCUMENT) {
		DOCUMENT = dOCUMENT;
	}

	public String getSTANDARDDATA() {
		return STANDARDDATA;
	}

	public void setSTANDARDDATA(String sTANDARDDATA) {
		STANDARDDATA = sTANDARDDATA;
	}

	public GongsiDTO() {

	}
}
