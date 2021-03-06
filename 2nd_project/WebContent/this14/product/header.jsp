<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginMsg = (String)session.getAttribute("login_msg" );
	String jsSrc = (String)session.getAttribute("jsSrc");
	String id = (String)session.getAttribute("id");
	
	System.out.println(loginMsg + jsSrc + ", 헤더");
	if(loginMsg == null){
		loginMsg = "";
	}
	if (jsSrc == null) {
		jsSrc = "";
	}
	if (id == null || id.equals("")) {
		id = "";
		loginMsg = " ";
	}
	session.removeAttribute("loginMsg");
	session.removeAttribute("jsSrc");
	session.removeAttribute("id");

	//세션으로 공유된 로그인 인증정보(회원정보)를 반환받아 저장
	// => 반환값 : null - 미로그인 상태
	// => 반환값 : MemberDTO 인스턴스 - 로그인 상태
	UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
%>
	<header class="ikea2017-header KO">
		<section class="top-nav">		
			<nav class="wrap rel">
				<% if(loginUser==null) {%>
				<div class="welcome-msg">안녕하세요. IKEA Korea 입니다. Welcome to a world of inspiration for your home.</div>
				<%} else { %>
				<div class="welcome-msg"><%=loginUser.getuName() %>님 환영합니다.</div>
				<%} %>			
				<div class="right-menu">
					<% if(loginUser==null) {%>
						<a id="top-nav-login" class="top-nav-link" href="#">로그인</a>
						<a class="top-nav-link" href="<%=request.getContextPath() %>/this14/login/join_step_01.jsp">회원가입</a>
						<a class="top-nav-link" href="<%=request.getContextPath() %>/this14/cart/cart2.jsp">장바구니</a>
					<%} else { %>
						<a class="top-nav-link" href="<%=request.getContextPath() %>/this14/login/logout_action.jsp">로그아웃</a>
						<a class="top-nav-link" href="<%=request.getContextPath() %>/this14/login/user_detail.jsp">마이페이지</a>
						<a class="top-nav-link" href="<%=request.getContextPath() %>/this14/cart/cart2.jsp">장바구니</a>
					<% } %>
				</div>
			</nav>
		</section>
		<section class="logo-search-box">
			<div class="wrap rel">
				<h1 class="ikea-logo"><a href="index.jsp"><img src="https://uiux.newideas.kr/images/ikea-logo.svg" alt="IKEA"></a></h1>
				
				<div class="cart-container">
					<%if (loginUser==null){ %>
						<a href="javascript:toggle()" class="ico-cart"></a>
					<%} else if(!loginUser.getuGrade().equals("admin")){ %>
						<a href="#" class="ico-cart"></a>
					<%} %>						
				</div>
				<div class="btn-cart-wrap">
					<%if (loginUser==null){ %>
						<a href="javascript:toggle()"><span class="alttxt">카트 보기</span></a>
					<%} else if(!loginUser.getuGrade().equals("admin")){ %>
						<a href="#"><span class="alttxt">카트 보기</span></a>
					<%} %>					
				</div>
			</div>				
		</section>
		<div id="blubar-html-wrap">
			<section id="ikea-bluebar" class="site-nav-container">
				<div class="wrap rel">
					<nav>
						<ul class="site-feature-menu">
							<li class="all-products">
							
								<a style="border-top: 1px solid rgba(255,255,255,.1);
  border-left: 1px solid rgba(255,255,255,.15);padding-top:0" class="nav-right-banner showroom" 
  href="index.jsp?workgroup=product&work=product_list&menu=ALL">모든 제품</a>
  								</li>
							<li class="new-products">
							<a href="index.jsp?workgroup=product&work=product_list&menu=NEW">New</a></li>
							<li class="all-products">
							    <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
							    <a href="index.jsp?workgroup=product&work=product_list&menu=LIVING">소파·의자·테이블</a>
							</li>
							<li class="all-products">
							    <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
								<a href="index.jsp?workgroup=product&work=product_list&menu=BED">침대·매트리스</a>
					        </li>
							<li class="all-products">
							    <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
								<a href="index.jsp?workgroup=product&work=product_list&menu=KITCHEN">요리·식기·주방가구</a>
							</li>
							<li class="all-products">
					            <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
					            <a href="index.jsp?workgroup=product&work=product_list&menu=TEXTILE">텍스타일·러그·커튼</a>
					        </li>
					        <%if(loginUser!=null && loginUser.getuGrade().equals("admin")) { %>
					         <li class="admin">
								<a style="border-top: 1px solid rgba(255,255,255,.1);
  border-left: 1px solid rgba(255,255,255,.15);padding-top:0" class="nav-right-banner showroom" href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=product_list">관리자</a>
  								</li>
							<li class="admin">
							    <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
							    <a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=product_list">상품관리</a>
							</li>
							<li class="admin">
							    <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
								<a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=order_list">주문관리</a>
					        </li>
							<li class="admin">
							    <!-- 자바스크립트로 대메뉴시퀀스을 ID로 가진 하위 DIV를 오픈한다. -->
								<a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=member_list" >회원관리</a>
							</li>
							<% } %>
				       	</ul>
						<div class="nav-right-banner-container">
							<a href="http://www.ikea.com" class="nav-right-banner idea" target="_blank">
								<span>이케아 All locations</span>
							</a>
						</div>
					</nav>
				</div>
			</section>
		</div>				
	</header>
