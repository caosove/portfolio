package it.will.kingsmap;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import it.will.kingsmap_mybatis.dao.AptDAO;
import it.will.kingsmap_mybatis.dao.MapDAO;
import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.DongsillDTO;
import it.will.kingsmap_mybatis.dto.GetgunchukDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.GosimoonDTO;
import it.will.kingsmap_mybatis.dto.MapDTO;
import it.will.kingsmap_mybatis.dto.MaplistDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;
import it.will.kingsmap_mybatis.service.AptService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/index")
	public String list(Model model) {
		
		MapDAO dao = sqlSession.getMapper(MapDAO.class);
		model.addAttribute("list", dao.listDao());
		return "/index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/listbusan", method = RequestMethod.POST)
	public ArrayList<MapDTO> listbusan(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		MapDAO dao = sqlSession.getMapper(MapDAO.class);
		String busan = request.getParameter("busan");
		System.out.println("받은값:"+busan);
		ArrayList<MapDTO> mdtos = dao.busanlistDao(busan);
		
		//model.addAttribute("yunglist", dao.busanlistDao(busan));		
		return mdtos;

		/*
		JsonObject outer = new JsonObject();
		JsonArray inner = new JsonArray();
		Gson gson = new Gson();
		System.out.println(mdtos.size());
		for(int i =0; i<mdtos.size(); i++) {
		inner.addProperty("BAREA", mdtos.get(i).getbArea());
		inner.addProperty("BCATE", mdtos.get(i).getbCate());
		}
		outer.add("result", inner);
		String json = gson.toJson(outer);
		System.out.println(json);
		response.getWriter().write(json);
		*/
			
		/*
		model.addAttribute("yunglist", mdtos);
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		for(int i =0; i< mdtos.size(); i++) {
			result.append("[{\"value\": \"" + mdtos.get(i).getbCate() + "\"},");
			result.append("{\"value\": \"" + mdtos.get(i).getbZone() + "\"},");
			result.append("{\"value\": \"" + mdtos.get(i).getbStep() + "\"},");
			result.append("{\"value\": \"" + mdtos.get(i).getbBuilder() + "\"}]");
			if( i != mdtos.size()-1) {
				result.append(",");
			}
		}
		result.append("]" + "\"}");
		System.out.println(result.toString());
		response.getWriter().write(result.toString());
		*/
	}
	
	//구역에따라 검색
	@ResponseBody
	@RequestMapping(value = "/listbybArea", method = RequestMethod.POST)
	public ArrayList<MapDTO> listArea(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		MapDAO dao = sqlSession.getMapper(MapDAO.class);
		String bArea = request.getParameter("bArea");
		System.out.println("받은값:"+bArea);
		ArrayList<MapDTO> mdtos;
		String bCity = null;
		
		if(bArea.equals("전체")) {
			mdtos = dao.busanlistDao("부산시");
		}else {	
			mdtos = dao.bArealistDao(bArea);
		}
		System.out.println(mdtos.size());
		return mdtos;
	}

	@ResponseBody
	@RequestMapping(value = "/detailZone", method = RequestMethod.POST)
	public MapDTO detailZone(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		MapDAO dao = sqlSession.getMapper(MapDAO.class);
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		System.out.println("받은값:"+bNum);
		MapDTO mdtos = dao.detailzone(bNum);

		return mdtos;
	}
	
	//건축물대장가져오기
	@ResponseBody
	@RequestMapping(value = "/GunchuckListbybArea", method = RequestMethod.POST)
	public ArrayList<GetgunchukDTO> GunchuckListbybArea(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		MapDAO dao = sqlSession.getMapper(MapDAO.class);
		String bCate = request.getParameter("bCate");
		String bZone = request.getParameter("bZone");
		String num = request.getParameter("num");
		String sigungucd = null;
		String bjdcd = null;
		String gunchuckCate = null;
		ArrayList<MapDTO> kinglistdtos = dao.getAreainfo(bCate, bZone);
		
		sigungucd = kinglistdtos.get(0).getSigungucd().replaceAll(",", "");
		bjdcd = kinglistdtos.get(0).getBjdcd().replaceAll(",", "");
		
		if(num.equals("1")) {
			gunchuckCate = "공동주택";
		}
		if(num.equals("2")) {
			gunchuckCate = "단독주택";
		}
		System.out.println("건축물 마크 서버");
		System.out.println(bCate+bZone+num);
		System.out.println(sigungucd+ bjdcd+gunchuckCate);
		
		ArrayList<GetgunchukDTO> mdtos = dao.detailgunchuck(sigungucd, bjdcd, gunchuckCate);
		
		System.out.println("mdtos 사이즈="+mdtos.size());
		return mdtos;
	}
	
	//분양정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/getBunyanginfo", method = RequestMethod.POST)
	public Map<String, Object> getBunyanginfo(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
	
		Map<String, Object> map = new HashMap<String, Object>();
		MapDAO dao = sqlSession.getMapper(MapDAO.class);

		String bCate = request.getParameter("bCate");
		String bZone = request.getParameter("bZone");
		
		//map.put("key",dd);
		
		System.out.println(bCate + bZone);
		
		ArrayList<GosimoonDTO> mdtos = dao.bunyanglistDao(bCate, bZone);
		System.out.println(mdtos.size());
		
		if(mdtos.size() == 0) {
			String Message = "0";
			map.put("Message", Message);
		}else {
			String Message = "1";
			map.put("mdtos", mdtos);
			map.put("Message", Message);
		}
		
		return map;
	}
	
	//사업성계산하기
	@ResponseBody
	@RequestMapping(value = "/feasibility", method = RequestMethod.POST)
	public Map<String, Object> feasibility(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
	
		Map<String, Object> map = new HashMap<String, Object>();
		MapDAO dao = sqlSession.getMapper(MapDAO.class);

		String bCate = request.getParameter("bCate");
		String bZone = request.getParameter("bZone");
		
		//map.put("key",dd);
		
		System.out.println(bCate + bZone);
		
		ArrayList<GosimoonDTO> bunyangdtos = dao.bunyanglistDao(bCate, bZone);
		ArrayList<MapDTO> kinglistdtos = dao.getAreainfo(bCate, bZone);
		
		
		
		return map;
	}
	
	//여기서부터
	//여기서부터
	
	//<조별>
	
