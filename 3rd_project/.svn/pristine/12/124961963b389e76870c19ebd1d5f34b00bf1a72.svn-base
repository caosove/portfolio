package it.will.kingsmap_mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.will.kingsmap.dao.mapper.AptMapper;
import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;

@Repository
public class AptMybatisDAO implements AptDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AptDTO> getCostList() {
		return sqlSession.getMapper(AptMapper.class).getCostList();
	}

	@Override
	public List<AptDTO> getCostList(AptDTO aptDTO) {
		return sqlSession.getMapper(AptMapper.class).getCostList(aptDTO);
	}
	
	@Override
	public List<GongsiDTO> getGongsi(GongsiDTO gongsiDTO) {
		
		return sqlSession.getMapper(AptMapper.class).getGongsi(gongsiDTO);		
	}
	
	@Override
	public List<VillaDTO> getVillCost(VillaDTO villaDTO) {
		
		return sqlSession.getMapper(AptMapper.class).getVillCost(villaDTO);		
	}
}
