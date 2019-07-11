package it.will.kingsmap.dao.mapper;

import java.util.List;
import java.util.Map;

import it.will.kingsmap_mybatis.dto.CommentDTO;
import it.will.kingsmap_mybatis.dto.ReplyDTO;

public interface CommentMapper {

	// 게시글 관련
	int insertComment(CommentDTO commentDTO);
	int deleteComment(int num);
	List<CommentDTO> selectCommentList();
	int selectCountComment();
	List<CommentDTO> selectPagingList(Map<String, Object> map);
	
	// 글번호로 비밀번호 가져오기
	String selectPassword(int num);
	
	// 글 수정
	int updateComment(CommentDTO commentDTO);
	
	// 댓글 관련
	int insertReply(ReplyDTO replyDTO);
	List<ReplyDTO> selectReplyList(int commentNum);
}
