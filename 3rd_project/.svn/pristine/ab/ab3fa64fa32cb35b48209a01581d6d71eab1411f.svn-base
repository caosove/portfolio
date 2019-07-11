package it.will.kingsmap_mybatis.dao;

import java.util.List;
import java.util.Map;

import it.will.kingsmap_mybatis.dto.CommentDTO;
import it.will.kingsmap_mybatis.dto.ReplyDTO;

public interface CommentDAO {
	int insertComment(CommentDTO commentDTO);
	int deleteComment(int num);
	List<CommentDTO> selectCommentList();
	int selectCountComment();
	List<CommentDTO> selectPagingList(Map<String, Object> map);
	String selectPassword(int num);
	int updateComment(CommentDTO commentDTO);
	
	int insertReply(ReplyDTO replyDTO);
	List<ReplyDTO> selectReplyList(int commentNum);
}
