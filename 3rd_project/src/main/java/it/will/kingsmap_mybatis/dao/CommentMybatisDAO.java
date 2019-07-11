package it.will.kingsmap_mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.will.kingsmap.dao.mapper.CommentMapper;
import it.will.kingsmap_mybatis.dto.CommentDTO;
import it.will.kingsmap_mybatis.dto.ReplyDTO;
@Repository
public class CommentMybatisDAO implements CommentDAO{

	// 게시글 관련
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertComment(CommentDTO commentDTO) {
		return sqlSession.getMapper(CommentMapper.class).insertComment(commentDTO);
	}

	@Override
	public int deleteComment(int num) {
		return sqlSession.getMapper(CommentMapper.class).deleteComment(num);
	}


	@Override
	public int selectCountComment() {
		return sqlSession.getMapper(CommentMapper.class).selectCountComment();
	}
	
	@Override
	public List<CommentDTO> selectCommentList() {
		return sqlSession.getMapper(CommentMapper.class).selectCommentList();
	}
	
	@Override
	public List<CommentDTO> selectPagingList(Map<String, Object> map) {
		return sqlSession.getMapper(CommentMapper.class).selectPagingList(map);
	}
	
	// 댓글 관련
	@Override
	public int insertReply(ReplyDTO replyDTO) {
		return sqlSession.getMapper(CommentMapper.class).insertReply(replyDTO);
	}
	
	@Override
	public List<ReplyDTO> selectReplyList(int commentNum) {
		return sqlSession.getMapper(CommentMapper.class).selectReplyList(commentNum);
	}

	// 글번호로 비밀번호 가져오기
	@Override
	public String selectPassword(int num) {
		return sqlSession.getMapper(CommentMapper.class).selectPassword(num);
	}

	// 글 수정
	@Override
	public int updateComment(CommentDTO commentDTO) {
		return sqlSession.getMapper(CommentMapper.class).updateComment(commentDTO);
	}


}
