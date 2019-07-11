package it.will.kingsmap_mybatis.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.will.kingsmap_mybatis.dao.CommentDAO;
import it.will.kingsmap_mybatis.dto.CommentDTO;
import it.will.kingsmap_mybatis.dto.ReplyDTO;

@Service
public class CommetServiceImpl implements CommentService{

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public void addComment(CommentDTO commentDTO) {
		commentDAO.insertComment(commentDTO);
	}

	@Override
	public void removeComment(int num) {
		commentDAO.deleteComment(num);
	}

	
	@Override
	public int getCommentCount() {
		return commentDAO.selectCountComment();
	}

	@Override
	public int addReply(ReplyDTO replyDTO) {
		return commentDAO.insertReply(replyDTO);
	}

	@Override
	public List<ReplyDTO> getReplyList(int commentNum) {
		return commentDAO.selectReplyList(commentNum);
	}
	
	@Override
	public List<CommentDTO> getCommentList() {
		return commentDAO.selectCommentList();
	}

	@Override
	public List<CommentDTO> getPagingList(Map<String, Object> map) {
		return commentDAO.selectPagingList(map);
	}

	@Override
	public String getPassword(int num) {
		return commentDAO.selectPassword(num);
	}

	@Override
	public void modifyComment(CommentDTO commentDTO) {
		commentDAO.updateComment(commentDTO);
	}


}
