package it.will.kingsmap_mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.will.kingsmap.dao.mapper.AdminMapper;
import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.DandockDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	public int addApart(List<AptDTO> list) {
		return sqlSession.getMapper(AdminMapper.class).addApart(list);
	}
	public int addVilla(List<VillaDTO> list) {
		return sqlSession.getMapper(AdminMapper.class).addVilla(list);
	}
	public int addDandock(List<DandockDTO> list) {
		return sqlSession.getMapper(AdminMapper.class).addDandock(list);
	}
	public int addGongsi(List<GongsiDTO> list) {
		return sqlSession.getMapper(AdminMapper.class).addGongsi(list);
	}
}
