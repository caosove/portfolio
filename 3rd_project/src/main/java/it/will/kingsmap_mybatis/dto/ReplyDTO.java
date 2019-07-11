package it.will.kingsmap_mybatis.dto;
/*
이름             널?       유형            
-------------- -------- ------------- 
REPLY_NUM      NOT NULL NUMBER        
REPLY_WRITER            VARCHAR2(20)  
REPLY_CONTENT           VARCHAR2(100) 
REPLY_PASSWORD          VARCHAR2(20)  
REPLY_DAY               DATE          
REPLY_IPADDR            VARCHAR2(50)  
COMMENT_NUM             NUMBER     
*/
public class ReplyDTO {

	private int replyNum;
	private String replyWriter;
	private String replyContent;
	private String replyPassword;
	private String replyDay;
	private String replyIpaddr;
	private int commentNum;
	
	public ReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyPassword() {
		return replyPassword;
	}

	public void setReplyPassword(String replyPassword) {
		this.replyPassword = replyPassword;
	}

	public String getReplyDay() {
		return replyDay;
	}

	public void setReplyDay(String replyDay) {
		this.replyDay = replyDay;
	}

	public String getReplyIpaddr() {
		return replyIpaddr;
	}

	public void setReplyIpaddr(String replyIpaddr) {
		this.replyIpaddr = replyIpaddr;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	@Override
	public String toString() {
		return "ReplyDTO [replyNum=" + replyNum + ", replyWriter=" + replyWriter + ", replyContent=" + replyContent
				+ ", replyPassword=" + replyPassword + ", replyDay=" + replyDay + ", replyIpaddr=" + replyIpaddr
				+ ", commentNum=" + commentNum + "]";
	}
}
