package it.will.kingsmap_mybatis.dao;

import java.util.ArrayList;

import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.DongsillDTO;
import it.will.kingsmap_mybatis.dto.GetbilllaDTO;
import it.will.kingsmap_mybatis.dto.GetgunchukDTO;
import it.will.kingsmap_mybatis.dto.GosimoonDTO;
import it.will.kingsmap_mybatis.dto.MapDTO;
import it.will.kingsmap_mybatis.dto.MaplistDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;

public interface MapDAO {
	
	public ArrayList<MapDTO> listDao();
	public ArrayList<MapDTO> busanlistDao(String bArea);
	public ArrayList<MapDTO> bArealistDao(String bArea);
	public ArrayList<MapDTO> bSteplistDao(String bStep);
	public ArrayList<GosimoonDTO> bunyanglistDao(String bCate, String bZone);
	public ArrayList<MapDTO> getAreainfo(String bCate, String bZone);
	public MapDTO detailzone(int bNum);
	public void insertbillla(String billCost, String billBuildyear,String billYear,String billDe,String billArea,String billName,String billMonth,String billDay,String billJeon,String billJibun,String billCode,String billFloor);
	public ArrayList<GetgunchukDTO> detailgunchuck(String sigungucd, String bjdcd, String gunchuckCate);
	
	
	//�ش����� ����Ʈ�˻�
	public ArrayList<GetgunchukDTO> APTlistDao(String bArea);
	//�ش����� ����˻�
	public ArrayList<GetgunchukDTO> GongdonglistDao(String bArea);
	//�ش����� �ܵ�,�ٰ����˻�
	public ArrayList<GetgunchukDTO> DandocklistDao(String bArea);
	//�ϳ��� ���๰����(������)
	public ArrayList<GetgunchukDTO> infogunchuckDao(String platPlc);
	
	//��Ŀ�� �ֱٽǰŷ� �����ֱ� (html) (����Ʈ)
	public ArrayList<AptDTO> ApartLastSilldao(String platPlc);
	
	//��Ŀ�� �ֱٽǰŷ� �����ֱ� (html) (����)
	public ArrayList<VillaDTO> BillLastSilldao(String platPlc);
	
	//���� ��հ�
	public ArrayList<GetgunchukDTO> infoOnegunchuckDao(String platPlc, String dongNm);
	
	//���� ��հ�
	public ArrayList<DongsillDTO> getdongAvgsillDao(String ymdate);
	
	//����Ʈ�� �˻� 
	public ArrayList<GetgunchukDTO> searchgunchuckDao(String key);
}