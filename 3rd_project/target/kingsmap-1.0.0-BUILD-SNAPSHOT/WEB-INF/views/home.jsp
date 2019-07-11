<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.will.kingsmap_mybatis.dto.MapDTO"%>
<%@ page import="it.will.kingsmap_mybatis.dto.MaplistDTO"%>
<%@ page import="it.will.kingsmap_mybatis.dao.MapDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
	ArrayList<MapDTO> dtos = new ArrayList<MapDTO>();
	dtos = (ArrayList<MapDTO>) request.getAttribute("list");
%>

<head>


<meta charset="UTF-8">
<title>KingsMAP</title>

<link rel="stylesheet" href="/kingsmap/css/bootstrap.css">
<link rel="stylesheet" href="/kingsmap/css/a.css">
<link rel="stylesheet" href="/kingsmap/css/custooom.css">

<link rel="stylesheet" href="/kingsmap/css/main.css">
<link rel="stylesheet" href="/kingsmap/css/style.css">
<link rel="stylesheet" href="/kingsmap/css/a.css">
<link rel="stylesheet" href="/kingsmap/css/admin.css">

<script src="/kingsmap/js/bootstrap.js"></script>

<script type="text/javascript" src="/kingsmap/js/common.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=D_PL3LAc0PQf1j39b2jc&submodules=geocoder"></script>
<script type="text/javascript" src="../src/MarkerClustering.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
.jb-wrap {
	margin: 10px auto;
	position: relative;
}

.jb-wrap img {
	background-size: 150px;
	width: auto%;
	vertical-align: middle;
}

