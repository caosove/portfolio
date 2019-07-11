
var idSubmit=false;
var pwdSubmit=false;
var nameSubmit=false;
var phoneSubmit=false;
var emailSubmit=false;
var addrSubmit=false;

var idEditSubmit=true;
var pwdEditSubmit=true;
var nameEditSubmit=true;
var phoneEditSubmit=true;
var emailEditSubmit=true;
var addrEditSubmit=true;


//아이디 체크
	/*$("#reg_mb_id").blur(function(){
		$("#msg_id").css("color","red");
		var regId=/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/;
		if($(this).val()==""){
			$("#msg_id").text("필수 항목 입니다.");
		} else if(!$(this).val().match(regId)){
			$("#msg_id").text("아이디는 영문자와 숫자를 포함하고 6~12자리로 입력해야 합니다.");
		} else{
			$("#msg_id").css("color","blue");
			$("#msg_id").text("확인");
		}
	})*/

	$("#reg_mb_password").keyup(function(){
		pwdEditSubmit=false;
	})
	
//비밀번호 체크
	$("#reg_mb_password").blur(function(){
		pwdSubmit=false;
		$("#msg_password").css("color","red");
		$("#msg_password_edit").css("color","red");
		var regPwd=/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
		if($(this).val()==""){
			$("#msg_password").text("필수 항목 입니다.");
			$("#msg_password_edit").css("color","black");
			$("#msg_password_edit").text("비밀번호를 변경할 경우에만 입력하세요.");
		} else if(!$(this).val().match(regPwd)){
			$("#msg_password").text("비밀번호는 영문자,숫자,특수문자가 포함된 8~16자리로 입력해야 합니다.");
			$("#msg_password_edit").text("비밀번호는 영문자,숫자,특수문자가 포함된 8~16자리로 입력해야 합니다.");
		} else{
			$("#msg_password").css("color","blue");
			$("#msg_password_edit").css("color","blue");
			$("#msg_password").text("확인");
			$("#msg_password_edit").text("확인");
		}
	})
	$("#reg_mb_password").keydown(function(){
		$("#reg_mb_password_re").val("");
		$("#msg_password_re").text("");
	})
	
//비밀번호 확인 체크
	$("#reg_mb_password_re").keyup(function(){
		pwdSubmit=false;
		pwdEditSubmit=false;
		$("#msg_password_re").css("color","red");
		$("#msg_password_re_edit").css("color","red");
		if($(this).val()!=""){
			if($(this).val()!=$("#reg_mb_password").val()){
				$("#msg_password_re").text("비밀번호가 일치하지 않습니다.");
				$("#msg_password_re_edit").text("비밀번호가 일치하지 않습니다.");
			} else{
				$("#msg_password_re").css("color","blue");
				$("#msg_password_re_edit").css("color","blue");
				$("#msg_password_re").text("확인");
				$("#msg_password_re_edit").text("확인");
				pwdSubmit=true;
				pwdEditSubmit=true;
			}
		} else if($(this).val()==""){
			$("#msg_password_re").text("비밀번호를 한번 더 입력해 주세요.");
			$("#msg_password_re_edit").text("");
		}
	})
	
//이름 체크
$("#reg_mb_name").blur(function(){
	nameSubmit=false;
	nameEditSubmit=false;
	$("#msg_name").css("color","red");
	var regName=/^[가-힇a-zA-Z]{2,6}$/g;
	if($(this).val()==""){
		$("#msg_name").text("필수 항목 입니다.");
	} else if(!$(this).val().match(regName)){
		$("#msg_name").text("잘못된 형식 입니다.");
	} else{
		$("#msg_name").css("color","blue");
		$("#msg_name").text("○");
		nameSubmit=true;
		nameEditSubmit=true;
	}
})
	

//전화번호 체크
$("#reg_mb_hp2").blur(function(){
	phoneNum=$("#reg_mb_hp1").val()+"-"+$("#reg_mb_hp2").val()+"-"+$("#reg_mb_hp3").val();
	phoneSubmit=false;
	phoneEditSubmit=false;
	$("#msg_hp").css("color","red");
	var regPh=/(01[016789])-(\d{4})-(\d{4})/g;
	if($("#reg_mb_hp2").val()==""){
		$("#msg_hp").text("필수 항목 입니다.");
	} else if(!phoneNum.match(regPh)){
		$("#msg_hp").text("");
	} else{
		$("#msg_hp").css("color","blue");
		$("#msg_hp").text("○");
		phoneSubmit=true;
		phoneEditSubmit=true;
	}
})

$("#reg_mb_hp3").blur(function(){
	phoneNum=$("#reg_mb_hp1").val()+"-"+$("#reg_mb_hp2").val()+"-"+$("#reg_mb_hp3").val();
	phoneSubmit=false;
	phoneEditSubmit=false;
	$("#msg_hp").css("color","red");
	var regPh=/(01[016789])-(\d{4})-(\d{4})/g;
	if($("#reg_mb_hp2").val()=="" || $("#reg_mb_hp3").val()==""){
		$("#msg_hp").text("필수 항목 입니다.");
	} else if(!phoneNum.match(regPh)){
		$("#msg_hp").text("잘못된 형식 입니다.");
	} else{
		$("#msg_hp").css("color","blue");
		$("#msg_hp").text("○");
		phoneSubmit=true;
		phoneEditSubmit=true;
	}
})


