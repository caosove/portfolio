package user;


/*
U_ID       NOT NULL VARCHAR2(20) 
U_PWD               VARCHAR2(20) 
U_NAME              VARCHAR2(20) 
U_EMAIL             VARCHAR2(40) 
U_POST              VARCHAR2(10) 
U_ABASIC            VARCHAR2(50) 
U_ADETAIL           VARCHAR2(50) 
U_PHONE             NUMBER(15)   
U_GRADE             VARCHAR2(10) 
U_JOINDATE          DATE         
U_SEQ               NUMBER 
*/

public class UserDTO {
	private String uId;
	private String uPwd;
	private String uName;
	private String uEmail;
	private String uPost;
	private String uAbasic;
	private String uAdetail;
	private String uPhone;
	private String uGrade;
	private String uJoindate;
	private int uSeq;
	
	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPost() {
		return uPost;
	}

	public void setuPost(String uPost) {
		this.uPost = uPost;
	}

	public String getuAbasic() {
		return uAbasic;
	}

	public void setuAbasic(String uAbasic) {
		this.uAbasic = uAbasic;
	}

	public String getuAdetail() {
		return uAdetail;
	}

	public void setuAdetail(String uAdetail) {
		this.uAdetail = uAdetail;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuGrade() {
		return uGrade;
	}

	public void setuGrade(String uGrade) {
		this.uGrade = uGrade;
	}

	public String getuJoindate() {
		return uJoindate;
	}

	public void setuJoindate(String uJoindate) {
		this.uJoindate = uJoindate;
	}

	public int getuSeq() {
		return uSeq;
	}

	public void setuSeq(int uSeq) {
		this.uSeq = uSeq;
	}

	
}
