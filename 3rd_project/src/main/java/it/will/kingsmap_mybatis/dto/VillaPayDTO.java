package it.will.kingsmap_mybatis.dto;

/*
�̸�            ��? ����            
------------- -- ------------- 
VI_ADDROLD       VARCHAR2(200) 
VI_ADDRNUM       VARCHAR2(200) 
VI_ADDRNUM1      NUMBER(26)    
VI_ADDRNUM2      NUMBER(26)    
VI_NAME          VARCHAR2(200) 
VI_TYPE          VARCHAR2(26)  
VI_CONTRCAT      VARCHAR2(26)  
VI_TRACTMONTH    VARCHAR2(26)  
VI_TRACTDAY      VARCHAR2(26)  
VI_DEPOSIT       VARCHAR2(26)  
VI_MONTHLY       VARCHAR2(26)  
VI_FLOOR         VARCHAR2(26)  
VI_BUILDYEAR     VARCHAR2(26)  
VI_NEWADDR       VARCHAR2(200)  
*/

// �ε��� ��/ ���� ���̺�
public class VillaPayDTO {

	private String vi_addrold;     // ���ּҸ�
	private String vi_addrnum;     // ���ּ� ����(���ڸ� + ���ڸ�)
	private String vi_addrnum1;    // ���ּ� ���� ���ڸ�
	private String vi_addrnum2;    // ���ּ� ���� ���ڸ�
	private String vi_name;		   // ���� �̸�
	private String vi_type;        // ���� ����(��/ ���� ����)
	private String vi_contrcat;    // ���� �������
	private String vi_tractmonth;  // ���� �ŷ����
	private String vi_tractday;    // ���� �ŷ�����
	private String vi_deposit;     // ���� ������
	private String vi_monthly;     // ���� ����
	private String vi_floor;       // ���� ����
	private String vi_buildyear;   // ���� ����⵵
	private String vi_newaddr;     // ���� ���θ��ּ�
	
	public VillaPayDTO() {
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

	public String getVi_type() {
		return vi_type;
	}

	public void setVi_type(String vi_type) {
		this.vi_type = vi_type;
	}

	public String getVi_contrcat() {
		return vi_contrcat;
	}

	public void setVi_contrcat(String vi_contrcat) {
		this.vi_contrcat = vi_contrcat;
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

	public String getVi_deposit() {
		return vi_deposit;
	}

	public void setVi_deposit(String vi_deposit) {
		this.vi_deposit = vi_deposit;
	}

	public String getVi_monthly() {
		return vi_monthly;
	}

	public void setVi_monthly(String vi_monthly) {
		this.vi_monthly = vi_monthly;
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
		return "VillaPayDTO [vi_addrold=" + vi_addrold + ", vi_addrnum=" + vi_addrnum + ", vi_addrnum1=" + vi_addrnum1
				+ ", vi_addrnum2=" + vi_addrnum2 + ", vi_name=" + vi_name + ", vi_type=" + vi_type + ", vi_contrcat="
				+ vi_contrcat + ", vi_tractmonth=" + vi_tractmonth + ", vi_tractday=" + vi_tractday + ", vi_deposit="
				+ vi_deposit + ", vi_monthly=" + vi_monthly + ", vi_floor=" + vi_floor + ", vi_buildyear="
				+ vi_buildyear + ", vi_newaddr=" + vi_newaddr + "]";
	}
}
