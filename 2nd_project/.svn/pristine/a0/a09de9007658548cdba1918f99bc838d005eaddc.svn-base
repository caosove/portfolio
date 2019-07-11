<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="StockList.StockListDAO"%>
<%@ page import="StockList.StockListDTO"%>
<%@ page import="java.util.List"%>
<%

	String pknum =	request.getParameter("aaa");

	StockListDAO dbPro = StockListDAO.getDAO();
	dbPro.delList(Integer.parseInt(pknum));
	int check = dbPro.delList(Integer.parseInt(pknum));
	if(check == 2){
		response.sendRedirect("cart2.jsp"); // 삭제성공하여 다시 장바구니.
	}else{%>
		<script type="text/javascript">
		alert("오류입니다. 되돌아갑니다.");
		history.go(-1);
		</script><%
	}

	
	//DTO 인스턴스를 생성하여 입력값으로 필드값 변경
/* 	StockListDTO member=new StockListDTO();
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setMobile(mobile);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
 */
	//회원정보를 전달하여 MEMBER 테이블에 저장하는 메소드 호출
/* 	MemberDAO.getDAO().addMember(member);
	 */
	//페이지 이동 - 컨텍스트명을 포함한 절대경로 표현방식으로 문서 요청
	/* response.sendRedirect(request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_login"); */
%>