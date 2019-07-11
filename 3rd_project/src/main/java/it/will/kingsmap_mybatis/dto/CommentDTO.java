package it.will.kingsmap_mybatis.dto;

/*이름       널?       유형            
-------- -------- ------------- 
NUM      NOT NULL NUMBER        
WRITER            VARCHAR2(20)  
CONTENT           VARCHAR2(50)  
DAY               DATE          
PASSWORD          VARCHAR2(20)  
IPADDR            VARCHAR2(100) 
*/

public class CommentDTO {

	private int num;
	private String writer;
	private String content;
	private String day;
	private String password;
	private String ipaddr;
	
	// 댓글
	private ReplyDTO reply;

	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDay() {
		return day;
	}

	public String setDay(String day) {
		return this.day = day;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIpaddr() {
		return ipaddr;
	}

	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}

	public ReplyDTO getReply() {
		return reply;
	}

	public void setReply(ReplyDTO reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "CommentDTO [num=" + num + ", writer=" + writer + ", content=" + content + ", day=" + day + ", password="
				+ password + ", ipaddr=" + ipaddr + "]";
	}
}