//이메일 체크
	$("#reg_mb_email").blur(function(){
		emailSubmit=false;
		emailEditSubmit=false;
	//alert($("#email_select").val())
		if($(this).val()==""){
			$("#msg_email").css("color","red");
			$("#msg_email").text("필수 항목 입니다.");
			return false;
		} else {
			if($("#email_select").val()=="선택") {
				$("#msg_email").css("color","red");
				$("#msg_email").text("이메일을 선택하세요");
				return;
			}
			$("#msg_email").text(emailCheck());
		}
	})
	
//이메일 직접입력
	$("#email_select").change(function(){
		emailSubmit=false;
		emailEditSubmit=false;
		$("#msg_email").css("color","red");
		//alert($(this).val())
		$("#email_enter").val("");
		if($(this).val()=="직접입력"){
			$("#msg_email").text("");
			$("#email_enter").css("display","inline");
			$("#email_enter").focus();
		} else if($(this).val()=="선택") {
			$("#msg_email").text("이메일을 선택하세요");
		} else if($(this).val()=="naver.com" || $(this).val()=="daum.net" || $(this).val()=="google.com"){
			$("#email_enter").css("display","none");
			$("#email_enter").val($(this).val());
			$("#msg_email").text(emailCheck());
		} 
		//alert($("#email_enter").val());
	})
	
//입력 메일서버 확인
	$("#email_enter").blur(function(){
		emailSubmit=false;
		emailEditSubmit=false;
		$("#msg_email").css("color","red");
		$("#msg_email").text(emailCheck());
	})
	
//이메일 유효성 검사 함수
	function emailCheck(){
		$("#msg_email").css("color","red");
		var regEmail=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/g;
		var email=$("#reg_mb_email").val()+"@"+$("#email_enter").val();
		//alert(email);
		if(!email.match(regEmail)||email.length>20){
			return "이메일 형식이 잘못 입력 되었습니다";
		}else {
			emailSubmit=true;
			emailEditSubmit=true;
			$("#msg_email").css("color","blue");
			return "○";	
		}
	}
	
//주소 체크
	$("#reg_mb_addr2").blur(function(){
		addrSubmit=false;
		var regAddr=/^([가-힇\w_-]+)([가-힇\w_-\s]*){1,20}$/g;
		$("#msg_addr").css("color","red");
		if($(this).val()==""||$("#reg_mb_addr1").val()==""){
			$("#msg_addr").text("필수 항목 입니다.");
		} else if(!$(this).val().match(regAddr)){
			$("#msg_addr").text("잘못된 형식 입니다.");
		} else if($("#reg_mb_addr1").val()!=""||$(this).val()!=""){
			$("#msg_addr").css("color","blue");
			$("#msg_addr").text("○");
			addrSubmit=true;
			addrEditSubmit=true;
		}
	})

	function joinSubmit(){
		if($("#reg_mb_id").val()!="") idSubmit=true;
		
		if(!idSubmit) {
			$("#reg_mb_id").focus();
			$("#msg_id").css("color","red");
			$("#msg_id").text("아이디를 다시 확인 하세요.");
			return false;
		} 
		if(!pwdSubmit) {
			$("#reg_mb_password").focus();
			$("#msg_password").css("color","red");
			$("#msg_password").text("비밀번호를 다시 확인 하세요.");
			return false;
		}
		if(!nameSubmit) {
			$("#reg_mb_name").focus();
			$("#msg_name").css("color","red");
			$("#msg_name").text("이름을 다시 확인 하세요.");
			return false;
		}
		if(!phoneSubmit) {
			$("#reg_mb_hp").focus();
			$("#msg_hp").css("color","red");
			$("#msg_hp").text("전화번호를 다시 확인 하세요.");
			return false;
		}
		if(!emailSubmit) {
			$("#reg_mb_email").focus();
			$("#msg_email").css("color","red");
			$("#msg_email").text("이메일을 다시 확인 하세요.");
			return false;
		}
		if(!addrSubmit) {
			$("#reg_mb_addr").focus();
			$("#msg_addr").css("color","red");
			$("#msg_addr").text("주소를 다시 확인 하세요.");
			return false;
		}
	}

	function userEditSubmit(){
		if(!pwdEditSubmit) {
			$("#reg_mb_password_re").focus();
			$("#msg_password_re").css("color","red");
			$("#msg_password_re").text("비밀번호를 다시 확인 하세요.");
			return false;
		}
		if(!nameEditSubmit) {
			$("#reg_mb_name").focus();
			$("#msg_name").css("color","red");
			$("#msg_name").text("이름을 다시 확인 하세요.");
			return false;
		}
		if(!phoneEditSubmit) {
			$("#reg_mb_hp").focus();
			$("#msg_hp").css("color","red");
			$("#msg_hp").text("전화번호를 다시 확인 하세요.");
			return false;
		}
		if(!emailEditSubmit) {
			$("#reg_mb_email").focus();
			$("#msg_email").css("color","red");
			$("#msg_email").text("이메일을 다시 확인 하세요.");
			return false;
		}
		if(!addrEditSubmit) {
			$("#reg_mb_addr").focus();
			$("#msg_addr").css("color","red");
			$("#msg_addr").text("주소를 다시 확인 하세요.");
			return false;
		}
	}
	