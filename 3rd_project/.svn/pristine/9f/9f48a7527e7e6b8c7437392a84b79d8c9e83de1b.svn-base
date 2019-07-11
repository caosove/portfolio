package it.will.kingsmap_mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.will.kingsmap_mybatis.dao.AdminDAO;
import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.DandockDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	public void addApart(List<AptDTO> list) {
		adminDAO.addApart(list);
	}
	public void addVilla(List<VillaDTO> list) {
		adminDAO.addVilla(list);
	}
	public void addDandock(List<DandockDTO> list) {
		adminDAO.addDandock(list);
	}
	public void addGongsi(List<GongsiDTO> list) {
		adminDAO.addGongsi(list);
	}
	
	
	
}
