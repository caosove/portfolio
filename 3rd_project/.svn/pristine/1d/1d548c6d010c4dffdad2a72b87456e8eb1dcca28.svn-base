package it.will.kingsmap_mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.will.kingsmap.dao.mapper.AdminMapper;
import it.will.kingsmap_mybatis.dto.AdminEmail;


@Repository
public class AdminEmailDAO {

	@Autowired	
	SqlSessionTemplate sqlSession;
	
	public AdminEmail getAdmin(String email) {
		return sqlSession.getMapper(AdminMapper.class).getAdmin(email);
	}
	
	public int setCode(AdminEmail admin) {
		return sqlSession.getMapper(AdminMapper.class).setCode(admin);
	}
}