.jb-text {
	size: 5px;
	padding: 5px 10px;
	line-height: 0.5px;
	text-align: center;
	color: #ffffff;
	font-size: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>

<body>

	<c:if test="${adminLogin!=null }">
		<c:choose>
			<c:when test="${adminSession!=null }">
				<button type="button" name="button" id="menu">
					<span class="on"></span> <span class="on"></span> <span class="on"></span>
				</button>
				<div class="admin-frame admin-frame-click">
					<div class="admin-wrapper">
						<h3>
							관리자용 UPLOAD PAGE&nbsp;&nbsp;
							<button type="button" id="logout">logout</button>
						</h3>
						<br> <br>
						<form method="post" enctype="multipart/form-data" id="excel-input">
							<select class="selectType" name="type">
								<option value="0" selected="selected">TYPE</option>
								<option value="1">아파트(매매)</option>
								<option value="2">아파트(전.월세)</option>
								<option value="3">빌라(매매)</option>
								<option value="4">빌라(전.월세)</option>
								<option value="5">단독주택(매매)</option>
								<option value="6">단독주택(전.월세)</option>
								<option value="7">공시지가</option>
							</select>
							<div class="fileBox">
								<label for="uploadBtn" class="btn_file">File Search</label> <input
									type="file" name="excelFile" id="uploadBtn" class="uploadBtn">
								<input type="text" class="fileName" readonly="readonly">
							</div>
						</form>
						<div class="previewBtn">PREVIEW</div>
						<div class="updateBtn">UPLOAD</div>
						<br>
						<div id="msg"></div>
						<div id="error"></div>
					</div>
					<div class="excel-preview"></div>
					<div id="loadingImg"></div>
					<div id="updatingImg"></div>
			</c:when>
			<c:otherwise>
				<div class="admin-frame admin-login">
					<div id="login-wrapper">
						<div id="login-form">
							<p>관리자 로그인</p>
							<br>
							<p class="info-msg">등록된 이메일로 인증코드를 받을 수 있습니다.</p>
							<form method="POST" id="login-input">
								<table id="login-table">
									<tr>
										<td><input type="text" id="email" name="email"
											placeholder="EMAIL"></td>
									</tr>
									<tr>
										<td><input type="text" id="code" name="code"
											placeholder="CODE"></td>
									</tr>
									<tr>
										<td><button type="button" id="codeBtn">인증코드 발급</button></td>
									</tr>
									<tr>
										<td><button type="button" id="loginBtn">로그인</button></td>
									</tr>
									<tr>
										<td id="cnttest"></td>
									</tr>
									<tr>
										<td id="loginMsg"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<script type="text/javascript">
						$("#codeBtn")
								.click(
										function() {
											$("#loginMsg").html("");
											$("#cnttest").html("");
											var email = $("#email").val();
											if (email == "") {
												$("#loginMsg").html(
														"이메일을 입력해 주세요.");
												return;
											}
											$
													.ajax({
														type : "POST",
														url : "admin/code",
														data : {
															"email" : email
														},
														dataType : "text",
														beforeSend : function() {
														},
														success : function(text) {
															if (text == "notemail") {
																$("#cnttest")
																		.html(
																				"");
																$("#loginMsg")
																		.html(
																				"등록된 이메일이 아닙니다.");
															} else {
																$("#cnttest")
																		.html(
																				"인증코드가 전송 되었습니다.");
																$
																		.ajax({
																			type : "POST",
																			url : "admin/sendemail",
																			data : {
																				"email" : email
																			},
																			error : function(
																					req) {
																				alert(req.status);
																			}
																		});

																var time = 60;
																var timeCnt = setInterval(
																		function() {
																			if (timeCnt > 1) {
																				clearInterval(timeCnt - 1);
																			}
																			time--;
																			$(
																					"#cnttest")
																					.html(
																							"인증코드 유효시간 : "
																									+ time
																									+ "초");
																			if (time <= 0) {
																				clearInterval(timeCnt);
																				$(
																						"#cnttest")
																						.html(
																								"유효시간 만료");
																				$
																						.ajax({
																							type : "POST",
																							url : "admin/code",
																							data : {
																								"email" : email
																							},
																							error : function(
																									req) {
																								alert(req.status);
																							}
																						});
																			}
																		}, 1000);
															}
														},
														error : function(req) {
															alert(req.status);
														}
													});
										});

						$("#loginBtn").click(function() {
							$("#loginMsg").html("");

							var email = $("#email").val();
							var code = $("#code").val();
							if (email == "") {
								$("#loginMsg").html("이메일을 입력해 주세요.");
								return;
							}
							if (code == "") {
								$("#loginMsg").html("인증코드를 입력해 주세요.");
								return;
							}

							$.ajax({
								type : "POST",
								url : "admin/login",
								data : {
									"email" : email,
									"code" : code
								},
								dataType : "text",
								success : function(text) {
									if (text == "notemail") {
										$("#loginMsg").html("등록된 이메일이 아닙니다.");
									}
									if (text == "notcode") {
										$("#loginMsg").html("인증코드가 맞지 않습니다.");

									}
									if (text == "success") {
										$.ajax({
											type : "POST",
											url : "admin/code",
											data : {
												"email" : email
											},
											error : function(req) {
												alert(req.status);
											}
										});
										location.href = "/kingsmap/admin"
									}
								},
								error : function(req) {
									alert(req.status);
								}
							});
						});
					</script>
			</c:otherwise>
		</c:choose>
		</div>
	</c:if>


	<nav class="navbar navbar-default" style="margin-bottom:0px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/kingsmap" style="font-size: 50px; margin:auto; padding:35px;">KINGS MAP</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<!-- 	<li><a href="index.jsp">재건축</a></li>
					<li><a href="find.jsp">지역찾기</a></li>
					<li><a href="box.jsp">자료<span id="unread"
							class="label label-info"></span></a></li> -->
				<!-- 	<li><a href="javascript:void(0);" onclick="loadBoard();">게시판</a></li> -->
				<!-- 	<li><a href="https://open.kakao.com/o/gIkU42ib"> 오픈채팅방 </a></li>
					<li><a href="https://open.kakao.com/o/s8BN52ib"> 1:1 문의 </a></li> -->
				</ul>


			
				
				<div id="rebuildNames" style="width: 500px; float: left; height: auto; overflow: auto;  margin: auto; left:50%; transform: translateX(50%);">
				<div id="rightView" style="background-color: #006dcc;">
					<table class="table">
						<thead>
							<tr>
								<th>지역(시, 도)</th>
								<!-- <th>검색</th> -->
								<th>지역(구)</th>
								<th>사업단계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style ="text-align: center;"><select class="bCity" id="bCity"
									onchange="searchbyCity(this)">
										<option value="전체">전체</option>
										<option value="부산시">부산시</option>
										<option value="경기도">경기도</option>
										<option value="인천시">인천시</option>
										<option value="대전시">대전시</option>
								</select></th>
								<!-- <th>검색어?</th> -->
								<th style ="text-align: center;"><select class="bArea" id="bArea"
									onchange="searchbyArea()">

								</select></th>
								<th style ="text-align: center;"> <select class="bStep" id="bStep"
									onchange="searchbyStep()">
										<option value="전체">전체</option>
										<option value="아파트">아파트</option>
										<option value="공동주택">빌라(다세대)</option>
										<option value="단독">단독(다가구)</option>
								</select></th>
							</tr>
						</tbody>
					</table>
				
				</div>		
				
			
				</div>
			<form class="navbar-form navbar-left" style="margin-top: 20px; float: left; transform: translateX(98%);">
					<div class="form-group">
						<input id="searchKey" type="text" class="form-control"
							placeholder="아파트,빌라 이름 검색.">
					</div>
					<button type="button" class="btn btn-default"
						onclick="searchgunchuck();">검색</button>
				</form>


				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript:void(0);" onclick="loadBoard();">게시판</a></li>
					<li><a onclick="window.open('https://open.kakao.com/o/gIkU42ib');">
					<img src = "/kingsmap/images/15.png" > OpenChat </a></li>
					<li><a onclick="window.open('https://open.kakao.com/o/s8BN52ib');">
					<img src = "/kingsmap/images/15.png" > 1:1 Q&A </a></li>
				
					<li class="dropdown"><a href="/kingsmap/admin" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="container" style="width: 100%; height: 100%;">
		<div id="map" style="width: 100%; height: 870px; float: left;">
		</div>
		<div id="infogunchuck" class="infogunchuck"
			style="position: absolute; left: 150px; width: 500px; height: auto;">
		</div>
		<div id="searchgunchuck" class="searchgunchuck"
			style="position: absolute; left: 150px; width: 500px; height: auto;">
		</div>
		<div id="selectcate"
			style="position: absolute; right: 40%; height: auto;"></div>
		<div id="selectyun"
			style="position: absolute; right: 50%; height: auto;"></div>
		<div id="plusitem" class="plusitem"
			style="position: absolute; right: 430px; width: 400px; height: auto;">
		</div>
		<!-- 게시판 위치 -->
		<div id="boardSpace" class="boardSpace"
			style="position: absolute; padding-left: 5px; float: right; right: 0%; height: 800px; width: 430px; background-color: white; display: none; z-index: 200; overflow: scroll;">
		</div>
		<div style="position: absolute; right: 40%; height: auto;">
			<!-- <div id="rebuildNames" style="width: 500px; float: right; height: auto; overflow: auto;">
				<div id="rightView" style="background-color: #ffffff;">
					<table class="table">
						<thead>
							<tr>
								<th>지역</th>
								<th>검색</th>
								<th>지역</th>
								<th>사업단계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><select class="bCity" id="bCity"
									onchange="searchbyCity(this)">
										<option value="전체">전체</option>
										<option value="부산시">부산시</option>
										<option value="경기도">경기도</option>
										<option value="인천시">인천시</option>
										<option value="대전시">대전시</option>
								</select></th>
								<th>검색어?</th>
								<th><select class="bArea" id="bArea"
									onchange="searchbyArea()">

								</select></th>
								<th><select class="bStep" id="bStep"
									onchange="searchbyStep()">
										<option value="전체">전체</option>
										<option value="아파트">아파트</option>
										<option value="공동주택">빌라(다세대)</option>
										<option value="단독">단독(다가구)</option>
								</select></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div> -->
		</div>
		<div id="map_tool" class="map-tool-div">
			<div
				style="width: 46px; position: absolute; top: 200px; text-align: right; left: 5%;">
				<div id="map_c_btn1_a" class="map-tool-btn-area"
					style="height: 55px; width: 55px;">
					<div id="cadastral" style="background-color: #86c7ffa1;text-align: center;border: 2px solid #006dcc;font-size: 18px;min-height: 55px;vertical-align: middle;padding-top: 13px;cursor: pointer;">
						지적도
					</div>
				</div>
			</div>
			
			<!-- <div
				style="width: 46px; position: absolute; top: 200px; text-align: right; right: 10%;">
				<div id="map_c_btn1_a" class="map-tool-btn-area"
					style="height: 44px; width: 44px;">
					<div id="streeticon">
						<img src="images/btn1.png">
					</div>
				</div>
			</div> -->
			
		</div>
	</div>
	<script>
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(35.128635, 128.97044),
			zoom : 10,
			zoomControl : true,
			minZoom : 1,
			mapTypeControl : true,
			mapTypeControlOptions : {
				style : naver.maps.MapTypeControlStyle.DROPDOWN
			}
		});

		//var oSlider = new nhn.api.map.ZoomControl();
		//console.log(oSlider);

		var markerlist = []; //정비구역마크
		var gongdonglist = []; //공동주택마크 리스트

		var markersDong = []; // 동 기준 마크

		//마커 클릭시 번호얻기
		function getNum() {
			var bNum = $('.rebuildNum1').val();
			console.log(bNum);
		}

		//지적도바꾸기 =====================================================================
		var cadastralLayer = new naver.maps.CadastralLayer();
		var btn = $('#cadastral');

		naver.maps.Event.addListener(map, 'cadastralLayer_changed', function(
				cadastralLayer) {
			if (cadastralLayer) {
				btn.addClass('control-on');
			} else {
				btn.removeClass('control-on');
			}
		});

		cadastralLayer.setMap(null);
		btn.on("click", function(e) {
			e.preventDefault();
			if (cadastralLayer.getMap()) {
				cadastralLayer.setMap(null);
			} else {
				cadastralLayer.setMap(map);
			}
		});
		//지적도바꾸기 =====================================================================

		//로드뷰가져오기=====================================================================	

		var streetLayer = new naver.maps.StreetLayer();

		var btn = $('#streeticon');

		naver.maps.Event.addListener(map, 'streetLayer_changed', function(
				streetLayer) {
			if (streetLayer) {
				btn.addClass('control-on');
			} else {
				btn.removeClass('control-on');
			}
		});

		streetLayer.setMap(null);

		btn.on("click", function(e) {
			e.preventDefault();

			if (streetLayer.getMap()) {
				streetLayer.setMap(null);
			} else {
				streetLayer.setMap(map);
			}
		});

		//로드뷰가져오기=====================================================================	

		//오른쪽 구역클릭시 줌인
		function detailFunction(Xposition, Yposition) {
			//$("table").html('<h1>클릭</h1>');
			console.log(Xposition);
			console.log(Yposition);
			var position = new naver.maps.LatLng(Xposition, Yposition);
			map.setCenter(position);
			map.setZoom(12, true);
		}

		//정비구역 해당검색 건축물대장 와드
		function addMarkerOptionGunchuck(bXposition, bYposition) {

			var markerOptions = {
				position : new naver.maps.LatLng(bYposition, bXposition),
				map : map,
				icon : {
					url : '/kingsmap/images/gunchuck1.jpg',
					size : new naver.maps.Size(22, 35),
					origin : new naver.maps.Point(0, 0),
					anchor : new naver.maps.Point(6, 6)
				}
			};
			return markerOptions;
		}

		//해당지역의 건축물대장
		function getgunchuck(aa) {

			var num = aa;
			var bCate = $('#rightView_bCate').html();
			var bZone = $('#rightView_bZone').html();
			console.log(bCate);
			console.log(bZone);
			console.log(num);

			var markers = [];
			var infowindows = [];
			var marker;
			var infowindow;

			for (var i = 0; i < gongdonglist.length; i++) {
				gongdonglist[i].setMap(null);
			}

			$
					.ajax({
						type : 'POST',
						url : './GunchuckListbybArea',
						//dataType: "json",
						data : {
							bCate : bCate,
							bZone : bZone,
							num : num
						},
						success : function(data) {
							var result = data;
							var i;

							for (i = 0; i < result.length; i++) {

								console.log(result.length);
								var markerOptions = addMarkerOptionGunchuck(
										result[i].gunXposition,
										result[i].gunYposition);

								marker = new naver.maps.Marker(markerOptions);

								markers.push(marker);
								gongdonglist.push(marker);

							}
							for (var c = 0; c < markers.length; c++) {
								naver.maps.Event.addListener(markers[c],
										'click', getClickHandler(c, markers,
												infowindows));
							}
						}
					});

		}

		//분양정보
		function bunyanginfo() {
			var bCate = $('#rightView_bCate').html();
			var bZone = $('#rightView_bZone').html();
			$
					.ajax({
						type : 'POST',
						url : './getBunyanginfo',
						//dataType: "json",
						data : {
							bCate : bCate,
							bZone : bZone
						},
						success : function(data) {

							var Message = data.Message;
							console.log(Message);

							$('#plusitem').html('');
							if (Message == 0) {
								$('#plusitem')
										.append(
												'<div class="detailZone">'
														+ '<table class="type09">'
														+ '<thead>'
														+ '<tr>'
														+ '<th scope="col">'
														+ '</th>'
														+ '<th scope="col" colspan="3">'
														+ '</th>'
														+ '</tr>'
														+ '</thead>'
														+ //타이틀

														'<tbody>'
														+ '<tr>'
														+ '<th scope="row">총세대수</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>임대제외</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '</tbody>'
														+ '</table>'
														+

														'<table class="type09" style="margin-top:20px;">'
														+ '<thead>'
														+ '<tr>'
														+ '<th scope="col">분양계획</th>'
														+ '<th scope="col" colspan="3">사업시행인가X'
														+ '</th>'
														+ '</tr>'
														+ '</thead>'
														+ //타이틀
														'<tbody>'
														+ '<tr>'
														+ '<th scope="row">39타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>95타입</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">49타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>101타입</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">51타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>112타입</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">59타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>115타입</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">66타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>120타입</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">72타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>132타입</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">84타입</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>확인</th>'
														+ '<th>'
														+ '끝'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">39임대</th>'
														+ '<th>'
														+ '</th>'
														+ '<th>49임대</th>'
														+ '<th>'
														+ '</th>'
														+ '</tr>'
														+ '</tbody>'
														+ '</table>'
														+ '</div>'
														+ '<div><button onclick="bunyanginfo()">사업성</button></div>'
														+ '<div>dd</div>'
														+ '<div>버튼3</div>'
														+ '<div><button onclick="closeitemplus()">닫기</button></div>');

							} else {
								$('#plusitem')
										.append(
												'<div class="detailZone">'
														+ '<table class="type09">'
														+ '<thead>' + '<tr>'
														+ '<th scope="col">'
														+ data.mdtos[0].gosiCate
														+ '</th>'
														+ '<th scope="col" colspan="3">'
														+ data.mdtos[0].gosiZone
														+ '</th>'
														+ '</tr>'
														+ '</thead>'
														+ //타이틀

														'<tbody>'
														+ '<tr>'
														+ '<th scope="row">총세대수</th>'
														+ '<th>'
														+ data.mdtos[0].totalmember
														+ '</th>'
														+ '<th>임대제외</th>'
														+ '<th>'
														+ data.mdtos[0].realmember
														+ '</th>'
														+ '</tr>'
														+ '</tbody>'
														+ '</table>'
														+

														'<table class="type09" style="margin-top:20px;">'
														+ '<thead>'
														+ '<tr>'
														+ '<th scope="col">분양계획</th>'
														+ '<th scope="col" colspan="3">분양계획O'
														+ '</th>'
														+ '</tr>'
														+ '</thead>'
														+ //타이틀

														'<tbody>'
														+ '<tr>'
														+ '<th scope="row">39타입</th>'
														+ '<th>'
														+ data.mdtos[0].ThreeNine
														+ '</th>'
														+ '<th>95타입</th>'
														+ '<th>'
														+ data.mdtos[0].ninefive
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">49타입</th>'
														+ '<th>'
														+ data.mdtos[0].fourNine
														+ '</th>'
														+ '<th>101타입</th>'
														+ '<th>'
														+ data.mdtos[0].onezeroone
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">51타입</th>'
														+ '<th>'
														+ data.mdtos[0].fiveone
														+ '</th>'
														+ '<th>112타입</th>'
														+ '<th>'
														+ data.mdtos[0].oneonetwo
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">59타입</th>'
														+ '<th>'
														+ data.mdtos[0].fiveNine
														+ '</th>'
														+ '<th>115타입</th>'
														+ '<th>'
														+ data.mdtos[0].oneonefive
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">66타입</th>'
														+ '<th>'
														+ data.mdtos[0].sixsix
														+ '</th>'
														+ '<th>120타입</th>'
														+ '<th>'
														+ data.mdtos[0].onetwozero
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">72타입</th>'
														+ '<th>'
														+ data.mdtos[0].seventwo
														+ '</th>'
														+ '<th>132타입</th>'
														+ '<th>'
														+ data.mdtos[0].onethreetwo
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">84타입</th>'
														+ '<th>'
														+ data.mdtos[0].eightfour
														+ '</th>'
														+ '<th>확인</th>'
														+ '<th>'
														+ '끝'
														+ '</th>'
														+ '</tr>'
														+ '<tr>'
														+ '<th scope="row">39임대</th>'
														+ '<th>'
														+ data.mdtos[0].ThreeNineim
														+ '</th>'
														+ '<th>49임대</th>'
														+ '<th>'
														+ data.mdtos[0].fourNineim
														+ '</th>'
														+ '</tr>'
														+ '</tbody>'
														+ '</table>'
														+ '</div>'
														+ '<div><button onclick="bunyanginfo()">사업성</button></div>'
														+ '<div>dd</div>'
														+ '<div>버튼3</div>'
														+ '<div><button onclick="closeitemplus()">닫기</button></div>');
							}
						}
					});
			document.getElementById("plusitem").style.backgroundColor = "#ffffff";
		}

		function closeitemplus() {
			$('#plusitem').html('');
		}

		//마커클릭이벤트
		function getClickHandler(i, markers, infoWindows) {
			return function(e) {
				console.log(i);
				console.log(markers[i]);
				console.log(infoWindows[i]);

				var marker = markers[i], infoWindow = infoWindows[i];

				if (infoWindow.getMap()) {
					infoWindow.close();
				} else {
					infoWindow.open(map, marker);
					getNum();
				}
			}
		}

		//마커지우기
		function removeMarker(markers) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
		}
	</script>

	<script type="text/javascript">
		function searchmap() {
			var busan = $('#busan').val();
			$.ajax({
				type : 'POST',
				url : './listbusan',
				//dataType: "json",
				data : {
					busan : busan
				},
				success : function(data) {
					var result = data;
					var i;
					for (i = 0; i < result.length; i++) {
						console.log(result[i].bZone);
					}
				}
			});
		}

		//리스트보여주기
		function addRebuildlist(bCate, bZone, bXposition, bYposition, bStep,
				bArea) {
			$('#Rebuildlist').append(
					'<tr>' + '<th>' + bCate + '</th>'
							+ '<th style=""><button onclick="detailFunction('
							+ bYposition + ',' + bXposition + ');";>' + bZone
							+ '</th>' + '<th>' + bStep + '</th>' + '<th>'
							+ bArea + '</th>' + '</tr>');
		}

		//더블 셀렉트박스
		function searchbyCity(e) {
			var bCity_busan = [ "전체", "중구", "서구", "동구", "영도구", "진구", "동래구",
					"남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구",
					"사상구", "기장군" ];
			var bCity_inchun = [ "계양구", "부평구", "남구" ];
			var target = document.getElementById("bArea");

			if (e.value == "부산시")
				var bCity = bCity_busan;
			else if (e.value == "인천시")
				var bCity = bCity_inchun;

			target.options.length = 0;

			for (x in bCity) {
				var opt = document.createElement("option");
				opt.value = bCity[x];
				opt.innerHTML = bCity[x];
				target.appendChild(opt);
			}
		}

		//경과일 구하기
		function daybetween(inday) {

			var today = new Date();

			if (inday != null) {
				var inday = inday.split('-');
			} else {
				return 0;
			}

			var month = today.getUTCMonth() + 1;
			var day = today.getUTCDate();
			var year = today.getUTCFullYear();

			var endToday = new Date(year, month, day);
			var startDay = new Date(inday[0], inday[1], inday[2]);

			var betweenday = (endToday.getTime() - startDay.getTime())
					/ (1000 * 60 * 60 * 24);

			return betweenday;
		}

		//=================================================여기서부터
		//=================================================여기서부터

		//마크 눌렀을때 나오는정보
		function addcontentString(bldNm, platPlc) {
			var contentString = [
					'<div class="out_marker" id="addmarker">',
					'<div class="in_marker" style="margin:1px; background-color:#5963D9; border-radius: 15px;">',
					'	<div><span style="margin:10px; color:white; font-weight:bold;">' + bldNm 
						+'&nbsp;&nbsp;<img onclick="infogunchuckDetail(' + "'" + platPlc + "'" + ');"'
						+ 'src="/kingsmap/images/Info.png" style="width:25px; height:25px; cursor: pointer;">'
						+'</span></div>',
					'	<div><span style="margin:10px; color:white; font-weight:bold;">' + platPlc + '</span></div>',
				/* 	'	<div><span style="margin:10px"><button onclick="infogunchuckDetail('
							+ "'"
							+ platPlc
							+ "'"
							+ ');";><img src="/kingsmap/images/Info.png" style="width:32px; height:32px;"></button></span></div>', */
					'</div>', '</div>' ].join('');

			return contentString;
		}

		//======================================자치구, 건축물정보
		function searchbyStep() {

			var AreaID = $('#bArea').val();
			var stepID = $('#bStep').val();

			console.log(AreaID);
			console.log(stepID);

			var markers = [];
			var infowindows = [];
			var marker;
			var infowindow;

			$.ajax({
				type : 'POST',
				url : './Listgunchuck',
				//dataType: "json",
				data : {
					AreaID : AreaID,
					stepID : stepID
				},
				success : function(data) {
					var result = data;
					var i;
					console.log(result);
					/* alert(result); */
	
					for (var i = 0; i < markerlist.length; i++) {
						markerlist[i].setMap(null);
					}

					for (i = 0; i < result.length; i++) {

						var contentString = addcontentString(result[i].bldNm,
								result[i].platPlc);
						var markerOptions = addMarkerOption(
								result[i].gunXposition, result[i].gunYposition,
								result[i].platPlc, stepID);

						marker = new naver.maps.Marker(markerOptions);

						infowindow = new naver.maps.InfoWindow({

							content : contentString,
							borderWidth : 0,
							disableAnchor : true,
							backgroundColor : 'transparent',

							pixelOffset : new naver.maps.Point(10, 0)
						});

						markers.push(marker);
						markerlist.push(marker);
						infowindows.push(infowindow);

					}
					for (var c = 0; c < markers.length; c++) {
						naver.maps.Event.addListener(markers[c], 'click',
								getClickHandler(c, markers, infowindows));

						naver.maps.Event.addListener(markers[c], 'mouseover',
								getClickHandler(c, markers, infowindows));
					}

				}
			});
		}

		//=======================================해당지역으로 검색
		//마커의 상세보기를 클릭하였을때(건축물대장 상세)
		function infogunchuckDetail(platPlc) {

			var platPlc = platPlc;
			console.log(platPlc);

			$('#searchlist').remove();
			$('#infogunchuck').html('');
			$
					.ajax({
						type : 'POST',
						url : './detailgunchuck',
						data : {
							platPlc : platPlc
						},
						success : function(data) {
							var result = data;
							var pNum = 0;
							console.log(result);

							for (var i = 0; i < result.mdtos.length; i++) {
								var pNum = Number(pNum)
										+ Number(result.mdtos[i].hhldCnt);
							}

							$('#infogunchuck')
									.append(
											'<div id="infoitem" style="background:#ffffff; height:800px; overflow:auto;">'

													+ '<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">'

													+ '<thead>'
													+ '<tr>'
													+ '<th colspan="1">주소</th>'
													+ '<th colspan="2" id="platPlc">'
													+ result.mdtos[0].platPlc
													+ '</th>'
													+ '</tr>'
													+ '</thead>'

													+ '<thead>'
													+ '<tr>'
													+ '<th colspan="1">도로명주소</th>'
													+ '<th colspan="2">'
													+ result.mdtos[0].newPlatPlc
													+ '</th>'
													+ '</tr>'
													+ '</thead>'

													+ '<tbody>'
													+ '<tr>'

													+ '<td>'
													+ '이름'
													+ '</td>'
													+ '<td colspan="2">'
													+ result.mdtos[0].bldNm
													+ '</td>'
													+ '</tr>'

													+ '<td>'
													+ '준공일'
													+ '</td>'
													+ '<td colspan="2">'
													+ result.mdtos[0].useAprDay
													+ '</td>'
													+ '</tr>'

													+ '<td>'
													+ '세대수'
													+ '</td>'
													+ '<td colspan="2">'
													+ pNum
													+ '</td>'
													+ '</tr>'

													+ '</tbody>'
													+ '</table>'

													+ '<div id="chart1" >'
													+ '<canvas id="mixChart2" style="display: block; height: 235px; width: 400px;"></canvas>'
													+ '</div>'

													//각동정보
													+ '<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">'
													+ '<thead>'
													+ '<tr>'
													+ '<th colspan="1" style="width=33%">대장</th>'
													+ '<th colspan="1" style="width=33%">동명칭</th>'
													+ '<th colspan="1" style="width=33%">주용도</th>'
													+ '</tr>'
													+ '</thead>'

													+ '<tbody id="addinfodong">'
													+ '</tbody>'
													+ '</table>'

													+ '<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">'
													+ '<thead>'
													+ '<tr>'
													+ '<th colspan="4" id="dongNm">'
													+ result.mdtos[0].dongNm
													+ '동정보</th>'
													+ '</tr>'
													+ '</thead>'

													+ '<tbody>'

													+ '<tr>'
													+ '<td>이름'
													+ '</td>'
													+ '<td id="bldNm">'
													+ result.mdtos[0].bldNm
													+ '</td>'
													+ '<td>'
													+ '주용도'
													+ '</td>'
													+ '<td id="mainPurpsCdNm">'
													+ result.mdtos[0].mainPurpsCdNm
													+ '</td>'
													+ '</tr>'

													+ '<tr>'
													+ '<td>'
													+ '주구조'
													+ '</td>'
													+ '<td id="etcStrct">'
													+ result.mdtos[0].etcStrct
													+ '</td>'
													+ '<td>'
													+ '대지면적'
													+ '</td>'
													+ '<td id="platArea">'
													+ result.mdtos[0].platArea
													+ '</td>'
													+ '</tr>'

													+ '<tr>'
													+ '<td>'
													+ '건축면적'
													+ '</td>'
													+ '<td id="archArea">'
													+ result.mdtos[0].archArea
													+ '</td>'
													+ '<td>'
													+ '연면적'
													+ '</td>'
													+ '<td id="totArea">'
													+ result.mdtos[0].totArea
													+ '</td>'
													+ '</tr>'

													+ '<tr>'
													+ '<td>'
													+ '건폐율'
													+ '</td>'
													+ '<td id="bcRat">'
													+ result.mdtos[0].bcRat
													+ '</td>'
													+ '<td>'
													+ '용적률'
													+ '</td>'
													+ '<td id="vlRat">'
													+ result.mdtos[0].vlRat
													+ '</td>'
													+ '</tr>'

													+ '<tr>'
													+ '<td>'
													+ '지상 층'
													+ '</td>'
													+ '<td id="grndFlrCnt">'
													+ result.mdtos[0].grndFlrCnt
													+ '</td>'
													+ '<td>'
													+ '세대수'
													+ '</td>'
													+ '<td id="hhldCnt">'
													+ result.mdtos[0].hhldCnt
													+ '</td>'
													+ '</tr>'

													+ '</tbody>'

													+ '</table>'

													+ '<div style="background:#ffffff;">'
													+ '<div><button type="button" class="btn btn-primary" onclick="closeinfogunchuck()">닫기</button></div>'
													+ '</div>');

							for (var i = 0; i < result.mdtos.length; i++) {

								addgunchuckdong(result.mdtos[i].dongNm,
										result.mdtos[i].mainPurpsCdNm);

							}

							//
							$(document).ready(function() {
								//alert(platPlc);
								$("#chart1").load("chart", {
									platPlc : platPlc
								}, function(data) {
									//alert(platPlc);
								});
								/*   $.post("chart", {platPlc : platPlc}, function(data){
								  	alert(platPlc);
								  }); */

							});
							//
						}
					})
		}

		function addgunchuckdong(dongNm, mainPurpsCdNm) {
			$('#addinfodong').append(
					'<tr onclick="clickDong(' + "'" + dongNm + "'" + ",'"
							+ mainPurpsCdNm + "'" + ');">'
							+ '<td colspan="1">표제부</td>' + '<td colspan="1">'
							+ dongNm + '</td>' + '<td colspan="1">'
							+ mainPurpsCdNm + '</td>' + '</tr>');
		}

		function clickDong(dongNm, mainPurpsCdNm) {

			var platPlc = $('#platPlc').html();
			var dongNm = dongNm;

			console.log(platPlc);
			console.log(dongNm);

			$.ajax({
				type : 'POST',
				url : './getOneGunchuckinfo',
				data : {
					platPlc : platPlc,
					dongNm : dongNm
				},
				success : function(data) {
					result = data;
					console.log('동클릭')
					console.log(result);
					var platPlc = $('#dongNm').html(result[0].dongNm + '동');
					var platPlc = $('#bldNm').html(result[0].bldNm);
					var platPlc = $('#mainPurpsCdNm').html(
							result[0].mainPurpsCdNm);
					var platPlc = $('#etcStrct').html(result[0].etcStrct);
					var platPlc = $('#platArea').html(result[0].platArea);
					var platPlc = $('#archArea').html(result[0].archArea);
					var platPlc = $('#totArea').html(result[0].totArea);
					var platPlc = $('#bcRat').html(result[0].bcRat);
					var platPlc = $('#vlRat').html(result[0].vlRat);
					var platPlc = $('#grndFlrCnt').html(result[0].grndFlrCnt);
					var platPlc = $('#hhldCnt').html(result[0].hhldCnt);

				}
			});

		}

		//닫기
		function closeinfogunchuck() {
			$('#infogunchuck').html('');
		}

		//정비구역 해당검색 마크추가 (html 내용을 더 넣기)
		function addMarkerOption(bXposition, bYposition, platPlc, stepID) {

			console.log('addMarkerOption');
			console.log(bXposition);
			console.log(platPlc);

			var platPlc = platPlc;
			var stepID = stepID;
			var result;
			var trading; //실거래가
			var contract; //면적

			if (stepID == "아파트") {
				$.ajax({
					type : 'POST',
					url : './getAptsill',
					async : false,
					data : {
						platPlc : platPlc
					},
					success : function(data) {
						result = data;
						//console.log(result[0].trading);
						if(result == ""){
							trading = "";
							contract = "";
						} else{
							trading = result[0].trading;
							console.log(trading+"제대로된 가격");
							contract = String((Number(result[0].contract).toFixed(1))+" ㎡");
							
						}

					}
				});

				var markerOptions = {
					position : new naver.maps.LatLng(bYposition, bXposition),
					map : map,
					icon : {
						content : [

								'<div class="jb-wrap">',
								'<div class="jb-image"><img src="/kingsmap/images/Bmarker.png" alt=""></div>',
								'<div class="jb-text">',
								'<p style = "font-size:12px; font-weight: bold margin: 0 0 auto; width: 40px";>'
										+trading + '</p><p>&nbsp;</p>',
								'<p>' + contract + '</p>', '</div>', '</div>'

						].join(''),
						size : new naver.maps.Size(38, 58),
						anchor : new naver.maps.Point(19, 58),
					}
				};
			}

			if (stepID == "공동주택") {
				$.ajax({
					type : 'POST',
					url : './getBillLastsill',
					async : false,
					data : {
						platPlc : platPlc
					},
					success : function(data) {
						result = data;
						//console.log(result[0].trading);
						trading = result[0].trading;
						contract = Number(result[0].silcontract).toFixed(1);

					}
				});

				var markerOptions = {
					position : new naver.maps.LatLng(bYposition, bXposition),
					map : map,
					icon : {
						content : [
								'<div class="jb-wrap">',
								'<div class="jb-image"><img src="/kingsmap/images/Bmarker.png" alt=""></div>',
								'<div class="jb-text">',
								'<p style "font-size:8px";>' + trading + '<p>',
								'<p>' + contract + '㎡<p>', '</div>', '</div>' ]
								.join(''),
						size : new naver.maps.Size(38, 58),
						anchor : new naver.maps.Point(19, 58),
					}
				};
			}

			return markerOptions;
		}

		//var mapzoom = map.zoomControl.getElement();

		//============================================지도 줌이 달라졌을때 동보여주기

		var inter = setInterval(function() {
			//console.log(mapzoom);
			//console.log(mapzoom.childElement());		
			var zoom = map.zoom;
			var today = new Date();
			var month = today.getMonth() + 1;
			var year = today.getFullYear();
			var stepID = $('#bStep').val();

			var markers = [];
			var infowindows = [];
			var marker;
			var infowindow;

			if (month < 10) {
				month = '0' + month;
			}

			if (zoom < 9) {
				console.log('낮음')
				clearInterval(inter);
				for (var i = 0; i < markerlist.length; i++) {
					markerlist[i].setMap(null);
				}

				if (stepID == '아파트') {
					$.ajax({
						type : 'POST',
						url : './getdongAvgsill',
						async : false,
						data : {
							year : year,
							month : month,

						},
						success : function(data) {
							result = data;
							//console.log(result[0].trading);
							console.log(result);
							var i;
							console.log(result);

							for (i = 0; i < result.length; i++) {

								var contentString = addcontentString(
										result[i].addrold, result[i].price);

								var markerOptions = DongMarkerOption(
										result[i].xposi, result[i].yposi,
										result[i].addrold, result[i].price);

								marker = new naver.maps.Marker(markerOptions);

								infowindow = new naver.maps.InfoWindow({

									content : contentString,
									borderWidth : 0,
									disableAnchor : true,
									backgroundColor : 'transparent',

									pixelOffset : new naver.maps.Point(10, 0)
								});

								markers.push(marker);
								markerlist.push(marker);
								infowindows.push(infowindow);

							}
							for (var c = 0; c < markers.length; c++) {
								naver.maps.Event.addListener(markers[c],
										'click', getClickHandler(c, markers,
												infowindows));

								naver.maps.Event.addListener(markers[c],
										'mouseover', getClickHandler(c,
												markers, infowindows));
							}

						}
					});
				}
			}

		}, 2000);

		//동마크 (html 내용을 더 넣기)
		function DongMarkerOption(bXposition, bYposition, addrold, price) {

			console.log('addMarkerOption');
			console.log(bXposition);
			console.log(addrold);

			var addrold = addrold;
			var price = price;

			var markerOptions = {
				position : new naver.maps.LatLng(bYposition, bXposition),
				map : map,
				icon : {
					content : [
							'<div class="jb-wrap">',
							'<div class="jb-image"><img src="/kingsmap/images/Bmarker.png" alt=""></div>',
							'<div class="jb-text">', '<h>' + trading + '<h>',
							'<p>' + contract + '㎡<p>', '</div>', '</div>' ]
							.join(''),
					size : new naver.maps.Size(38, 58),
					anchor : new naver.maps.Point(19, 58),
				}
			};

			return markerOptions;
		}

		//================================ 게시판 불러오기
		function loadBoard() {
			$("#boardSpace").load("comment");
			$("#boardSpace").show();
			$("a[href='javascript:void(0);']").attr("onclick","closeBoard();")
		}
		
		function closeBoard(){
			$("#boardSpace").hide();
			$("a[href='javascript:void(0);']").attr("onclick","loadBoard();")
		}

		//================================ 아파트검색
		function searchgunchuck() {

			var searchKey = $('#searchKey').val();
			console.log('서치');
			console.log(searchKey);

			$
					.ajax({
						type : 'POST',
						url : './searchgunchuck',
						data : {
							searchKey : searchKey
						},
						success : function(data) {
							result = data;
							console.log(result);

							$('#searchlist').remove();
							$('#searchgunchuck')
									.append(
											'<div id="searchlist" style="background:#ffffff; height:800px; overflow:auto;">'

													+ '<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">'

													+ '<thead>'
													+ '<tr>'
													+ '<th colspan="1" style="width:30%">이름</th>'
													+ '<th colspan="1" style="width:69%">주소</th>'
													+ '</th>'
													+ '</tr>'
													+ '</thead>'

													+ '<tbody id="searchList">'
													+ '</tbody>'

													+ '</table>'

													+ '<div style="background:#ffffff;">'
													+ '<div><button type="button" class="btn btn-primary" onclick="closeinfogunchuck()">닫기</button></div>'
													+ '</div>');

							//console.log(result[0].trading);

							for (var i = 0; i < result.length; i++) {

								addSearchList(result[i].bldNm,
										result[i].platPlc,
										result[i].gunXposition,
										result[i].gunYposition);

							}
						}
					});

		}

		function addSearchList(bldNm, platPlc, gunXposition, gunYposition) {

			$('#searchList').append(
					'<tr onclick="infogunchuckDetail(' + "'" + platPlc + "'"
							+ '); clickSearchList(' + "'" + gunXposition + "'"
							+ ",'" + gunYposition + "'" + ');">'
							+ '<td colspan="1">' + bldNm + '</td>'
							+ '<td colspan="1">' + platPlc + '</td>'
							+ '<td colspan="1" style="display:none;">'
							+ gunXposition + '</td>'
							+ '<td colspan="1" style="display:none;">'
							+ gunYposition + '</td>' + '</tr>');

		}

		function clickSearchList(gunXposition, gunYposition) {

			//console.log(gunXposition);
			//console.log(gunYposition);

			var position = new naver.maps.LatLng(gunYposition, gunXposition);
			map.setCenter(position);
			map.setZoom(12, true);

		}
	</script>
	<script type="text/javascript" src="/kingsmap/js/admin.js"></script>

</body>
</html>