<div class="login-frame"> 
         <div class="login-content"> 
         	<span id="login-close-button">×</span> 
             <div class="login-logo-line"><img alt="ikea-logo" src="https://uiux.newideas.kr/images/ikea-logo.svg" class="login-logo"></div>
             <form action="<%=request.getContextPath() %>/this14/login/login_action.jsp" method="POST" class="login-form" name="login_form"> 
               <input type="text" class="login-id" name="login-id" placeholder="아이디" value="<%=id %>" autofocus="autofocus" autocomplete="off"> 
               <label></label> 
               <input type="password" class="login-pw" name="login-pw" placeholder="비밀번호" autocomplete="off">
               <div id="login-msg"><%=loginMsg %></div>
               <div class="login-send" id="login-send">로그인</div> 
               <div class="login-footer"><a href="lookup_info.jsp" class="login-join">아이디/비밀번호 찾기</a>&nbsp;│&nbsp;<a 
               href="index.jsp?workgroup=user&work=join_step_01" class="login-join">회원가입</a></div> 
             </form> 
         </div> 
    </div>
    
    <script type="text/javascript">
	
	var frame=document.querySelector(".login-frame");
	var login=document.getElementById("top-nav-login"); 
	var close=document.getElementById("login-close-button");
	//var cancel=document.getElementById("login-cancel");
	var joinBtn=document.getElementsByClassName("login-join").item(0);
	var loginId=document.getElementsByClassName("login-id").item(0);
	var loginSend=document.getElementById("login-send");
	var loginMsg=document.getElementById("login-msg");
	
	function toggle() { 
		frame.classList.toggle("show-login-content");
		loginId.focus();
	}
	
	function windowOnClick() { 
		if(event.target===frame){
			toggle();   
		}
	}
	       
	login.addEventListener("click", toggle); 
	close.addEventListener("click", toggle); 
	//cancel.addEventListener("click", toggle); 
	window.addEventListener("click", windowOnClick, false);
	joinBtn.addEventListener("click", function(){
		location.href="join_step_01.jsp";
	});
	
	
	
	loginSend.addEventListener("click", function() {
		login_form.submit();	
		
	})
	
	frame.addEventListener("keypress", function(e) {
		if(e.keyCode==13){
			login_form.submit();
		}	
	})
	
	</script>
	<%
	if(!loginMsg.equals("")){
		out.println(jsSrc);
		System.out.println(jsSrc);
	}  
	%>