//	@RequestMapping(value = "/cost", method = RequestMethod.GET)
	@RequestMapping(value = "/display")
	public String display(Model model) {
		model.addAttribute("costList", aptService.getCostList());
		System.out.println(aptService.getCostList().toString());
		return "/";
	}
	
	//============
	//해당구, 건축물 종류
		@ResponseBody
		@RequestMapping(value = "/Listgunchuck", method = RequestMethod.POST)
		public ArrayList<GetgunchukDTO> Listgunchuck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			ArrayList<GetgunchukDTO> mdtos = null;
			
			String AreaID = request.getParameter("AreaID");
			String gunchuckCate = request.getParameter("stepID");

			System.out.println("서버");
			System.out.println("받은값:"+AreaID);
			System.out.println("받은값:"+gunchuckCate);
			
			if(gunchuckCate.equals("아파트")) {
				System.out.println("아파트");
				mdtos = dao.APTlistDao(AreaID);
			}
			if(gunchuckCate.equals("공동주택")) {		
				mdtos = dao.GongdonglistDao(AreaID);
				System.out.println("빌라");
			}
			if(gunchuckCate.equals("단독")) {		
				System.out.println("단독");
				mdtos = dao.DandocklistDao(AreaID);
			}
			
			return mdtos;
		}
		
		//건축물 디테일
		@ResponseBody
		@RequestMapping(value = "/detailgunchuck", method = RequestMethod.POST)
		public Map<String, Object> detailgunchuck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			ArrayList<GetgunchukDTO> mdtos = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			String platPlc = request.getParameter("platPlc");

			
			
			System.out.println("서버");
			System.out.println("받은값:"+platPlc);

			mdtos = dao.infogunchuckDao(platPlc);
			map.put("mdtos", mdtos);
			
			
			return map;
		}
		
		//getOneGunchuckinfo 하나의 동정보
		
		@ResponseBody
		@RequestMapping(value = "/getOneGunchuckinfo", method = RequestMethod.POST)
		public ArrayList<GetgunchukDTO> getOneGunchuckinfo(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			
			
			String platPlc = request.getParameter("platPlc");
			String dongNm = request.getParameter("dongNm");
			
			ArrayList<GetgunchukDTO> mdtos = dao.infoOnegunchuckDao(platPlc, dongNm);

			System.out.println("서버");
			System.out.println("받은값:"+platPlc);
			System.out.println(mdtos);
			//mdtos = dao.infogunchuckDao(platPlc);
			
			return mdtos;
		}
		
		
		
		
		//getAptsill (마커안에 가장최근 실거래가 넣기);======(아파트)===========
		@ResponseBody
		@RequestMapping(value = "/getAptsill", method = RequestMethod.POST)
		public ArrayList<AptDTO> getAptsill(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			
			
			String platPlc = request.getParameter("platPlc");
			
			ArrayList<AptDTO> mdtos = dao.ApartLastSilldao(platPlc);
		 
            
			//System.out.println(mdtos.size());
			
			if(mdtos.size() == 0) {
				//System.out.println("언디파인드");
				return null;
			}else {
			System.out.println("서버");
			System.out.println("받은값:"+platPlc);
			System.out.println(mdtos);
			//mdtos = dao.infogunchuckDao(platPlc);
			
			return mdtos;
			}
		}
		
		@ResponseBody
		@RequestMapping(value = "/getBillLastsill", method = RequestMethod.POST)
		public ArrayList<VillaDTO> getBillLastsill(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			
			
			String platPlc = request.getParameter("platPlc");
			
			ArrayList<VillaDTO> mdtos = dao.BillLastSilldao(platPlc);

			System.out.println("서버");
			System.out.println("받은값:"+platPlc);
			System.out.println(mdtos);
			//mdtos = dao.infogunchuckDao(platPlc);
			
			return mdtos;
		}
		

		@ResponseBody
		@RequestMapping(value = "/getdongAvgsill", method = RequestMethod.POST)
		public ArrayList<DongsillDTO> getdongAvgsill(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			
			
			String stepID = request.getParameter("stepID");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			
			
			String ymdate = "201812";
			//String ymdate = year+month;

				
			ArrayList<DongsillDTO> mdtos = dao.getdongAvgsillDao(ymdate);

			System.out.println("서버");
			System.out.println("받은값:"+ymdate);

			//mdtos = dao.infogunchuckDao(platPlc);
			
			return mdtos;
		}
		
		//=========아파트 검색
		
		@ResponseBody
		@RequestMapping(value = "/searchgunchuck", method = RequestMethod.POST)
		public ArrayList<GetgunchukDTO> searchgunchuck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			MapDAO dao = sqlSession.getMapper(MapDAO.class);
			
			
			String key = request.getParameter("searchKey");
			
			ArrayList<GetgunchukDTO> mdtos = dao.searchgunchuckDao(key);

			System.out.println("서버");
			System.out.println("받은값:"+key);
			System.out.println(mdtos);
			

			//mdtos = dao.infogunchuckDao(platPlc);
			
			return mdtos;
		}
		
		
				
				// ----------아파트 매매 차트 ---------- //
				@Autowired
				private AptService aptService;
				private String juso;
			
				
				@RequestMapping(value="/chart", method=RequestMethod.POST)
				public String cost(Model model, @ModelAttribute AptDTO aptDTO, @ModelAttribute VillaDTO villaDTO, @ModelAttribute GongsiDTO gongsiDTO, HttpServletRequest request, HttpServletResponse response) {
					System.out.println("걍차트");
					
				    juso = request.getParameter("platPlc");
				    System.out.println(juso); // 부산광역시 중구 대청동4가 34-2
				    
				    String[] words = juso.split("\\s");
				  
				    String juso1=null;
				    String juso2=null;
				    String juso3=null;
				    String juso4=null;
				    String juso5=null;
				    String juso6=null;
				   
				    for(int i=0; i<words.length; i++) {
				    	System.out.println(words[i]);  	
				    } 
				    juso1= words[0];
				    juso2= words[1];
				    juso3= words[2];
				    juso4= words[3];
				   /* String[] nums = juso4.split("-");
				    juso5= nums[0];
				    juso6= nums[1];*/
				    System.out.println("======================");
				    System.out.println(juso1 + " " + juso2+" " + juso3);
				    System.out.println(juso1);
				    System.out.println(juso2);
				    System.out.println(juso3 );
				    System.out.println(juso4);
				  /*  System.out.println(juso5);
				    System.out.println(juso6);*/
				    System.out.println("======================");
			    /*    for (String wo : words ){
			        	String[] nums = wo.split("-");
			            for (String no : nums ){
			            	System.out.println(no);
			            }   
			        }*/
				    
				    aptDTO.setADDROLD(juso1 + " " + juso2+" " + juso3);
				    aptDTO.setADDRNUM(juso4);
				    //aptDTO.setADDRNUM2(juso6);
				    
				    gongsiDTO.setADDROLD(juso1 + " " + juso2+" " + juso3);
				    gongsiDTO.setADDRNUM(juso4);
		
				    villaDTO.setADDROLD(juso1 + " " + juso2+" " + juso3);
				    villaDTO.setADDRNUM(juso4);
				    
					model.addAttribute("costList", aptService.getCostList(aptDTO));
					model.addAttribute("gongsi", aptService.getGongsi(gongsiDTO));
					model.addAttribute("billcost", aptService.getVillCost(villaDTO));
												
					return "/chart";
				}
				
			/*	@ResponseBody
				@RequestMapping(value = "/chart", method=RequestMethod.POST)
				public String cost(Model model, @ModelAttribute AptDTO aptDTO, @ModelAttribute GongsiDTO gongsiDTO, HttpServletRequest request, HttpServletResponse response) {
					juso = request.getParameter("platPlc");
					System.out.println(juso);
					//String platPlc = request.getParameter("platPlc");
					
					//aptService.getCostList(aptDTO);
					//System.out.println("매매가 : " + aptDTO.getYMDATE()+"=====" + aptDTO.getADDROLD() +"=====" +aptDTO.getADDRNUM());
					//System.out.println("공시가 : " + gongsiDTO.getOFFICIALDATE()+"=====" + gongsiDTO.getADDROLD() +"=====" +gongsiDTO.getADDRNUM());
					model.addAttribute("costList", aptService.getCostList(aptDTO));
					//System.out.println( aptService.getCostList(aptDTO));
					model.addAttribute("gongsi", aptService.getGongsi(gongsiDTO));
					//System.out.println( aptService.getGongsi(gongsiDTO));
					
					return "/chart";*/
					
				/*	
					MapDAO dao = sqlSession.getMapper(MapDAO.class);
					ArrayList<GetgunchukDTO> mdtos = null;
					
					String platPlc = request.getParameter("platPlc");

					System.out.println("서버");
					System.out.println("받은값:"+platPlc);
					

					mdtos = dao.infogunchuckDao(platPlc);}*/
					
				
				
				@RequestMapping(value = "/rss_reader", method=RequestMethod.GET)
				 public String newss() {
				System.out.println("rss_reader뉴스");
				return "/rss_reader";
				}
			
				
				@RequestMapping(value = "/rss_proxy", method=RequestMethod.GET)
				 public String news() {
					System.out.println("rss_proxy뉴스");
					return "/rss_reader";
				}
				
	

			
		 				
}	