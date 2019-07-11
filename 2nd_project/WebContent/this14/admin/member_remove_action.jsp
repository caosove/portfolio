
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	String[] checkId=request.getParameterValues("checkId");
	
	for(String uId:checkId) {
		//아이디를 전달하여 MEMBER 테이블에 저장된 회원정보를 삭제하는 메소드 호출
		UserDAO.getDAO().removeUser(uId);
	}
	
	//회원목록 응답 페이지 이동
	response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=member_list");
			
%>