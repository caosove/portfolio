<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("join")==null){
		response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
		return;
	} else{
		session.removeAttribute("join");
	}

%>    

    
<jsp:include page="/this14/header.jsp"/>
<link href="css/default_shop.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<div id="allContent">
<div id="mainPadding">
	<div class="mbskin mbbox ">
		<ul class="top_seq">
			<li>
				<p class="seq_tit">STEP</p>
				<p class="seq_no">01</p>
				<p class="seq_txt">약관동의</p>
			</li>
			<li class="none"><img src="http://www.sonangu.com/theme/sonanggu/skin/member/basic_min/img/top_seq_arrow.jpg"  alt="" /></li>
			<li>
				<p class="seq_tit">STEP</p>
				<p class="seq_no">02</p>
				<p class="seq_txt">회원정보입력</p>
			</li>
			<li class="none"><img src="http://www.sonangu.com/theme/sonanggu/skin/member/basic_min/img/top_seq_arrow.jpg"  alt="" /></li>
			<li class="on">
				<p class="seq_tit">STEP</p>
				<p class="seq_no">03</p>
				<p class="seq_txt">가입완료</p>
			</li>
		</ul>
	    <form  name="fregister" id="fregister" action="myPage.html" onsubmit="#" method="POST" autocomplete="off">
			<div style="width:350px; margin:0 auto;"><img src="images/ikea.png" width="350px"></div>
		    <p class="join_txt"></p>
		
		    <div class="btn_confirm">
		        <button type="button" class="btn_submit" onclick="location.href='<%=request.getContextPath()%>/this14/product/index.jsp'">메인 페이지</button>
		    </div>
	
	    </form>
	</div>
</div>
</div>
				

<jsp:include page="/this14/footer.jsp"/>