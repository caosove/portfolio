package it.will.kingsmap;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import it.will.kingsmap.getMetod.AdminUtil;
import it.will.kingsmap_mybatis.dao.AdminEmailDAO;
import it.will.kingsmap_mybatis.dto.AdminEmail;
import it.will.kingsmap_mybatis.dto.PreviewDTO;
import it.will.kingsmap_mybatis.service.AdminService;

@Controller
public class AdminController implements ApplicationContextAware {
	
	private WebApplicationContext context;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminEmailDAO loginDAO;
	
	@Autowired
	SendCode sendCode;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		context=(WebApplicationContext)applicationContext;
	}
	
	@RequestMapping("/admin")
	public String viewDev(Model model) {
		model.addAttribute("adminLogin", "adminLogin");
		return "home";
	}
	
	@RequestMapping(value="/preview",method=RequestMethod.POST, consumes="multipart/form-data")
	@ResponseBody
	public List<PreviewDTO> excelPreview(@RequestParam MultipartFile excelFile, @RequestParam String type) throws IllegalStateException, IOException {
		
		String uploadPath=context.getServletContext().getRealPath("/resources/files");
		String fileName="excel";
		File file=new File(uploadPath, fileName);
		excelFile.transferTo(file);
		//System.out.println(type);
		try {
			if(type.equals("7")) {
				return AdminUtil.gongsiView(file);
			} else {
				return AdminUtil.printExcel(file,type);
			}
		} catch (Exception e) {
			return null;
		}
	}		
	
	@RequestMapping(value="/update",method=RequestMethod.POST, consumes="multipart/form-data")
	@ResponseBody
	public String excelupdate(@RequestParam MultipartFile excelFile, @RequestParam String type) throws IllegalStateException, IOException, InvalidFormatException {
		
		String uploadPath=context.getServletContext().getRealPath("/resources/files");
		String fileName="excel";
		File file=new File(uploadPath, fileName);
		excelFile.transferTo(file);
		System.out.println(type);
		try {
			if(type.equals("7")) {
				return AdminUtil.gongsiUp(file, adminService);
			} else {
				return AdminUtil.updateExcel(file, adminService, type);
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping("/update/prg")
	@ResponseBody
	public String getPrg() {
		String prgCnt=AdminUtil.getPrg();
		//System.out.println(prgCnt);
		if(prgCnt.equals("100")) {
			AdminUtil.setPrg("0");
		}
		return prgCnt;
	}
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam String email, @RequestParam String code, HttpSession session) {
		System.out.println(email+", "+code);
		AdminEmail admin=loginDAO.getAdmin(email);
		
		if(admin==null) {
			return "notemail";
		}
		if(!code.equals(admin.getCode())) {
			return "notcode";
		}
		session.setAttribute("adminSession", "adminSession");
		return "success";
	}
	
	@RequestMapping(value="/admin/code",method=RequestMethod.POST)
	@ResponseBody
	public String getCode(@RequestParam String email) {
		AdminEmail admin=loginDAO.getAdmin(email);
		if(admin==null) {
			return "notemail";
		}
		String code=AdminUtil.createCode();
		//System.out.println(code);
		admin.setCode(code);
		loginDAO.setCode(admin);
		return "success";
	}
	
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/"; 
	}
	
	@RequestMapping(value="/admin/sendemail", method=RequestMethod.POST)
	@ResponseBody
	public void sendEmail(@RequestParam String email) {
		String code=loginDAO.getAdmin(email).getCode();
		
		String subject="관리자 로그인 인증코드";
		String content="인증코드 : "+code;
		
		sendCode.sendCode(email, subject, content);
		System.out.println("(이메일 전송) 이메일 = "+email);
		System.out.println("(이메일 전송) 제목 = "+subject);
		System.out.println("(이메일 전송) 인증코드 = "+content);
	}
}
