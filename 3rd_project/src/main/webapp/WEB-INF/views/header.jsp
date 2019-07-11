<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
	<style>
#header {<!--css파일에서 안먹혀서 style태그로함.--> position:fixed;
	top: 0;
	left: 0;
	width: 100%;
	border-bottom: 1px solid #d9d9d9;
	background: url("/kingsmap/images/bg.gif") repeat-x #fff;
	z-index: 999999;
}

table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #666666;
	font-Size: 18px;
	border-bottom: 3px solid #000000;
}

table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #ffffff;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

body {
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 500px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>



	<script type="text/javascript">
		function Mfunction() {

			$('#gnb').css('height', '60px');
			$("#gnb ul li ul").css('height', '0px');

			$("#gnb > ul > li > a").bind('focusin mouseenter', function() {
				$("#gnb ul li ul").animate({
					"height" : "200px"
				}, 200);
				$("#gnb").animate({
					"height" : "200px"
				}, 200);

			});
			$("#gnb > ul > li > a").bind('touchstart', function() {
				$("#gnb ul li ul").animate({
					"height" : "200px"
				}, 200);
				$("#gnb").animate({
					"height" : "200px"
				}, 200);

			});
			$("#gnb > ul > li > a,#gnb > ul > li > ul").bind(
					'focusin mouseenter', function() {
						$("#gnb > ul > li").removeClass("on");
						$(this).parent().addClass("on");
					});
			$("#header").mouseleave(function() {
				$("#gnb ul li ul").animate({
					"height" : "0px"
				}, 200);
				$("#gnb").animate({
					"height" : "60px"
				}, 200);
				$("#gnb > ul > li").removeClass("on");
			});
		}
	</script>

	<div id="header">
		<div class="wr">
			<div id="snb-wr">
				<ul id="snb1">
					<!--
                    <li class="m1"><a href="#"><img src="/hongsam/images/indexImage/icon1.png"/>구매후기</a></li>
                    <li class="m2"><a href="#"><img src="/hongsam/images/indexImage/icon2.png"/>이벤트</a></li>
                	-->
				</ul>
				<ul id="snb2">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">#</a></li>
				</ul>
			</div>
			<div id="gnb-wr" onclick="Mfunction();">
				<h1>
					<!-- 배너관리에서 수정가능 -->
					<a href="#" target=""><img src="/kingsmap/images/logo.jpg"
						style="width: 80px; height: 80px;" align="absmiddle"></a>
				</h1>
				<div id="gnb">
					<ul>
						<li class="m1"><a href="#">재개발</a>
							<ul>
								<li><button type="button" id="busan" value="부산시"
										onClick="searchmap();">부산시</button></li>
								<li>영동구</li>
							</ul></li>
						<li class="m2"><a href="#">재건축</a>
							<ul>
								<li><button type="button" id="getbill" value="getbill"
										onClick="searchbill();">다세대</button></li>
								<li><button type="button" id="guName" value="guName"
										onClick="getgunchuck();">실거래</button></li>
							</ul></li>
						<li class="m3"><a href="#">게시판</a>
							<ul>
								<li><a href="#">#</a></li>
							</ul></li>
						<li class="m4"><a href="#">#</a>
							<ul>
								<li><a href="#">#</a></li>
							</ul></li>
						<li class="m5"><a href="#">#</a>
							<ul>
								<li><a href="#">#</a></li>
							</ul></li>

						<li class="m5"><a href="#">#</a>
							<ul>
								<li><a href="#">#</a></li>

							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>