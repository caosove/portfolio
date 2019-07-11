package it.will.kingsmap_mybatis.service;

import java.util.List;
import java.util.Map;

import it.will.kingsmap_mybatis.dto.CommentDTO;
import it.will.kingsmap_mybatis.dto.ReplyDTO;

public interface CommentService {
	void addComment(CommentDTO commentDTO);
	void removeComment(int num);
	List<CommentDTO> getCommentList();
	int getCommentCount();
	List<CommentDTO> getPagingList(Map<String, Object> map);
	String getPassword(int num);
	void modifyComment(CommentDTO commentDTO);
	
	int addReply(ReplyDTO replyDTO);
	List<ReplyDTO> getReplyList(int commentNum);
}