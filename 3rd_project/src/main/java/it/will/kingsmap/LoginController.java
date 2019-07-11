package it.will.kingsmap;

import java.util.Iterator;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/login")
	public String loginView() {

		return "/login";
	}
	
	@RequestMapping("/index2")
	public String index2View() {
		return "/index2";
	}
	
}
