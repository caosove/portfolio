<%@page import="user.Utility"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
		return;
	}
	
	request.setCharacterEncoding("UTF-8");

	String uId=request.getParameter("mb_id");
	String uPwd=Utility.encrypt(request.getParameter("mb_password_re"), "SHA-256");
	String uName=request.getParameter("mb_name");
	String uPhone=(request.getParameter("mb_hp1")+"-"+request.getParameter("mb_hp2")+"-"+request.getParameter("mb_hp3"));
	String uEmail=request.getParameter("mb_email1")+"@"+request.getParameter("mb_email2");
	String uPost=request.getParameter("mb_zip");
	String uAbasic=request.getParameter("mb_addr1");
	String uAdetail=request.getParameter("mb_addr2").trim();
	if(uAdetail==null) uAdetail="";
	
	//System.out.println(uId);
	//System.out.println(uPwd);
	//System.out.println(uName);
	//System.out.println(uPhone);
	//System.out.println(uEmail);
	//System.out.println(uPost);
	//System.out.println(uAbasic);
	//System.out.println(uAdetail);
	
	
	UserDTO user=new UserDTO();
	
	user.setuId(uId);
	user.setuPwd(uPwd);
	user.setuName(uName);
	user.setuEmail(uEmail);
	user.setuPost(uPost);
	user.setuAbasic(uAbasic);
	user.setuAdetail(uAdetail);
	user.setuPhone(uPhone);
	
	int rows=UserDAO.getDAO().addUser(user);
	
	//System.out.println(rows);

	session.setAttribute("join", "join");
	response.sendRedirect(request.getContextPath()+"/this14/login/join_step_03.jsp");
	
%>