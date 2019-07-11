
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	if(session.getAttribute("loginUser")==null){
		response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
		return;
	}
	
	UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");
	
	String[] phone=loginUser.getuPhone().split("-");
	String[] email=loginUser.getuEmail().split("@");
%>
    
<jsp:include page="/this14/header.jsp"/>
<link href="css/default_shop.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<div id="allContent">
<div id="mainPadding">
	<div class="mbskin mbbox">

    <form id="fregisterform" name="fregisterform" action="user_edit_action.jsp"  onsubmit="return userEditSubmit()" method="post" autocomplete="off">
    <div class="tbl_frm01 tbl_wrap">
		<h1 style="text-align:center;">회원 정보 수정</h1>
        <table>
        <caption>사이트 이용정보 입력</caption>
        <tbody>
        <tr>
            <th scope="row" class="top_line"><label for="reg_mb_id">아이디</label></th>
            <td class="top_line">
                <%--<span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span> --%>
                <input type="text" name="mb_id" id="reg_mb_id" class="frm_input required" readonly value="<%=loginUser.getuId() %>">
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_password">비밀번호</label></th>
            <td>
            	<input type="password" name="mb_password" id="reg_mb_password" class="frm_input required" >
            	<span class="error_msg" id="msg_password_edit">비밀번호를 변경할 경우에만 입력하세요.</span>
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_password_re">비밀번호 확인</label></th>
            <td>
            	<input type="password" name="mb_password_re" id="reg_mb_password_re" class="frm_input required" >
            	<span class="error_msg" id="msg_password_re_edit"></span>
            </td>
        </tr>
        </tbody>
        </table>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>개인정보 입력</caption>
        <tbody>
        <tr>
            <th scope="row" class="top_line"><label for="reg_mb_name">이름</label></th>
            <td class="top_line">
            	<input type="text" id="reg_mb_name" name="mb_name" class="frm_input required" size="20" value="<%=loginUser.getuName() %>">
            	<span class="error_msg" id="msg_name"></span>
            </td>
        </tr>
            
        <tr>
            <th scope="row"><label for="reg_mb_hp">휴대폰번호</label></th>
            <td>
	            <%--<input type="text" name="mb_hp1" id="reg_mb_hp1" class="frm_input required" value="010" style="width:30px;" readonly>  --%>
	            <select id="reg_mb_hp1" class="frm_input" name="mb_hp1">
	            	<option value="010" <%if(phone[0].equals("010")){%> selected <%} %>>010</option>
	            	<option value="011" <%if(phone[0].equals("011")){%> selected <%} %>>011</option>
	            	<option value="016" <%if(phone[0].equals("016")){%> selected <%} %>>016</option>
	            	<option value="017" <%if(phone[0].equals("017")){%> selected <%} %>>017</option>
	            	<option value="018" <%if(phone[0].equals("018")){%> selected <%} %>>018</option>
	            	<option value="019" <%if(phone[0].equals("019")){%> selected <%} %>>019</option>
	            </select>
				- <input type="text" name="mb_hp2" id="reg_mb_hp2" class="frm_input required" size="4" maxlength="4" value="<%=phone[1]%>">
				- <input type="text" name="mb_hp3" id="reg_mb_hp3" class="frm_input required" size="4" maxlength="4"value="<%=phone[2]%>">
                
            	<span class="error_msg" id="msg_hp"></span>
            </td>
        </tr>

        <tr>
            <th scope="row"><label for="reg_mb_email">E-mail</label></th>
            <td>
                <input type="text" name="mb_email1" id="reg_mb_email" class="frm_input email required" size="20" value="<%=email[0] %>"> @
                <input type="text" name="mb_email2" id="email_enter" class="frm_input" size="10" <% if(!email[1].equals("naver.com") && !email[1].equals("daum.net") && !email[1].equals("google.com") ){%>style="display:inline;"<%}else{%>style="display:none;"<%}%> value="<%=email[1] %>">
                <select id="email_select" class="frm_input">
                	<option>선택</option>
                	<option <% if(email[1].equals("naver.com")){ out.print("selected"); }%>>naver.com</option>
                	<option <% if(email[1].equals("daum.net")){ out.print("selected"); }%>>daum.net</option>
                	<option <% if(email[1].equals("google.com")){ out.print("selected"); }%>>google.com</option>
                	<option <% if(!email[1].equals("naver.com") && !email[1].equals("daum.net") && !email[1].equals("google.com") ){ out.print("selected"); }%>>직접입력</option>
                </select>
                <span class="error_msg" id="msg_email"></span>
            </td>
        </tr>
        
        
        <tr>
            <th scope="row">주소</th>
            <td>
                <label for="reg_mb_zip" class="sound_only">우편번호 앞자리</label>
			    <input type="text" name="mb_zip" id="reg_mb_zip" class="frm_input required" size="5" maxlength="6"  readonly value="<%=loginUser.getuPost()%>">
			    <button type="button" class="btn_frmline" onclick="win_zip();">주소 검색</button><br>
			    <div id="wrap_zip" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			    <input type="text" name="mb_addr1" id="reg_mb_addr1" class="frm_input frm_address required" size="50" readonly value="<%=loginUser.getuAbasic()%>">
			    <label for="reg_mb_addr1">기본주소</label><br>
			    <input type="text" name="mb_addr2" id="reg_mb_addr2" class="frm_input frm_address" size="50" placeholder="주소 검색 후 상세주소를 작성해 주세요" value="<%=loginUser.getuAdetail()%>">
			    <label for="reg_mb_addr2">상세주소</label><br>
			    <span class="error_addr" id="msg_addr"></span>
            </td>
            
        </tr>
        </tbody>
        </table>
    </div>

    <div class="btn_confirm">
        <input type="submit" value="정보변경" id="btn_submit" class="btn_submit">
        <a href="user_detail.jsp" class="btn_cancel">취소</a>
    </div>
    </form>
    <script src="js/join.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('wrap_zip');
	
	    function foldDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_wrap.style.display = 'none';
	    }
	
	    function win_zip() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('reg_mb_zip').value = data.zonecode;
	                document.getElementById("reg_mb_addr1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("reg_mb_addr2").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';
	
	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	    }
	    
	</script>
</div>
</div>
</div>

<jsp:include page="/this14/footer.jsp"/>