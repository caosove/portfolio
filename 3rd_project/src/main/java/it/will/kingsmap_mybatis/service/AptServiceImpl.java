package it.will.kingsmap_mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.will.kingsmap_mybatis.dao.AptDAO;
import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;


@Service
public class AptServiceImpl implements AptService{
	@Autowired
	private AptDAO aptDAO;
	

	@Override
	public List<AptDTO> getCostList(AptDTO aptDTO){
		return aptDAO.getCostList(aptDTO);
	}
	@Override
	public List<AptDTO> getCostList() {
		return aptDAO.getCostList();
	}
	@Override
	public List<VillaDTO> getVillCost(VillaDTO villaDTO){
		return aptDAO.getVillCost(villaDTO);
	}
	
	@Override
	public List<GongsiDTO> getGongsi(GongsiDTO gongsiDTO){
		System.out.println(gongsiDTO.getADDRNUM());
		System.out.println(gongsiDTO.getADDROLD());
		System.out.println(gongsiDTO.getOFFICIALDATE());
		return aptDAO.getGongsi(gongsiDTO);
	}
}

