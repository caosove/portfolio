<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>홍삼</title>

    <link rel="stylesheet" href="/kingsmap/css/bootstrap.css">
    <link rel="stylesheet" href="/kingsmap/css/common.css">
    <link rel="stylesheet" href="/kingsmap/css/main.css">
    <link rel="stylesheet" href="/kingsmap/css/style.css">
	<link rel="stylesheet" href="/kingsmap/css/a.css">

    <script type="text/javascript" src="/kingsmap/js/common.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

</head>

<body>
	<style>
		#header { <!-- css파일에서 안먹혀서 style태그로함.-->
			position:fixed;
			top:0;
			left:0;
			width:100%;
			border-bottom: 1px solid #d9d9d9;
			background:url("/hongsam/images/indexImage/bg.gif") repeat-x #fff;
			z-index:999999;
}
	</style>

    <script type="text/javascript">
        function Mfunction() {

            $('#gnb').css('height', '90px');
            $("#gnb ul li ul").css('height', '0px');

            $("#gnb > ul > li > a").bind('focusin mouseenter', function() {
                $("#gnb ul li ul").animate({
                    "height": "250px"
                }, 200);
                $("#gnb").animate({
                    "height": "330px"
                }, 200);

            });
            $("#gnb > ul > li > a").bind('touchstart', function() {
                $("#gnb ul li ul").animate({
                    "height": "250px"
                }, 200);
                $("#gnb").animate({
                    "height": "330px"
                }, 200);

            });
            $("#gnb > ul > li > a,#gnb > ul > li > ul").bind('focusin mouseenter', function() {
                $("#gnb > ul > li").removeClass("on");
                $(this).parent().addClass("on");
            });
            $("#header").mouseleave(function() {
                $("#gnb ul li ul").animate({
                    "height": "0px"
                }, 200);
                $("#gnb").animate({
                    "height": "90px"
                }, 200);
                $("#gnb > ul > li").removeClass("on");
            });
        }
    </script>

    <div id="header">
        <div class="wr">
            <div id="snb-wr">
                <ul id="snb1">
                    <li class="m1"><a href="#"><img src="/hongsam/images/indexImage/icon1.png"/>구매후기</a></li>
                    <li class="m2"><a href="#"><img src="/hongsam/images/indexImage/icon2.png"/>이벤트</a></li>
                </ul>
                <ul id="snb2">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">주문배송</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">가맹점창업</a></li>
                </ul>
            </div>
            <div id="gnb-wr" onclick="Mfunction();">
                <h1>
                    <!-- 배너관리에서 수정가능 --><a href="#" target=""><img src="/hongsam/images/indexImage/logo.gif" align="absmiddle"></a></h1>
                <div id="gnb">
                    <ul>
                        <li class="m1"><a href="#">백세인소개</a>
                            <ul>
                                <li><a href="#">백세인 정신</a></li>
                                <li><a href="#">CEO 인사말</a></li>
                                <li><a href="#">기업이념</a></li>
                                <li><a href="#">회사연혁</a></li>
                                <li><a href="#">브랜드 이야기</a></li>
                                <li><a href="#">오시는 길</a></li>
                            </ul>
                        </li>
                        <li class="m2"><a href="#">창립자 이창원</a>
                            <ul>
                                <li><a href="#">이창원 Storytelling</a></li>
                                <li><a href="#">걸어온길</a></li>
                            </ul>
                        </li>
                        <li class="m3"><a href="#">제품구매</a>
                            <ul>
                                <li style="background-color:#ca232a;"><a href="#" style="color:#ffffff;">제품구매</a></li>
                                <!--<li><a href="/shop/main/html.php?htmid=product/brand.htm">브랜드 이야기</a></li>
							<li><a href="/shop/main/html.php?htmid=product/product.htm">제품정보</a></li>
							<li><a href="http://100sein.com/shop/goods/goods_review.php">구매후기</a></li>-->



                            </ul>
                        </li>
                        <li class="m4"><a href="#">전체식 흑홍삼</a>
                            <ul>
                                <li><a href="#">전체식 흑홍삼</a></li>
                                <li><a href="#">고려인삼이야기</a></li>



                            </ul>
                        </li>
                        <li class="m5"><a href="#">수상내역</a>
                            <ul>
                                <li><a href="#">수상내역</a></li>
                                <li><a href="#">특허&인증서</a></li>
                                <li><a href="#">언론속의백세인</a></li>
                            </ul>
                        </li>

                        <li class="m5"><a href="#">R & D</a>
                            <ul>
                                <li><a href="#">R&D연혁</a></li>
                                <li><a href="#">미션&비전</a></li>
                                <li><a href="#">위생설비</a></li>
                                <!--<li><a href="/shop/board/list.php?&&id=service">백세사진봉사</a></li>
							<li><a href="/shop/board/list.php?&&id=active">사회공헌활동</a></li>-->
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div id="container">
    	<div id="location">
    		<div class="inner">
    			<h3>로그인</h3>
    			<p>
    				<a href="#"><img src="/hongsam/images/joinImage/home.gif" alt="HOME"></a>&nbsp;&nbsp;>&nbsp;&nbsp;멤버쉽&nbsp;&nbsp;>&nbsp;&nbsp;<span>로그인</span>
    			</p>
    		</div>
    	</div>
    	<div class="inner">
    		<div class="indiv">
    			<p class="con-tit">
    				<span>백세인</span>에 오신 것을 환영합니다.
    			</p>
    			<div class="member-wr">
    				<dl>
    					<dt>회원로그인</dt>
    					<dd>로그인을 하시면 홈페이지의 다양한 서비스를 이용하실 수 있습니다.</dd>
    				</dl>
    				<div class="login-wr">
    					<div class="login-form">
    						<form metod="post" action="./userLogin" id="form" name="from">
    							<input type="hidden" name="returnUrl" value="#">
    							<div>
    								<div style="float:left; font-family:'돋움'; font-size:11px; color:#666666;">보안
    								</div>
    								<div style="font-family:'VERDANA'; font-size:9px; color:#4499fa;font-weight:bold;">ON</div>
    							</div>
    							<input type="text" placeholder="아이디" name="userID" size="20" tabindex="1">
    							<input type="password" placeholder="비밀번호" name="userPassword" size="20" tabindex="2">
    							<button style="margin-bottom:12px; border: none;" type="submit"><img src="/hongsam/images/joinImage/login.gif">
    							</button>
    						</form>
    					</div>
    						<div>
    							<dl class="login-join">
    								<dt>아직 회원이 아니신가요?</dt>
    								<dd>회원가입을 하시면 이벤트 참여 등<br>더 많은 서비스를 이용하실 수 있습니다.</dd>
    								<dd><a href="join.jsp">회원가입</a>
    							</dl>
    							<dl class="login-find">
    								<dt>아이디와 비밀번호를 잊으셨나요?</dt>
    								<dd>본인인증 절차를 통하여<br>아이디 / 비밀번호를 찾으실 수 잇습니다.</dd>
    								<dd><a href="#">아이디/비밀번호 찾기</a>
    							</dl>
    						</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>



   <div class="section" id="section2">
                    <div id="footer">
                        <div class="wr">
                            <div class="ft-con">

                            </div>
                        </div>
                        <div class="ft-bottom">
                            <div class="wr">
                                <div class="ft-sns">
                                    <p><img src="../data/skin/mera_ws/assets/img/footer/sns.png" alt="" /></p>
                                    <ul>
                                        <li><a href="#" target="_blank"><img src="/hongsam/images/indexImage/indexSns1.png" alt="" /></a></li>
                                        <li><a href="#" target="_blank"><img src="/hongsam/images/indexImage/indexSns2.png" alt="" /></a></li>
                                        <!--li><a href="#" target="_blank"><img src="/shop/data/skin/assets/img/footer/sns3.png" alt="" /></a></li-->
                                        <li><a href="#" target="_blank"><img src="/hongsam/images/indexImage/indexSns3.png" alt="" /></a></li>
                                        <li><a href="#" target="_blank"><img src="/hongsam/images/indexImage/indexSns4.png" alt="" /></a></li>
                                    </ul>
                                </div>
                                <div class="ft-notice">
                                    <p><a href="#"><img src="/hongsam/images/indexImage/notice.png" alt="" /></a></p>
                                    <ul>
                                        <li><a href="#">백세인은 안전합니다</a><span>2018-10-12</span></li>
                                        <li><a href="#">2018년추석연휴 배송안내입니다</a><span>2018-09-18</span></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="wr">
                            <ul>
                                <li><a href="#">회사소개</a></li>
                                <li><a href="#">이용약관</a></li>
                                <li><a href="#">개인정보처리방침</a></li>
                                <li><a href="#">이메일 무단수집거부</a></li>
                            </ul>
                            <div class="ft-address">
                                <div>
                                    <p>농업회사법인주식회사 한국흑홍삼 <br />
                                        고객서비스센터 1599-0388 / 운영시간 : 월~금 09:00 ~ 18:00 (점심 12:00~13:00) / 공휴일 휴무<br />
                                        충남 홍성군 갈산면 갈산로150번길 115 (주)한국흑홍삼 백세인 대표이사 : 이창원 / 개인정보관리책임자: 이화연경 / 메일:<a href="javascript:popup('http://www.100sein.com/shop/proc/popup_email.php?to=100sein03@naver.com&amp;hidden=1',650,600)" style="font-size:13px;">100sein03@naver.com</a><br />
                                        사업자등록번호: 220-86-41458 / 통신판매업신고번호:제2005-충남홍성-18호 / 건강기능식품판매업 영업신고증 제2005-0473069호 <br />
                                    </p>
                                    <p>
                                        COPYRIGHT ⓒ <strong>www.100sein.com</strong> ALL RIGHT RESERVED
                                    </p>
                                </div>
                            </div>
                            <div class="EggBanner"></div>
                        </div>
                    </div>
                </div>


</body>

</html>