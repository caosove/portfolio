package it.will.kingsmap.dao.mapper;

import java.util.List;

import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;


public interface AptMapper {
		List<AptDTO> getCostList(AptDTO aptDTO);
		List<AptDTO> getCostList(); //¸ðµç Çà 
		List<GongsiDTO> getGongsi(GongsiDTO gongsiDTO);
		List<VillaDTO> getVillCost(VillaDTO villaDTO);

}
