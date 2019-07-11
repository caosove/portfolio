package it.will.kingsmap_mybatis.dto;

public class DongsillDTO {
	
	String addrold;
	String price;
	String xposi;
	String yposi;
	
	public DongsillDTO() {
		
	}

	public String getAddrold() {
		return addrold;
	}

	public void setAddrold(String addrold) {
		this.addrold = addrold;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getXposi() {
		return xposi;
	}

	public void setXposi(String xposi) {
		this.xposi = xposi;
	}

	public String getYposi() {
		return yposi;
	}

	public void setYposi(String yposi) {
		this.yposi = yposi;
	}

	public DongsillDTO(String addrold, String price, String xposi, String yposi) {
		super();
		this.addrold = addrold;
		this.price = price;
		this.xposi = xposi;
		this.yposi = yposi;
	}
	
	
	

}
