package StockList;
/*s_num number (20) not null, -- 주문번호 및 장바구니번호 
s_uname varchar2(20) not null,  -- 주문 및 장바구니 저장한 회원 알기위해
s_pname varchar2(50)not null, -- 구매목록 및 장바구니 상품이름
s_price number(30) not null, -- 상품가격 
s_credit number(30) not null, -- 결제한 금액(총 금액)
s_count number(15) not null, -- 구매 또는 장바구니에 단일 품목의 갯수 
s_date date not null, -- 구매 및 장바구니에 넣은 일시 ( 장바구니는 3일지나면 자동삭제)
s_address varchar(100) not null, -- 구매목록에 보여줄 배송지 ( 회원 주소 )
s_pay varchar(20) not null, */
public class StockListDTO {
	
private int num;
private String uname;
private String pname;
private int price;
private int credit;
private int count;
private String date;
private String address;
private String pay;
private String status;

public StockListDTO() {
	
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getCredit() {
	return credit;
}
public void setCredit(int credit) {
	this.credit = credit;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getPay() {
	return pay;
}
public void setPay(String pay) {
	this.pay = pay;
}

public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
}
